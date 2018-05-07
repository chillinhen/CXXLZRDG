<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" ValidateRequest="false" Inherits="ZRDG._Default" %>

<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <!-- Required meta tags -->
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="css/flexslider.css" media="screen">
  <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="/addons/CXXLZRDG/desktop/css/draggableslideshow/dragdealer.css" />
	<link rel="stylesheet" type="text/css" href="/addons/CXXLZRDG/desktop/css/draggableslideshow/component.css" />
    <script src="js/modernizr-2.7.1.min.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <title>Dummy-Title Plattform Ostbelgische Geschichte</title>
</head>
<body class="">
  <form id="form2" runat="server">
      <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
    <header id="header">
        <div class="top-nav">
    <div class="container">
        <!-- Search & Language Select -->
        <div class="d-flex mr-auto justify-content-between align-items-center">
            <div class="dropdown search">
                <div class="btn-search" id="dropdownSearch" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-search" aria-hidden="true"></i></div>
                <div class="dropdown-menu" aria-labelledby="dropdownSearch">
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </div>
            <div class="language-select">
                <select class="custom-select" id="selectLanguage">
                    <option selected>DE</option>
                    <option value="">FR</option>
                </select>
            </div>
        </div>
        <a class="navbar-brand" href="index.php">Logo</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars" aria-hidden="true"></i></button>
    </div>
</div>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">

    <div class="collapse navbar-collapse" id="mainNav">
        <div class="container">
            <ul class="navbar-nav">
                <!-- Zeitmaschine -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle hov-col-1" href="#" id="dropdownTimeMachine" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Zeitmaschine
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdownTimeMachine">
                        <a class="dropdown-item" href="#">Epochenkapitel</a>
                        <a class="dropdown-item" href="#">Begriffsgeschichte</a>
                        <a class="dropdown-item" href="#">Chronik</a>
                    </div>
                </li>
                <!-- Landreise -->
                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle hov-col-2" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Landreise
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdownTour">
                        <a class="dropdown-item" href="#">Kartenarbeit</a>
                        <a class="dropdown-item" href="#">Historische Räume</a>
                        <a class="dropdown-item" href="#">Landschaftsbilder</a>
                        <a class="dropdown-item" href="#">Sprachräume</a>
                    </div>
                </li>
                <!-- Geschichtslabor -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle hov-col-3" href="#" id="dropdownLaboratory" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Geschichtslabor
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdownLaboratory">
                        <a class="dropdown-item" href="#">Experimentieren</a>
                        <a class="dropdown-item" href="#">Analysieren</a>
                        <a class="dropdown-item" href="#">Methode</a>
                    </div>
                </li>
                <!-- Quellen -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle hov-col-4" href="#" id="dropdownSources" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Quellen
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdownSources">
                        <a class="dropdown-item" href="#">Zeitung</a>
                        <a class="dropdown-item" href="#">Zeitschriften</a>
                        <a class="dropdown-item" href="#">Virtuelle Bibliothek</a>
                        <a class="dropdown-item" href="#">Biographie</a>
                    </div>
                </li>
                <!-- 1920-2010 -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle hov-col-5" href="#" id="dropdownChronic" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        1920-2010
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdownChronic">
                        <a class="dropdown-item" href="#">Ein Jubiläum</a>
                        <a class="dropdown-item" href="#">Veranstaltungen</a>
                    </div>
                </li>
                <!-- Über uns -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle hov-col-6" href="#" id="dropdownAbout" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Über uns
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdownAbout">
                        <a class="dropdown-item" href="#">Ziele</a>
                        <a class="dropdown-item" href="#">Projekte</a>
                        <a class="dropdown-item" href="#">Geschichte</a>
                        <a class="dropdown-item" href="#">Mitarbeiter</a>
                        <a class="dropdown-item" href="#">Kontakt/ Impressum</a>
                        <a class="dropdown-item" href="#">Interner Bereich</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div id="carousel">
    <div class="flexslider">
        <ul class="slides">
            <li>
                <img src="img/1920x1270.png" />
                <div class="carousel-caption">
                    <div class="row">
                        <div class="col-6">
                            <h2>Lorem ipsum dolor sit amet</h2>
                            <p>Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et ma</p>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <img src="img/1920x1270.png" />
                <div class="carousel-caption">
                    <div class="row">
                        <div class="col-6">
                            <h2>Lorem ipsum dolor sit amet</h2>
                            <p>Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et ma</p>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <img src="img/1920x1270.png" />
                <div class="carousel-caption">
                    <div class="row">
                        <div class="col-6">
                            <h2>Lorem ipsum dolor sit amet</h2>
                            <p>Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et ma</p>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <img src="img/1920x1270.png" />
                <div class="carousel-caption">
                    <div class="row">
                        <div class="col-6">
                            <h2>Lorem ipsum dolor sit amet</h2>
                            <p>Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et ma</p>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
