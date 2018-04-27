var activeurl ='/addons/CXXLZRDG/desktop/';

$(document).ready(function () {

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
  });
});

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