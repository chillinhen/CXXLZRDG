using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Threading;
using System.Globalization;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.Net;
using System.Linq;
using System.Xml.Linq;
using System.Net.Mail;
using System.Xml;
using System.Security.Cryptography;
using System.Text;
using System.Collections;

namespace ZRDG
{
  public class Tools
  {
    private readonly string PasswordHash = "KE@@23ga0%d";
    private readonly string SaltKey = "S@Llx&KöÜ";
    private readonly string VIKey = "@1B2c5F6gdsadas43H8";

    public DataTable GetDateDay()
    {
      DataTable Tmpdt = new DataTable();
      Tmpdt.Columns.Add(new DataColumn("Wert"));

      DataRow row = Tmpdt.NewRow();
      row["Wert"] = "";
      Tmpdt.Rows.Add(row);
      for (int i = 1; i <= 31; i++)
      {
        row = Tmpdt.NewRow();
        row["Wert"] = (i.ToString()).PadLeft(2,'0');
        Tmpdt.Rows.Add(row);
      }

      return Tmpdt;
    }

    public DataTable GetDateMonth()
    {
      DataTable Tmpdt = new DataTable();
      Tmpdt.Columns.Add(new DataColumn("Wert"));

      DataRow row = Tmpdt.NewRow();
      row["Wert"] = "";
      Tmpdt.Rows.Add(row);
      for (int i = 1; i <= 12; i++)
      {
        row = Tmpdt.NewRow();
        row["Wert"] = (i.ToString()).PadLeft(2, '0');
        Tmpdt.Rows.Add(row);
      }

      return Tmpdt;
    }

    public DataTable GetDateYear(int From, int ToAdd, int Type)
    {
      DataTable Tmpdt = new DataTable();
      Tmpdt.Columns.Add(new DataColumn("Wert"));
      
      DataRow row = Tmpdt.NewRow();
      row["Wert"] = "";
      Tmpdt.Rows.Add(row);

      if (Type == 1)
      {
        for (int i = ToAdd; i >= From; i--)
        {
          row = Tmpdt.NewRow();
          row["Wert"] = i.ToString();
          Tmpdt.Rows.Add(row);
        }
      }
      else
      {
        for (int i = From; i <= (From + ToAdd); i++)
        {
          row = Tmpdt.NewRow();
          row["Wert"] = i.ToString();
          Tmpdt.Rows.Add(row);
        }
      }
      return Tmpdt;
    }
    
    public string [] GEOCoder(string Strasse, string PLZ, string Ort, string Land)
    {
      string[] GeoDaten = new string[2];

      switch (Land)
      {
        case "B":
          Land = "Belgien";
          break;
        case "NL":
          Land = "Niederlande";
          break;
        case "D":
          Land = "Deutschland";
          break;
        case "L":
          Land = "Luxemburg";
          break;
      }

      string URL = "http://maps.googleapis.com/maps/api/geocode/xml?address=" + Sonderzeichenencode(Strasse) + "," + PLZ + " " + Sonderzeichenencode(Ort) + "+" + Land + "&sensor=false";

      string XMLResult = GetPageAsString(URL);
      string[] GMap = { "", "" };
      XmlDocument xml = new XmlDocument();
      xml.LoadXml(XMLResult);

      XmlNodeList xnList = xml.SelectNodes("/GeocodeResponse/result/geometry/location");
      if (xnList.Count > 0)
      {
        foreach (XmlNode xn in xnList)
        {
          GeoDaten[0] = xn["lng"].InnerText.Replace('.', ','); //Laenge
          GeoDaten[1] = xn["lat"].InnerText.Replace('.', ','); //Breite
        }
      }

      return GeoDaten;
    }

    private string GetPageAsString(string address)
    {
      string result = "";

      try
      {
        // Create the web request   
        HttpWebRequest request = WebRequest.Create(address) as HttpWebRequest;

        // Get response   
        using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
        {
          // Get the response stream   
          StreamReader reader = new StreamReader(response.GetResponseStream());

          // Read the whole contents and return as a string   
          result = reader.ReadToEnd();
        }
      }
      catch (Exception ex)
      {
        SendEMail("service@demetec.net", "dev@demetec.net", "", "", "Fehler bei der GEOCode Auflösung. [DLSKulturerbe]", "Fehler bei der GEOCode Auflösung. [DLSKulturerbe]<br/><br/>Fuktion:GetPageAsString()<br/><br/>" + ex.Message.ToString(), 1, "");
      }

      return result;
    }

