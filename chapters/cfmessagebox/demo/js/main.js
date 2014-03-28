$(document).on( "click", "#showNameForm", function(e) {
    event.preventDefault();
    $('#nameForm').modal();
});
$(document).on( "click", "#submitName", function(e) {
    //DISPLAY THE NAME THAT WAS JUST ENTERED IN THE MODAL BOX
    $("#message").html('You entered - ' + $("#txtFirstname").val() + ' ' + $("#txtLastname").val());
    //SET THE HIDDEN FORM VARIABLES IN THE MAIN FORM
    $("#firstName").val($("#txtFirstname").val());
    $("#lastName").val($("#txtLastname").val());
    //CLOSE THE MODAL BOX
    $.modal.close();
});
