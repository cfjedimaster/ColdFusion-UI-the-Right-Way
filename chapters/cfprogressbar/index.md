CFPROGRESSBAR
===

The `<cfprogressbar>` tag creates a progress bar.

In the example I am going to use the HTML5 tag `<progress>` :-

**Listing 1 : index.html**

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <script src="//code.jquery.com/jquery-1.9.1.js"></script>
        <script src="js/main.js"></script>
    </head>
    <body>
        <progress id="progressbar" class="progressbar" max="100" min="0" value="0"></progress>
    </body>
    </html>

![PROGRESSBAR Examaple](images/p1.png)

Now we define a CFC containing a method called **getInterval**.

**Listing 2 : content.cfc**

    <cfcomponent>
        <cffunction name="getInterval" access="remote" returntype="numeric" output="true" returnformat="plain">
            <cfset intRandom = RandRange( 1, 20) />
            <cfreturn intRandom />
        </cffunction>
    </cfcomponent>

And now we call **getInterval** using AJAX :-

**Listing 3 : main.js**

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

There is a INTERVAL defined here so that the progress bar gets updated with the NEW value every 2 seconds :-

    var timer = setInterval(function() { 
        progressBar(); 
    }, 2000);

The progressBar() function simply takes the current progress bar value and adds the random number returned by the CFC **getInterval** method :-

    var currentValue = $("#progressbar").val();
    var newValue = currentValue + response;

Then all we need to do is update the value of the progress bar :-

    $("#progressbar").val(newValue);

And finally we can turn off the INTERVAL Timer **IF** we have reached the progress bar maximum :-

    if(newValue >= 100) {
        clearInterval(timer);
    }

For further information you can reference :-

* [HTML5DOCTOR](http://html5doctor.com/the-progress-element/)
* [JQUERY AJAX](https://api.jquery.com/jQuery.ajax/)