<<<<<<< HEAD
    <div class="custom-navigation d-flex justify-content-between" style="display:none !important;">
        <a href="javascript:void(0);" class="flex-prev"><span>Vorherige</span></a>
        <a href="javascript:void(0);" class="flex-next"><span>Nächste</span></a>
=======
    <div class="custom-navigation d-flex justify-content-between">
        <a href="#" class="flex-prev"><span>Vorherige</span></a>
        <a href="#" class="flex-next"><span>Nächste</span></a>
>>>>>>> d02db04771f8dfb337e92d766aed7dc62858d7c4
    </div>
</div>

    </header>
    <main id="main-content">
      <div class="intro">
      </div>        
      <div class="container">
            <div class="row">
                <div class="sidebar col-md-3 order-md-2">
                    <asp:PlaceHolder ID="pholder_SubNav" runat="server" />                    
                </div>
                <div class="content col-md-9 order-md-1 tab-content">                    
                  <asp:PlaceHolder ID="pholder" runat="server" />
                </div>
            </div>
        </div>
    </main>
    <footer id="footer" class="bg-light">
        <nav class="navbar navbar-light footer-nav">
    <div class="container" >
        <ul class="nav">
            <li class="nav-item parent-item">
                <a class="nav-link" href="#">Zeitmaschine</a>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Epochenkapitel</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Begriffsgeschichte</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Chronik</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Grenzerfahrung</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Zeitleiste</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Themenzeitleiste</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Bildgeschichte</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Bildvergleich</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Meinungsvielfalt</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item parent-item">
                <a class="nav-link" href="#">Landreise</a>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Kartenarbeit</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Historische Räume</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Landschaftsbilder</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="">Sprachräume</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Grenzen im Vergleich</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Kartenbilder</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Dialektatlas</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Erinnerungsorte</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Karte + Dorfabfrage</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item parent-item">
                <a class="nav-link" href="#">Geschichtslabor</a>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Experimentieren</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Analysieren</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Methode</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Kalender</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item parent-item">
                <a class="nav-link disabled" href="#">Quellen</a>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Zeitung</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Zeitschriften</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Virtuelle Bibliothek</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Biographie</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Statistiken</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Bildportal</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Filmische Zeitzeugen</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Datenbanken</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Kartenarchiv</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Biographien</a>
                    </li>
                    <li class="nav-item anker">
                        <a class="nav-link" href="#">Archiv</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item parent-item">
                <a class="nav-link disabled" href="#">1920-2010</a>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Ein Jubiläum</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Veranstaltungen</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item parent-item">
                <a class="nav-link disabled" href="#">Über uns</a>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Ziele</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Geschichte</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Mitarbeiter</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Kontakt/ Impressum</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Interner Bereich</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<!-- Temp Solution -->
<div class="sharing">
    <div class="container" >
        <ul class="nav justify-content-end">
            <li class="nav-item social xing"><a class="nav-link" href="#"><span>xing</span></a></li>
            <li class="nav-item social facebook"><a class="nav-link" href="#"><span>facebook</span></a></li>
            <li class="nav-item social twitter"><a class="nav-link" href="#"><span>twitter</span></a></li>
            <li class="nav-item social google-plus"><a class="nav-link" href="#"><span>google-plus</span></a></li>
        </ul>
        <div class="scroll-to-top"><i class="fa fa-angle-double-up" aria-hidden="true"></i></div>
    </div>
</div>
<nav class="copyright navbar">
    <div class="container">
        <ul class="nav mr-auto">
            <li class="nav-item"><a class="nav-link" href="#">© 2018 Ostbelgien entdecken | ZOG</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Impressum</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Datenschutzerklärung</a></li>
        </ul> 
    </div>
</nav>
      


    </footer>
    </form>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script type="text/javascript">
  if (window.jQuery == undefined) document.write('<script src="js/jquery-3.3.1.min.js">\x3C/script>');
</script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
 <script defer src="js/jquery.flexslider.js"></script>
  <!-- Optional FlexSlider Additions -->
<!--  <script src="js/jquery.easing.js"></script>-->
  <script src="js/jquery.mousewheel.js"></script>
<script src="js/customize.js"></script>
<script src="js/helper.js"></script>
<script src="/addons/CXXLZRDG/desktop/js/draggableslideshow/dragdealer.js"></script>
<script src="/addons/CXXLZRDG/desktop/js/draggableslideshow/classie.js"></script>
<script src="/addons/CXXLZRDG/desktop/js/draggableslideshow/dragslideshow.js"></script>
</body>
</html>
