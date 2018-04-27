$(document).ready(function () {
  if ($('.objects-selectorchronik-area').length > 0) {
    $('.objects-selectorchronik-area').flexslider({
      selector: ".objects-selectorchronik-itemslist > li",
      animation: "slide",
      animationLoop: true,
      slideshow: false,
      controlNav: false,
      directionNav: true,
      mousewheel: true,
      drag: false,
      minItems: 1,
      maxItems: 3,
      itemWidth: 75,
      move: 1/*,
      startAt:4*/
    });

    if ($('#hdnStartChronikVal').val() != '') {
      var index = $('.selectorchronik-items-val_' + $('#hdnStartChronikVal').val()).index() - 1;
      if (index < 0) index = 0;
      $('.objects-selectorchronik-area').flexslider(index);
    }
  }
});