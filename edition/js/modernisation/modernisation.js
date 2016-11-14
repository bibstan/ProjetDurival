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
