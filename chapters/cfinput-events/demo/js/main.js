$(document).on( "change", "#txtOnChange", function(e) {
    $("#msgOnChange").html('You entered - ' + $("#txtOnChange").val());
});
$(document).on( "click", ".txtOnClick", function(e) {
    $("#msgOnClick").html('You clicked on - ' + $(this).val());
});
$(document).on( "keydown", "#txtOnKeyDown", function(e) {
    $("#msgOnKeyDown").html('You pressed - ' + $("#txtOnKeyDown").val());
});
$(document).on( "keyup", "#txtOnKeyUp", function(e) {
    $("#msgOnKeyUp").html('You pressed - ' + $("#txtOnKeyUp").val());
});
$(document).on( "mousedown", "#txtOnMouseDownUp", function(e) {
    $("#msgOnMouseDownUp").html('Mouse Down');
});
$(document).on( "mouseup", "#txtOnMouseDownUp", function(e) {
    $("#msgOnMouseDownUp").html('Mouse Up');
});
$(document).on( "click", ".radChecked", function(e) {
    $("#msgRadChecked").html('You chose - ' + $(this).val());
});
$(document).on( "click", ".chkChecked", function(e) {
    var strMsg ='You chose -';
    console.log('here');
    $(".chkChecked:checked").each(function () {
    	console.log($(this).val());
        strMsg = strMsg + ' ' + $(this).val();
    });
    $("#msgChkChecked").html(strMsg);
});





