$(document).ready(function(){
    $( ".tree" ).on( "click", "li", function(e) {    
        var clicked = $("#ul-" + $(this).prop("id"));
        if(clicked.hasClass("tree-hide")) {
            clicked.removeClass("tree-hide");
            clicked.addClass("tree-show");
        }
        else {
            clicked.addClass("tree-hide");
            clicked.removeClass("tree-show");
        }
        e.stopPropagation();
    });
});