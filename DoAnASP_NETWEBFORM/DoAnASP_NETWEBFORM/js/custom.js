$(document).ready(function () {
    var combolist = [];

    $(".combobox").each(function () {

        $("input", this).focus(function () {
            $(this).parent().find("ul").slideDown();
        });
        //shows dropdown when element focuses

        $("input", this).focusout(function () {
            $(this).parent().find("ul").slideUp();
        });
        //hides element when out of focus

        $("ul li", this).each(function () {
            $(this).click(function () {
                $(this).parent()
                    .parent()
                    .find("input")
                .val($(this).text())
                .css("background", "#fff");
            }); //value of li is set as the text value
            combolist.push($(this).text());
            //pushes values of li to an array  
        }); //each li


        $("input", this).keyup(function () {
            var val = $(this).val();
            if ($.inArray(val, combolist) > -1) {
                $(this).css("background", "#5CB85C")
            }
        });

    });

});