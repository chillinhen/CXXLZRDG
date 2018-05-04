(function ($, root, undefined) {
    $(function () {
        $(window).on('load', function () {
            console.log("test");
        });
        $(window).on('load', function () {
            $('#carousel > .flexslider').flexslider({
                animation: "slide",
                customDirectionNav: $(".custom-navigation a")
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

