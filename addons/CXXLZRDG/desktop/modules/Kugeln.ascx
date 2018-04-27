<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Kugeln.ascx.cs" Inherits="ZRDG.modules.Kugeln" %>

<link rel="stylesheet" href="<%=CMSPfad %>css/styleszrdg.css" type="text/css" />
<link rel="stylesheet" href="<%=CMSPfad %>js/vis/vis.css" type="text/css" />
<link rel="stylesheet" href="<%=CMSPfad %>js/vis/vis-network.min.css" type="text/css" />
<link rel="stylesheet" href="<%=CMSPfad %>js/lightbox2/lightbox.css">
<script type="text/javascript">
  if (window.jQuery == undefined) document.write('<script src="<%=CMSPfad %>js/jquery-1.11.0.min.js">\x3C/script>'); 
</script> 
<script type="text/javascript" src="<%=CMSPfad %>js/lightbox2/lightbox.js"></script>
<script type="text/javascript" src="<%=CMSPfad %>js/vis/vis.js"></script>

<div id="mynetwork" style="width:60%;height:1000px;"></div>

<script type="text/javascript">
  var nodes = null;
  var edges = null;
  var network = null;

  var DIR = '/addons/CXXLZRDG/desktop/test/';
  var EDGE_LENGTH_MAIN = 200;
  var EDGE_LENGTH_SUB = 200;

  // Called when the Visualization API is loaded.
  function draw() {
    // Create a data table with nodes.
    nodes = [];

    // Create a data table with links.
    edges = [];

    nodes.push({ id: 1, title: 'Boxen', image: DIR + 'Boxen.jpg', shape: 'circularImage', color: { border: '#dd0202' }});
    nodes.push({ id: 2, title: 'Dampfwalze', image: DIR + 'Dampfwalze.jpg', shape: 'circularImage'});
    nodes.push({ id: 3, title: 'Denkmal', image: DIR + 'Denkmal.jpg', shape: 'circularImage', color: { border: '#dd0202' }});
    edges.push({from: 1, to: 2, length: EDGE_LENGTH_MAIN});
    
    nodes.push({ id: 4, title: 'Zufall Kategorie', image: '/addons/CXXLZRDG/desktop/images/icon_dice.png', shape: 'circularImage', size: 35, shapeProperties: { useImageSize: true }, color: { border: '#b7b5b5', background: '#dd0202' }});
    edges.push({ from: 2, to: 4, length: EDGE_LENGTH_SUB });    

    nodes.push({ id: 5, label: 'Entdecke die Kriege der letzten Jahre', shape: 'circle', color: { background: '#24751d' }, font: { color: '#FFFFFF' } });
    edges.push({ from: 101, to: 5, length: EDGE_LENGTH_SUB });    

    nodes.push({ id: 101, title: 'Einquartierung fremder Truppen', image: DIR + 'Einquartierung_fremder_Truppen.jpg', shape: 'circularImage', color: { border: '#dd0202' }});
    edges.push({from: 3, to: 101, length: EDGE_LENGTH_SUB});

    nodes.push({ id: 102, title: 'Gefangenenlager', image: DIR + 'Gefangenenlager.jpg', shape: 'circularImage', color: { border: '#dd0202' }});
    edges.push({from: 3, to: 102, length: EDGE_LENGTH_SUB});

    nodes.push({ id: 103, title: 'Karte', image: DIR + 'karte9.jpg', shape: 'circularImage'});
    edges.push({from: 104, to: 103, length: EDGE_LENGTH_SUB});

    nodes.push({ id: 6, title: 'Zufall Kategorie', image: '/addons/CXXLZRDG/desktop/images/icon_dice.png', shape: 'circularImage', size: 35, shapeProperties: { useImageSize: true }, color: { border: '#b7b5b5', background: '#24751d' } });
    edges.push({ from: 104, to: 6, length: EDGE_LENGTH_SUB }); 

    nodes.push({ id: 104, title: 'Triangel', image: DIR + 'Triangel.jpg', shape: 'circularImage', color: { border: '#24751d' }});
    edges.push({from: 1, to: 104, length: EDGE_LENGTH_SUB});

    nodes.push({ id: 105, title: 'Versailler Vetrag', image: DIR + 'VersaillerVetrag.jpg', shape: 'circularImage', color: { border: '#dd0202' } });
    edges.push({ from: 1, to: 105, length: EDGE_LENGTH_SUB });

    nodes.push({
      id: 106, title: 'Weltkrieg 1915', image: DIR + 'Weltkrieg1915.jpg', shape: 'circularImage', color: { border: '#24751d'} });
    edges.push({ from: 1, to: 106, length: EDGE_LENGTH_SUB });
    edges.push({ from: 3, to: 104, length: EDGE_LENGTH_SUB });

    
    // create a network
    var container = document.getElementById('mynetwork');
    var data = {
      nodes: nodes,
      edges: edges
    };
    var options = {
      nodes: {
        borderWidth: 4,
        size: 70,
        mass:3,
        heightConstraint: { minimum: 130, valign: 'middle' },
        widthConstraint: { minimum: 130, maximum: 130 },
        color: {
          border: '#3b98c6',
          background: '#FFFFFF'
        },
        font: { align: 'center', color: '#FFFFFF' },
        shapeProperties: {
          useBorderWithImage: true
        },
        shadow: true
      },
      edges: {
        color: { color:'#b7b5b5'},
        width:4
      }};
    network = new vis.Network(container, data, options);

    network.on("click", function (params) {
      params.event = "[original event]";
      if (this.getNodeAt(params.pointer.DOM) != undefined) {
        alert('Hier würde auf die entsprechende Seite weitergeleitet');
        console.log('click event, returns: ' + this.getNodeAt(params.pointer.DOM));
      }
    });
  }

  $(document).ready(function () {
    draw();
  });
</script>