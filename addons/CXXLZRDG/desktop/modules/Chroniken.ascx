<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Chroniken.ascx.cs" Inherits="ZRDG.modules.Chroniken" %>

<link rel="stylesheet" href="<%=CMSPfad %>css/styleszrdg.css" type="text/css" media="screen" />
<script type="text/javascript">
  if (window.jQuery == undefined) document.write('<script src="<%=CMSPfad %>js/jquery-1.11.0.min.js">\x3C/script>'); 
</script> 
<script type="text/javascript" src="<%=CMSPfad %>js/fctchroniken.js"></script>      

<asp:HiddenField ID="hdnAktChronikVal" ClientIDMode="Static" runat="server" />
<asp:Literal ID="litChronikData" runat="server" />

<script type="text/javascript">
  function gotoobjectsperson(objid) {
    window.open('<%=ObjectsTrgURL%>?linkid=' + objid);
  }
  function gotoobjectsquelle(objid,seitenr) {
    window.open('<%=ObjectsTrgURL%>?linkid=' + objid + '&pgnr=' + seitenr);
  }
</script>