    public void HandleImageUpload(FileUpload FileData, string Path, int OrgHeight, int ThumbHeight)
    {
      if (!Directory.Exists(Path))
        Directory.CreateDirectory(@"" + Path);

      ImageCodecInfo iciJpegCodec = null;
      EncoderParameter epQuality = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 100L);
      ImageCodecInfo[] iciCodecs = ImageCodecInfo.GetImageEncoders();
      EncoderParameters epParameters = new EncoderParameters(1);
      epParameters.Param[0] = epQuality;
      for (int i = 0; i < iciCodecs.Length; i++)
      {
        if (iciCodecs[i].MimeType == "image/jpeg")
        {
          iciJpegCodec = iciCodecs[i];
          break;
        }
      }
      // Create a bitmap of the content of the fileUpload control in memory
      Bitmap originalBMP = new Bitmap(FileData.FileContent);

      string strFilename = FileData.FileName.Substring(0, FileData.FileName.LastIndexOf("."))+".jpg";

      if (OrgHeight < originalBMP.Height)
        (ImageResizing(originalBMP, OrgHeight, -1)).Save(Path + strFilename, iciJpegCodec, epParameters);
      else
        originalBMP.Save(Path + strFilename, iciJpegCodec, epParameters);        

      float tmpwidth = ((float)ThumbHeight / (float)originalBMP.Height) * (float)originalBMP.Width;
      if (tmpwidth <= 150)
        (ImageResizing(originalBMP, ThumbHeight, -1)).Save(Path + "t_" + strFilename, iciJpegCodec, epParameters);
      else
        (ImageResizing(originalBMP, -1, 150)).Save(Path + "t_" + strFilename, iciJpegCodec, epParameters);

      FileData.SaveAs(Path + "org_" + FileData.FileName);

      // Once finished with the bitmap objects, we deallocate them.
      originalBMP.Dispose();
      FileData.Dispose();
    }

    public void HandleMultiImageUpload(System.Drawing.Image FileData, string Path, string FileName, int OrgHeight, int ThumbHeight)
    {
      if (!Directory.Exists(Path))
        Directory.CreateDirectory(@"" + Path);

      ImageCodecInfo iciJpegCodec = null;
      EncoderParameter epQuality = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 100L);
      ImageCodecInfo[] iciCodecs = ImageCodecInfo.GetImageEncoders();
      EncoderParameters epParameters = new EncoderParameters(1);
      epParameters.Param[0] = epQuality;
      for (int i = 0; i < iciCodecs.Length; i++)
      {
        if (iciCodecs[i].MimeType == "image/jpeg")
        {
          iciJpegCodec = iciCodecs[i];
          break;
        }
      }
      // Create a bitmap of the content of the fileUpload control in memory
      Bitmap originalBMP = new Bitmap(FileData);

      if (OrgHeight < originalBMP.Height)
        (ImageResizing(originalBMP, OrgHeight, -1)).Save(Path + FileName, iciJpegCodec, epParameters);
      else
        originalBMP.Save(Path + FileName, iciJpegCodec, epParameters);

      float tmpwidth = ((float)ThumbHeight / (float)originalBMP.Height) * (float)originalBMP.Width;
      if (tmpwidth <= 150)
        (ImageResizing(originalBMP, ThumbHeight, -1)).Save(Path + "t_" + FileName, iciJpegCodec, epParameters);
      else
        (ImageResizing(originalBMP, -1, 150)).Save(Path + "t_" + FileName, iciJpegCodec, epParameters);

      FileData.Save(Path + "org_" + FileName);

