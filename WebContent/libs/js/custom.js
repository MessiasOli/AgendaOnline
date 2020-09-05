$(document).ready(function(){
    $("#Address").fadeOut();
    $("#less").fadeOut();

    $("#plus").click(function(){
        $("#Address").fadeIn(500);
        $("#plus").fadeOut(1500);
        $("#less").fadeIn(3000);
    });

    $("#less").click(function(){
        $("#Address").fadeOut(500);
        $("#less").fadeOut(1500);
        $("#plus").fadeIn(3000);
    });
});

$(function(){
    $("#phone").mask("(99) 9 9999-9999",{placeholder:"(xx) x xxxx-xxxx"});
    $("#zip").mask("99999-999",{placeholder:""});
});

