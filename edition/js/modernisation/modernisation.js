/*$(".abbr").hide();
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
});*/


$(".abbr").show();
$(".sic").show();
$(".orig").show();
$(".corr").hide();
$(".reg").hide();
$(".expan").hide();
$(".checkbox_modern").click(function () {
    if ($(this).is(":checked")) {
        $(".sic").show();
        $(".orig").show();
        $(".abbr").show();
        $(".corr").hide();
        $(".reg").hide();
        $(".expan").hide();
    } else {
        $(".sic").hide();
        $(".orig").hide();
        $(".abbr").hide();
        $(".corr").show();
        $(".reg").show();
        $(".expan").show();
    }
});



$(".lb").show();
$(".checkbox_lb").click(function () {
    if ($(this).is(":checked")) {
        $(".lb").show();        
    } else {
        $(".lb").hide();        
    }
});
