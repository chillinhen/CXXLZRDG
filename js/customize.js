(function ($, root, undefined) {
    $(function () {
        $(window).on('load', function () {
            console.log("test");
        });

        $(window).on('load', function () {
            $('.nav-timeline > .flexslider').flexslider({
                animation: "slide",
                animationLoop: false,
                itemWidth: 250,
                itemMargin: 5,
                mousewheel: true,
                rtl: true,
            });
            $('.page-slider > .flexslider').flexslider({
                animation: "slide",
                animationLoop: false,
                itemWidth: 300,
                itemMargin: 2
            });
            $('.wheel > .flexslider').flexslider({
                animation: "slide",
                animationLoop: false,
                minItem:2,
                itemWidth: 100,
                itemMargin: 8
            });
            $('.flex-direction-nav a').wrapInner('<span></span>');
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


        $("ul#tabs li:first-child, ul#tab li:first-child").addClass('active');
        $("ul#tabs li").click(function () {
            if (!$(this).hasClass("active")) {
                var tabNum = $(this).index();
                var nthChild = tabNum + 1;
                $("ul#tabs li.active").removeClass("active");
                $(this).addClass("active");
                $("ul#tab li.active").removeClass("active");
                $("ul#tab li:nth-child(" + nthChild + ")").addClass("active");
            }
        });
    });
})(jQuery, this);

