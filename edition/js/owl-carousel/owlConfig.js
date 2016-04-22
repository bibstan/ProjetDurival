$(document).ready(function() {
    $('.owl-carousel').owlCarousel({
        items: 1,
        loop: false,
        center: true,
        nav: true,
        dots:true,
        margin: 10,
        callbacks: true,
        URLhashListener: true,
        autoHeight:true,
        /*autoplayHoverPause: true,*/
        startPosition: 'URLHash'
    });
    
    /*$owl.trigger('refresh.owl.carousel');*/
})