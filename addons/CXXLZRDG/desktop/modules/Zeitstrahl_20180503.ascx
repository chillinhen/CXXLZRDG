<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Zeitstrahl.ascx.cs" Inherits="ZRDG.modules.Zeitstrahl" %>

<link rel="stylesheet" href="<%=CMSPfad %>css/styleszrdg.css" type="text/css" />
<link rel="stylesheet" href="<%=CMSPfad %>js/flexslider.min.css" type="text/css" />
<link rel="stylesheet" href="<%=CMSPfad %>js/lightbox2/lightbox.css">
<script type="text/javascript">
  if (window.jQuery == undefined) document.write('<script src="<%=CMSPfad %>js/jquery-1.11.0.min.js">\x3C/script>'); 
</script> 
<script type="text/javascript" src="<%=CMSPfad %>js/jquery.flexslider.js"></script>
<script type="text/javascript" src="<%=CMSPfad %>js/lightbox2/lightbox.js"></script>
<script type="text/javascript" src="<%=CMSPfad %>js/fctzeitstrahl.js"></script> 
<script type="text/javascript" src="<%=CMSPfad %>js/dragscroll.js"></script>

<div class="sidebar col-md-3 order-md-2">   
  <asp:HiddenField ID="hdnZeitstrahlSelThemen" ClientIDMode="Static" runat="server" />

  <ul class="nav flex-column">
      <li class="nav-item">
        <a class="nav-link" onclick="javascript:gotoContainer('epoche');">Epochenkapitel</a>        
      </li>
      <li class="nav-item">
        <a class="nav-link" onclick="javascript:gotoContainer('zeitstrahl');">Zeitstrahl</a>
        <asp:Repeater ID="rptZeitstrahlThemen" runat="server">
          <HeaderTemplate>        
            <ul class="nav flex-column epoche-zeitstrahl-themen-list">
          </HeaderTemplate>
          <ItemTemplate>
              <li data-id="<%# Eval("ID") %>" class="nav-item epoche-zeitstrahl-themen-item zeistrahl-theme_<%# Eval("ID") %>">
                <label><input type="checkbox" value="<%# Eval("ID") %>"<%# (Container.ItemIndex==0 ? " checked":"") %> /><div class="zeitstrahl-theme-name"><%# Eval("Name") %></div></label>
              </li>
          </ItemTemplate>
          <FooterTemplate>
            </ul>
          </FooterTemplate>
        </asp:Repeater>
      </li>
      <li id="subnav_literatur" class="nav-item" visible="false" runat="server">
          <a class="nav-link" onclick="javascript:gotoContainer('literatur');">Grenzerfahrung</a>
      </li>
  </ul>
</div>
<div class="content col-md-9 order-md-1 tab-content">  

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

    <asp:UpdatePanel ID="upnlEpocheZeitstrahl" ClientIDMode="Static" class="objects-epoche-zeitstrahl-area dragscroll" Visible="false" runat="server">
      <ContentTemplate>

        <asp:Repeater ID="rptEpocheZeitstrahl" runat="server">
          <HeaderTemplate>
            <ul class="timeline-list">
          </HeaderTemplate>
          <ItemTemplate>
            <li class="item <%# ( ( ((Container.ItemIndex+1)%2)==1 || Convert.ToDateTime(Eval("ereignisdatum")).Year!=PreTimelineYear) ? "item-right":"item-left")%> timeline-event-theme_<%# Eval("Thema").ToString().Split(arrthemesep,StringSplitOptions.RemoveEmptyEntries)[0] %>">
              <%# SetTimelineyears(Eval("ereignisdatum").ToString()) %>              
              <h4 class="timeline-event"><%# Eval("Name") %></h4>
              <div class="d-flex justify-content-between">                
                <%# (Eval("FirstPic").ToString()!=""? "<div class=\"timeline-image\"><img src=\""+WebSrvURL+"services/kulturerbe/galerien/"  +Eval("ID") + "/" +Eval("FirstPic") +"\" alt=\""+ Eval("Name").ToString().Replace("\"","") + "\"></div>" :"") %>
                <div class="timeline-content">
                  <%# (Eval("kurzbeschreibung").ToString()!="" ? "<p>"+Eval("kurzbeschreibung")+"</p>":"") %>
                </div>
              </div>
            </li>
          </ItemTemplate>          
          <FooterTemplate>
            </ul>
          </FooterTemplate>
        </asp:Repeater>
         
      </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:Panel ID="pnlEpocheBuecher" CssClass="objects-epoche-buecher-area" style="display:none;" Visible="false" runat="server">
      <h4 class="zrdg-maintitle"><asp:Literal ID="litInhaltsverzeichnis" Text="Inhaltsverzeichnis" runat="server" /></h4>

      <asp:Repeater ID="rptLiteraturtopics" runat="server">
        <HeaderTemplate>
          <ul class="nav nav-topics">
        </HeaderTemplate>
        <ItemTemplate>
          <li class="nav-item">
            <a class="nav-link active" href="javascript:gotoliteraturdokpage('<%# Eval("DokID").ToString() %>');"><%# Eval("DokDesc")%></a>
          </li>
        </ItemTemplate>
        <FooterTemplate>
          </ul>
        </FooterTemplate>      
      </asp:Repeater>

      <asp:Repeater ID="rptBuecherContent" runat="server">
        <HeaderTemplate>
          <div id="page-slider">
            <div class="flexslider">
              <ul class="slides">            
        </HeaderTemplate>
        <ItemTemplate>
            <li>
              <div class="d-flex">
                <a class="thumb buecherlit_<%# Eval("DokID").ToString() %>" href="<%# strBuecherPicURL+Eval("DokDatei").ToString().ToLower().Replace(".pdf",".jpg") %>" data-title="<%# Eval("DokTitel") %>" data-lightbox="buechercontent"><img src="<%# strBuecherPicURL+Eval("DokDatei").ToString().ToLower().Replace(".pdf",".jpg") %>" /></a>                
              </div>
            </li>
        </ItemTemplate>
        <FooterTemplate>
              </ul>
            </div>
            <div class="custom-navigation">
              <a href="javascript:void(0);" class="flex-prev"><span>Vorherige</span></a>
              <a href="javascript:void(0);" class="flex-next"><span>Naechste</span></a>
            </div>
          </div>
        </FooterTemplate>
      </asp:Repeater>
      <div class="page-caption">
        <h3><asp:Literal ID="litEpocheBuecherTitel" runat="server" /></h3>
        <div id="epochebuecher_description" class="objects-epoche-buecher-description" visible="false" runat="server"><asp:Literal ID="litEpocheBuecherDesc" runat="server" /></div>
      </div>            

    </asp:Panel>

  </asp:Panel>

</div>