      // Once finished with the bitmap objects, we deallocate them.
      originalBMP.Dispose();
      FileData.Dispose();
    }

    public Bitmap ImageResizing(Bitmap originalBMP, int newHeight, int newWidth)
    {
      // Calculate the new image dimensions
      int origWidth = originalBMP.Width;
      int origHeight = originalBMP.Height;

      if (newWidth == -1)
      {
        double Diff = Convert.ToDouble(newHeight) / Convert.ToDouble(origHeight);
        double TMPnewWidth = Convert.ToDouble(origWidth) * Diff;
        newWidth = Convert.ToInt32(TMPnewWidth);
      }
      else if (newHeight == -1)
      {
        double Diff = Convert.ToDouble(newWidth) / Convert.ToDouble(origWidth);
        double TMPnewHeight = Convert.ToDouble(origHeight) * Diff;
        newHeight = Convert.ToInt32(TMPnewHeight);
      }

      // Create a new bitmap which will hold the previous resized bitmap
      Bitmap newBMP = new Bitmap(originalBMP, newWidth, newHeight); // Create a graphic based on the new bitmap
      Graphics oGraphics = Graphics.FromImage(newBMP);

      // Set the properties for the new graphic file
      oGraphics.SmoothingMode = SmoothingMode.AntiAlias;
      oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

      // Draw the new graphic based on the resized bitmap
      oGraphics.DrawImage(originalBMP, 0, 0, newWidth, newHeight);

      oGraphics.Dispose();

      return newBMP;
    }

    public DataTable RemoveDuplicateRows(DataTable dTable, string colName)
    {
      Hashtable hTable = new Hashtable();
      ArrayList duplicateList = new ArrayList();

      //Add list of all the unique item value to hashtable, which stores combination of key, value pair.
      //And add duplicate item value in arraylist.
      foreach (DataRow drow in dTable.Rows)
      {
        if (hTable.Contains(drow[colName]))
          duplicateList.Add(drow);
        else
          hTable.Add(drow[colName], string.Empty);
      }

      //Removing a list of duplicate items from datatable.
      foreach (DataRow dRow in duplicateList)
        dTable.Rows.Remove(dRow);

      //Datatable which contains unique records will be return as output.
      return dTable;
    }

    public string Encrypt(string plainText)
    {
      byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);

      byte[] keyBytes = new Rfc2898DeriveBytes(PasswordHash, Encoding.ASCII.GetBytes(SaltKey)).GetBytes(256 / 8);
      var symmetricKey = new RijndaelManaged() { Mode = CipherMode.CBC, Padding = PaddingMode.Zeros };
      var encryptor = symmetricKey.CreateEncryptor(keyBytes, Encoding.ASCII.GetBytes(VIKey));

      byte[] cipherTextBytes;

      using (var memoryStream = new MemoryStream())
      {
        using (var cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write))
        {
          cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);
          cryptoStream.FlushFinalBlock();
          cipherTextBytes = memoryStream.ToArray();
          cryptoStream.Close();
        }
        memoryStream.Close();
      }
      return Convert.ToBase64String(cipherTextBytes);
    }

    public string Decrypt(string encryptedText)
    {
      byte[] cipherTextBytes = Convert.FromBase64String(encryptedText);
      byte[] keyBytes = new Rfc2898DeriveBytes(PasswordHash, Encoding.ASCII.GetBytes(SaltKey)).GetBytes(256 / 8);
      var symmetricKey = new RijndaelManaged() { Mode = CipherMode.CBC, Padding = PaddingMode.None };

      var decryptor = symmetricKey.CreateDecryptor(keyBytes, Encoding.ASCII.GetBytes(VIKey));
      var memoryStream = new MemoryStream(cipherTextBytes);
      var cryptoStream = new CryptoStream(memoryStream, decryptor, CryptoStreamMode.Read);
      byte[] plainTextBytes = new byte[cipherTextBytes.Length];

      int decryptedByteCount = cryptoStream.Read(plainTextBytes, 0, plainTextBytes.Length);
      memoryStream.Close();
      cryptoStream.Close();
      return Encoding.UTF8.GetString(plainTextBytes, 0, decryptedByteCount).TrimEnd("\0".ToCharArray());
    }

    public void SendEMail(string strfrom, string strto, string strcc, string strbcc, string strBetreff, string strNachricht, int ishtml, string ReplyTo)
    {
      Boolean boHTMLMail = true;
      if (ishtml != 1)
        boHTMLMail = false;
      /*
      strBetreff += " [An:" + strto + " - CC:" + strcc + "]";
      strto = "mm@demetec.net";
      strcc = "";
      */
      MailMessage mail = new MailMessage();
      MailAddress from = new MailAddress(strfrom);       
      mail.From = from;
      if (strto.Contains(";"))
      {
        foreach (string innermailto in strto.Split(';'))
          mail.To.Add(innermailto);
      }
      else
        mail.To.Add(strto);
      if (strcc != "")
      {
        if (strcc.Contains(";"))
        {
          foreach (string innermailcc in strcc.Split(';'))
            mail.CC.Add(innermailcc);
        }
        else
          mail.CC.Add(strcc);
      }
      if (strbcc != "")
      {
        if (strbcc.Contains(";"))
        {
          foreach (string innermailbcc in strbcc.Split(';'))
            mail.Bcc.Add(innermailbcc);
        }
        else
          mail.Bcc.Add(strbcc);
      }
      mail.IsBodyHtml = boHTMLMail;
      mail.Subject = strBetreff;
      mail.Body = strNachricht;
      if (ReplyTo != "")
        mail.Headers.Add("Reply-To", ReplyTo);
      string host = "mail.demetec.net";
      int port = 25;
      SmtpClient client = new SmtpClient(host, port);
      client.Send(mail);
    }

    public string Sonderzeichenencode(string str)
    {
      str = str.Replace("ü", "ue");
      str = str.Replace("ö", "oe");
      str = str.Replace("ä", "ae");
      str = str.Replace("ß", "ss");
      str = str.Replace("é", "e");
      str = str.Replace("è", "e");
      str = str.Replace("ê", "e");
      str = str.Replace("ç", "c");

      return str;
    }

    public string CheckforNull(object dat)
    {
      string tmp = "";

      if (dat != null)
        tmp = dat.ToString();

      return tmp;
    }

  }
}
