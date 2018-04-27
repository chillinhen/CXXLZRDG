var activeurl = '/addons/CXXLZRDG/desktop/';
var timeline = null;

$(document).ready(function () {

  $('.objects-epochesliderflexslider').flexslider({
    selector: ".epocheslider-list > li",
    animation: "slide",
    animationLoop: false,
    slideshow: false,
    controlNav: false,
    directionNav: true,
    itemWidth: 210,
    itemMargin: 5
  });
  
  checkforactiveslider();
  
  if ($('.epoche-zeitstrahl-themen-list').length > 0) { //Zeitleiste mit Inhalt füllen
    $('.epoche-zeitstrahl-themen-item input').change(function () {
      settimeline();
    });

    settimeline();
  }
  /*
  $('.objects-chronik-items').click(function () {
    var objid = $(this).attr('data-id');
    var jahr = $('#hdnAktChronikVal').val();

    $.ajax({
      url: activeurl + 'modules/ajaxdata.aspx',
      data: "mode=getchronikdetails&indate=" + jahr + "&oid=" + objid,
      type: "POST",
      success: function (result) {
        setlightbox(result);
      }
    });
  });*/
});

function checkforactiveslider()
{
  if ($('.epocheslider-item_active').length > 0)
  {
    //setzen der passenden Bilder, sofern vorhanden
    var objid = $('.epocheslider-item_active').attr('data-id');
    if ($('.epocheslider-item_active #picfile_' + objid).length > 0) {
      picname = $('.epocheslider-item_active #pictitle_' + objid).val();
      picdesc = $('.epocheslider-item_active #picdesc_' + objid).val();
      $('.zrdg-heroimage img').hide();
      $('.zrdg-heroimage').append('<img src="' + $('.epocheslider-item_active #picfile_' + objid).val() + '" alt="' + picname + '" />');
      if (picdesc != '') {
        $('.zrdg-heroimage').append('<div class="epocheslider-img-info"><div class="epocheslider-ico-info">i</div></div>\n' +
          '<div class="epocheslider-img-infocontent"><div class="epocheslider-img-close"><div class="epocheslider-ico-close">x</div></div><div class="epocheslider-img-infocontent-txt"><h3>' + picname + '</h3><div>' + picdesc + '</div></div></div>');
        $('.epocheslider-img-info').click(showimginfo);
        $('.epocheslider-img-close').click(showimginfo);
      }
    }

    //setzen des Sliders auf die gewünschte Position
    //if ($('.flex-direction-nav .flex-disabled').length < 2 && $('.epocheslider-item_active').prevAll('.epocheslider-item').length > 2)
    //  $('.objects-epochesliderflexslider').flexslider($('.epocheslider-item_active').prevAll('.epocheslider-item').length);
  }
}

function showimginfo()
{
  if ($('.epocheslider-img-infocontent').css('display') == 'none') {
    $('.epocheslider-img-infocontent').fadeIn(400);
    $('.epocheslider-img-info').hide();
  }
  else {
    $('.epocheslider-img-infocontent').fadeOut(400);
    $('.epocheslider-img-info').show();
  }
}

function settimeline() {

  var themeids = '';
  $('.epoche-zeitstrahl-themen-list input:checked').each(function () {
    themeids += (themeids != '' ? ';' : '') + $(this).val();
  });
  
  $.ajax({
    url: activeurl + 'modules/ajaxdata.aspx',
    data: "mode=getzeitstrahldata&ep=" + $('#hdnEpocheID').val() + "&themeid=" + themeids,
    type: "POST",
    success: function (indata) {
      if (timeline == null) {
        var container = document.getElementById('epochezeitstrahl');

        // Create a DataSet (allows two way data-binding)
        var items = new vis.DataSet(indata);

        // Configuration for the Timeline
        var options = {
          width: '100%',
          height: '150px',
          //zoomable: false,
          dataAttributes: ['id'],
          locale: 'de',
          timeAxis: { scale: 'month', step: 1 },
          template: function (item, element, data) {
            return '<b>' + item.name + '</b>'
          },
          min: '0500-01-01',
          max: '1500-01-01'
        };

        // Create a Timeline
        timeline = new vis.Timeline(container, items, options);

        timeline.on('select', function (properties) {
          console.log('selected items: ' + properties.items);
        });

      }
      else {
        timeline.setItems(indata);
      }
    }
  });
}

function setlightbox(strcontent) {
  $('body').addClass('noscroll');
  var ismobile = false;
  if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
    ismobile = true;
  }

  if ($('.light--infobox').length > 0) $('.light--infobox').remove();

  $('body').append('<div class="light--infobox" style="display:none;height:' + $(document).height() + 'px;">' +
    '<div class=\"light--infobox-inner\"' + (ismobile ? ' style="width:95% !important;"' : '') + '>' +
    '<a href="javascript:return false;" class="btn btn_close_objlightbox"' + (ismobile ? ' style="background-size:63px auto !important;width:85px !important;height:85px !important;" ' : '') + ' onclick="javascript:closeinfobox();"></a>' +
    strcontent + '\n' +
    '</div></div>');
  $('.light--infobox').click(closeinfobox);
  $('.light--infobox-inner').click(function (event) {
    event.stopPropagation();
  });
  $('.light--infobox').fadeIn(500);
  $('.light--infobox').center();
  $('.light--infobox-inner').css('top',($(window).scrollTop()+50)+'px');
}
function closeinfobox() {
  $('body').removeClass('noscroll');
  if ($('.light--infobox').length > 0) $('.light--infobox').remove();
}


jQuery.fn.center = function () {
  this.css("position", "absolute");
  this.css("top", Math.max(0, (($('#body').height() - $(this).outerHeight()) / 2) +
    $('#body').scrollTop()) + 10 + "px");
  this.css("left", 50 + "px");
  return this;
}