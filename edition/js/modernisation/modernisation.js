$(".abbr").hide();
$(".checkbox_abbr").click(function () {
    if ($(this).is(":checked")) {
        $(".abbr").show();
        $(".expan").hide();
    } else {
                $(".abbr").hide();
        $(".expan").show();
    }
});

$(".orig").hide();
$(".checkbox_orig").click(function () {
    if ($(this).is(":checked")) {
        $(".orig").show();
        $(".reg").hide();
    } else {
                $(".orig").hide();
        $(".reg").show();
    }
});

$(".sic").hide();
$(".checkbox_sic").click(function () {
    if ($(this).is(":checked")) {
        $(".sic").show();
        $(".corr").hide();
    } else {
                $(".sic").hide();
        $(".corr").show();
    }
});

$(".lb").hide();
$(".checkbox_lb").click(function () {
    if ($(this).is(":checked")) {
        $(".lb").show();        
    } else {
        $(".lb").hide();        
    }
});
