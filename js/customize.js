(function ($, root, undefined) {
    $(function () {
        $(document).ready(function () {
					if($('#carousel > .flexslider').length>0)
					{
						$('#carousel > .flexslider').flexslider({
								animation: "slide",
								customDirectionNav: $("#carousel .custom-navigation a"),
								start: function(){
									if( $('.epocheslider-item_active').length > 0 ) checkforactiveslider();
									if( $('#carousel .flex-control-paging').children().length > 0 ) $('#carousel .custom-navigation').show();
								}
						});
					}
										
					if($('.twentytwenty-container').length>0) //Setzen der Bildvergleichselemente falls vorhanden
						$('.twentytwenty-container').twentytwenty({
							orientation: 'horizontal',
							no_overlay: true,
							click_to_move: true
					});
        });

        $('.navbar .dropdown > a').click(function () {
            location.href = this.href;
        });

        $('.scroll-to-top').click(function () { // Klick auf den Button
            $('body,html').animate({
                scrollTop: 0
            }, 800);
            return false;
        });

    });
})(jQuery, this);

