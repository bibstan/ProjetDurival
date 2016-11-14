$(".abbr").hide();
$(".sic").hide();
$(".orig").hide();
$(".corr").show();
$(".reg").show();
$(".expan").show();
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
