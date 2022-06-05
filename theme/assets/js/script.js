jQuery(function ($) {
    try {

        $('.images-slideshow').slick({
            dots: false,
            arrows: true,
        });

        $('.member-carousel').slick({
            dots: false,
            arrows: true,
            slidesToShow: 2,
            slidesToScroll: 1,
        });

        $('.event-carousel').slick({
            dots: false,
            arrows: true,
            slidesToShow: 3,
            slidesToScroll: 1,
            responsive: [
                {
                    breakpoint: 992,
                    settings: {
                        slidesToShow: 2,
                    }
                },
                {
                    breakpoint: 768,
                    settings: {
                        slidesToShow: 1,
                    }
                }
            ]
        });

        $('.partner-carousel-init').slick({
            dots: false,
            arrows: false,
            slidesPerRow: 8,
            rows: 2,
            responsive: [
                {
                    breakpoint: 1600,
                    settings: {
                        slidesPerRow: 6,
                        rows: 2,
                    }
                },
                {
                    breakpoint: 1200,
                    settings: {
                        slidesPerRow: 5,
                        rows: 2,
                    }
                },
                {
                    breakpoint: 992,
                    settings: {
                        slidesPerRow: 4,
                        rows: 1,
                    }
                }
            ]
        });
    } catch (e) {
        console.log(e);
    }
});

new WOW().init();
