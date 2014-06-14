//THIS FUNCTION CHECKS THAT A VALID EMAIL HAS BEEN ENTERED
//THIS IS ONLY USED WHEN manual VALIDATION IS SELECTED
function validateEmail(email) { 
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

//THIS FUNCTION IS CALLED WHEN THE RADIO BUTTO IS SET TO manual
function validationManual(){
	//HERE WE BUILD THE ERROR MESSAGE ( IF THERE IS ONE )
    var strErrMessage = '';
    //CHECK THAT A name HAS BEEN ENTERED
    if($("#name").val() === '') {
    	strErrMessage += 'You must enter a name.\n';
    }
    //CHECK THAT AN email HAS BEEN ENTERED AND THAT IT IS VALID
    if(!validateEmail($("#email").val())) {
    	strErrMessage += 'You must enter a valid e-mail address.\n';
    }
    //CHECK THAT password1 HAS BEEN ENTERED
    if($("#password1").val() === '') {
    	strErrMessage += 'You must enter a password.\n';
    }
    //CHECK THAT password2 HAS BEEN ENTERED
    if($("#password2").val() === '') {
    	strErrMessage += 'You must enter your password twice.\n';
    }
    //CHECK THAT THE PASSWORDS MATCH
    if($("#password1").val() !== '' && $("#password2").val() !== '') {
	    if($("#password1").val() !== $("#password2").val()) {
	    	strErrMessage += 'Passwords do not match.\n';
	    }
	}
    //IF THERE IS AN ERROR MESSAGE TO DISPLAY THEN
    //STOP THE FORM FROM SUBMITTING
    //AND DISPLAY THE ERROR MESSAGE
    if(strErrMessage !== '') {
    	alert(strErrMessage);
    }
}

//THIS FUNCTION IS CALLED WHEN THE RADIO BUTTO IS SET TO JV
function validationJV(){
	//HERE WE SET UP THE RULES AND CALL THE VALIDATION ON THE myform ELEMENT
	$( "#myform" ).validate({
		rules: {
			name: "required",
			email: "email",
			password1: "required",
			password2: {
				equalTo: "#password1"
			}
		}
	});
}

$(document).on( "click", "#submitit", function(e) {
	//GET THE SELECTED RADIO BUTTON VALUE
	var radType = $('input[name=radValidationType]:checked', '#myform').val();
	//CHOOSE THE CORRECT VALIDATION BASED ON THE RADIO BUTTON SELECTION
	if(radType === 'manual') {
		validationManual();
	}
	else {
		validationJV();
	}
});
