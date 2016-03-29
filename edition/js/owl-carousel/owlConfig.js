$(document).ready(function() {
    $('.owl-carousel').owlCarousel({
        items: 1,
        loop: false,
        center: true,
        nav: true,
        margin: 10,
        callbacks: true,
        URLhashListener: true,
        autoplayHoverPause: true,
        startPosition: 'URLHash'
    });
})