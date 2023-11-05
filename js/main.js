document.addEventListener('DOMContentLoaded', function () {
    // dodaje cien do nav
    const nav = document.querySelector('.navbar')

    function addShadow() {
        if (window.scrollY >= 10) {
            nav.classList.add('shadow-bg')
        }
        else {
            nav.classList.remove('shadow-bg')
        }
    }
    window.addEventListener('scroll', addShadow)

    $(document).click(function (event) {
        var clickover = $(event.target);
        var _opened = $(".navbar-collapse").hasClass("show");
        if (_opened === true && !clickover.hasClass("navbar-toggler")) {
            $(".navbar-toggler").click();
        }
    });

    $('.card-deck').slick({
        // setting-name: setting-value
        autoplay: true,
        autoplaySpeed: 10000,
        mobileFirst: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        responsive: [
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 2
                }
            },
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 3
                }
            },
            {
                breakpoint: 1600,
                settings: {
                    slidesToShow: 5
                }
            }
        ]
    });

});