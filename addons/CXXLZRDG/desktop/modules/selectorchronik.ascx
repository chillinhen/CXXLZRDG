<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="selectorchronik.ascx.cs" Inherits="ZRDG.modules.selectorchronik" %>

<link rel="stylesheet" href="<%=CMSPfad %>css/styleszrdg.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=CMSPfad %>js/flexslider.min.css" type="text/css" media="screen" />

<script type="text/javascript">
  if (window.jQuery == undefined) document.write('<script src="<%=CMSPfad %>js/jquery-1.11.0.min.js">\x3C/script>'); 
</script> 
<script type="text/javascript" src="<%=CMSPfad %>js/jquery.flexslider.js"></script>
<script type="text/javascript" src="<%=CMSPfad %>js/jquery.event.drag-2.2.js"></script>
<script type="text/javascript" src="<%=CMSPfad %>js/jquery.event.drag.live-2.2.js"></script>
<script type="text/javascript" src="<%=CMSPfad %>js/fctselchroniken.js"></script>      

<asp:HiddenField ID="hdnStartChronikVal" ClientIDMode="Static" runat="server" />
<asp:Repeater ID="rptChronikYears" ClientIDMode="Static" runat="server">
  <HeaderTemplate>
    <div class="objects-selectorchronik-area">
      <ul class="objects-selectorchronik-itemslist">
  </HeaderTemplate>
  <ItemTemplate>
      <li class="objects-selectorchronik-items selectorchronik-items-val_<%# Eval("Jahr") %>"><a href="?mod=chronik&dtin=<%# Eval("Jahr") %>" target="_self"><%# Eval("Jahr") %></a></li>
  </ItemTemplate>
  <FooterTemplate>
      </ul>
    </div>
  </FooterTemplate>
</asp:Repeater>