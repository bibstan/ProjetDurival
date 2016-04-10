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
