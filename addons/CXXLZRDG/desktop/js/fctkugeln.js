var network = null, nodesdata=null;
var default_nodesize = 130, default_nodeheight_width = 240, default_edge_len=680;

// Called when the Visualization API is loaded.
function draw(inputNodes) {
  // create a network
  var container = document.getElementById('mynetwork');
  var inputData = JSON.parse(inputNodes);

  nodesdata = getNodeData(inputData);

  var data = {
    nodes: nodesdata,
    edges: getEdgeData(inputData)
  };
  var options = {
    interaction: {
      zoomView: true,
      dragView: true,
      hover: true,
      hoverConnectedEdges: false
    },
    nodes: {
      borderWidth: 8,
      size: default_nodesize,
      mass: 3,
      heightConstraint: { minimum: default_nodeheight_width, valign: 'middle' },
      widthConstraint: { minimum: default_nodeheight_width, maximum: default_nodeheight_width },
      color: {
        border: '#3b98c6',
        background: '#FFFFFF'
      },
      font: { align: 'center', color: '#FFFFFF',size:25 },
      shapeProperties: {
        useBorderWithImage: true
      },
      shadow: true
    },
    edges: {
      color: { color: '#b7b5b5' },
      width: 2,
      "smooth": {
        "type": "vertical",
        "forceDirection": "none",
        "roundness": 0
      }
    }
  };
  network = new vis.Network(container, data, options);

  network.on("click", function (params) {
    if (this.getNodeAt(params.pointer.DOM) != undefined) {
      if (nodesdata.get(this.getNodeAt(params.pointer.DOM)).linkurl != '')
        alert('Weiterleiten nach: '+nodesdata.get(this.getNodeAt(params.pointer.DOM)).linkurl);//location.href = nodesdata.get(this.getNodeAt(params.pointer.DOM)).linkurl;
    }
  });
}

function getNodeData(data) {
  var networkNodes = [];

  data.forEach(function (elem, index, array) {
    networkNodes.push({
      id: elem.id,
      label: elem.lbl,
      title: elem.title,
      image: elem.img,
      shape: elem.shape,
      size: (elem.size != undefined ? elem.size : default_nodesize),
      color: { border: (elem.color != undefined ? elem.color.border : ''), background: (elem.color != undefined ? elem.color.bg : '') },
      font: { color: (elem.font != undefined ? elem.font.color : '') },
      shapeProperties: { useImageSize: (elem.shapeProperties != undefined ? elem.shapeProperties.useImageSize : false), useBorderWithImage: (elem.shapeProperties != undefined ? elem.shapeProperties.useBorderWithImage : true) },
      linkurl: elem.linkurl
    });
  });

  return new vis.DataSet(networkNodes);
}

function getEdgeData(data) {
  var networkEdges = [];

  data.forEach(function (node) {
    // add the connection
    node.connections.forEach(function (connId, cIndex, conns) {
      if (connId != -1) {
        networkEdges.push({ from: node.id, to: connId, length: default_edge_len });
        let cNode = getNodeById(data, connId);

        var elementConnections = cNode.connections;
        // remove the connection from the other node to prevent duplicate connections
        var duplicateIndex = elementConnections.findIndex(function (connection) {
          return connection == node.id; // double equals since id can be numeric or string
        });

        if (duplicateIndex != -1) {
          elementConnections.splice(duplicateIndex, 1);
        };
      }
    });
  });
  return new vis.DataSet(networkEdges);
}

function getNodeById(data, id) {
  for (var n = 0; n < data.length; n++) {
    if (data[n].id == id) {  // double equals since id can be numeric or string
      return data[n];
    }
  };
  throw 'Can not find id \'' + id + '\' in data';
}

$(document).ready(function () {

  $.ajax({
    url: '/addons/CXXLZRDG/desktop/modules/ajaxdata.aspx',
    data: "mode=getkugeln",
    type: "POST",
    success: function (result) {
      draw(result);
    }
  });

});