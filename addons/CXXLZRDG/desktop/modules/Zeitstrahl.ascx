<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Zeitstrahl.ascx.cs" Inherits="ZRDG.modules.Zeitstrahl" %>

<link rel="stylesheet" href="<%=CMSPfad %>css/styleszrdg.css" type="text/css" />
<link rel="stylesheet" href="<%=CMSPfad %>js/flexslider.min.css" type="text/css" />
<link rel="stylesheet" href="<%=CMSPfad %>js/vis/vis.css" type="text/css" />
<link rel="stylesheet" href="<%=CMSPfad %>js/vis/vis-timeline-graph2d.min.css" type="text/css" />
<link rel="stylesheet" href="<%=CMSPfad %>js/lightbox2/lightbox.css">
<script type="text/javascript">
  if (window.jQuery == undefined) document.write('<script src="<%=CMSPfad %>js/jquery-1.11.0.min.js">\x3C/script>'); 
</script> 
<script type="text/javascript" src="<%=CMSPfad %>js/jquery.flexslider.js"></script>
<script type="text/javascript" src="<%=CMSPfad %>js/lightbox2/lightbox.js"></script>
<script type="text/javascript" src="<%=CMSPfad %>js/fctzeitstrahl.js"></script> 
<script type="text/javascript" src="<%=CMSPfad %>js/vis/vis.js"></script>

<asp:Panel ID="pnlZeitstrahl" runat="server">
  
  <asp:Repeater ID="rptEpocheSlider" runat="server">
    <HeaderTemplate>
      <section class="objects-epocheslider">
			  <div class="objects-epochesliderflexslider epocheslidercarousel">
          <ul class="epocheslider-list">
    </HeaderTemplate>
    <ItemTemplate>
            <li data-id="<%#Eval("ID") %>" class="epocheslider-item<%# (Eval("ID").ToString()==EpocheID ? " epocheslider-item_active":"") %>" style="display:none;">
              <a href="<%=ActiveSiteURL %>?ep=<%#Eval("ID") %>">
                <%# getObjectBildData(Eval("ID").ToString()) %>
							  <div class="epocheslider-item-titel"><%#Eval("Name") %></div>
							  <div class="epocheslider-item-year"><%#Eval("Jahr") %><%# (Eval("Jahrbis").ToString()!="" ? " - " + Eval("Jahrbis").ToString():"") %></div>
              </a>
						</li>
    </ItemTemplate>
    <FooterTemplate>
          </ul>
        </div>
      </section>
    </FooterTemplate>
  </asp:Repeater>

  <asp:HiddenField ID="hdnEpocheID" ClientIDMode="Static" runat="server" />
  <asp:Panel ID="pnlEpocheDetails" CssClass="objects-epochedetails-area" Visible="false" runat="server">
    <h1 class="zrdg-maintitle"><asp:Literal ID="litEpocheTitel" runat="server" /></h1>

    <div class="objects-epochedetails-description"><asp:Literal ID="litEpocheDesc" runat="server" /></div>
  </asp:Panel>

  <asp:Panel ID="pnlEpocheZeitstrahl" CssClass="objects-epoche-zeitstrahl-area" Visible="false" runat="server">
    
    <h1 class="zrdg-maintitle maintitle-zeitstrahl"><asp:Literal ID="litEpocheZeitstrahlTitel" Text="Zeitstrahl" runat="server" /></h1>
    <div class="objects-epoche-zeitstrahl-line">
      <asp:Repeater ID="rptZeitstrahlThemen" runat="server">
        <HeaderTemplate>        
          <ul class="epoche-zeitstrahl-themen-list">
        </HeaderTemplate>
        <ItemTemplate>            
            <li data-id="<%# Eval("ID") %>" class="epoche-zeitstrahl-themen-item zeistrahl-themecolor_<%# Eval("ID") %>">
              <label><input type="checkbox" value="<%# Eval("ID") %>"<%# (Container.ItemIndex==0 ? " checked":"") %> /><div class="zeitstrahl-theme-name"><%# Eval("Name") %></div></label>
            </li>
        </ItemTemplate>
        <FooterTemplate>
          </ul>
        </FooterTemplate>
      </asp:Repeater>
      <div id="epochezeitstrahl" class="objects-epoche-zeitstrahl-strahl">
      </div>

      <div style="clear:both;"></div>      
    </div>

    <div class="objects-epoche-zeitstrahl-content-area" style="display:none;">
      <h3 id="epochezeitstrahldetails_titel" class="zrdg-subtitle" style="display:none;"></h3>
      <div id="epochezeitstrahldetails_description" class="objects-epochezeitstrahldetails-description" style="display:none;"></div>
    </div>
  </asp:Panel>
    
  <asp:Panel ID="pnlEpocheBuecher" CssClass="objects-epoche-buecher-area" Visible="false" runat="server">
    <h3 class="zrdg-maintitle"><asp:Literal ID="litEpocheBuecherTitel" runat="server" /></h3>
    <div id="epochebuecher_description" class="objects-epoche-buecher-description" visible="false" runat="server"><asp:Literal ID="litEpocheBuecherDesc" runat="server" /></div>    
  </asp:Panel>

  <asp:Repeater ID="rptBuecherContent" runat="server">
      <HeaderTemplate>
        <div class="objects-epoche-buecher-content-area">
          <div class="objects-epoche-buecher-content">
            <h3 class="zrdg-subtitle"><%=strEpocheBuecherContentHead%></h3>
            <ul class="epoche-buecher-content-list">
      </HeaderTemplate>
      <ItemTemplate>
            <li class="epoche-buecher-content-item">
              <a class="epoche-buecher-content-link" href="<%# strBuecherPicURL+Eval("DokDatei").ToString().ToLower().Replace(".pdf",".jpg") %>" data-title="<%# Eval("DokTitel") %>" data-lightbox="buechercontent"><%# Eval("DokTitel") %></a>
              <i class="material-icons ico-epoche-buecher-arrow">chevron_right</i>
            </li>
      </ItemTemplate>
      <FooterTemplate>
            </ul>
          </div>
        </div>
      </FooterTemplate>
    </asp:Repeater>

</asp:Panel>