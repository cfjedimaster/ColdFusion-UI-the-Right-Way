$(document).ready(function() {
    var timer = setInterval(function() { 
        progressBar(); 
    }, 2000);
    function progressBar(){
        method = 'getInterval';
        var strURL = 'content.cfc?'; 
        strURL += 'method=' + method;
        $.ajax({
            url: strURL,
            dataType: 'json',
            success: function(response){
                var currentValue = $("#progressbar").val();
                var newValue = currentValue + response;
                $("#progressbar").val(newValue);
                if(newValue >= 100) {
                    clearInterval(timer);
                }
            },
            error: function(ErrorMsg){
                console.log('Error');
            }
        })
    }
});
