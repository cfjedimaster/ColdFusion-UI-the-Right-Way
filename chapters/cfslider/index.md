CFSLIDER
===

The `<cfslider>` tag creates a slider.

In the example below you will notice I have added a text box to serve as a visual clue as to what number has been selected by the slider :-

**Listing 1 : cfslider.cfm**

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>cfslider</title>
        <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
        <script>
            function sliderChange(obj, value) {
                $("#sliderValue").val(value);
            }
        </script>
    </head>
    <body>
        <div id="wrapper">
            <cfslider name="sliderNo1" 
                format="HTML" 
                vertical="false" 
                width="350" 
                value="100" 
                min="0" 
                max="200" 
                increment="1" 
                tip="true"
                onChange="sliderChange"
            />
            <input type="text" name="sliderValue" id="sliderValue"></span>
        </div>
    </body>
    </html>

![CFSLIDER Examaple](images/s1.png)

Once again there are many ways to achieve the same thing using a jQuery plugin or even just HTML5.

The following is an HTML5 implementation.

**Listing 2 : index.html**

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>HTML5 Slider</title>
        <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
        <script>
            $(document).ready(function(){
                $("#sliderNo1").on("input change",function(){
                    $("#sliderValue").val($(this).val());
                });
            });
        </script>
    </head>
    <body>
        <div id="wrapper">
            <label for="sliderNo1">Slider</label>
            <input name="sliderNo1" id="sliderNo1" type="range" min="1" max="200" value="100">
            <input name="sliderValue" id="sliderValue">
        </div>
    </body>
    </html>

![HTML5 Examaple](images/s2.png)

And yes that's not going to work to well in legacy browsers.

Here's another implementation using jQuery and jQuery UI.

**Listing 3 : index.cfm**

    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <title>jQuery UI Slider</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="css/custom.css">
        <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
        <script>
            $(document).ready(function(){
                $("#sliderNo1").slider({ 
                    min:1, 
                    max:200, 
                    step:1, 
                    value:100 
                });
                $("#sliderNo1").on("slidechange", function( event, obj ) {
                    $("#sliderValue").val(obj.value);
                });
            });
        </script>
    </head>
    <body>
        <label for="sliderNo1">Slider</label>
        <div name="sliderNo1" id="sliderNo1" class="sliderDiv"></div>
        <input name="sliderValue" id="sliderValue">
    </body>
    </html>

![jQuery Examaple](images/s3.png)

Here we are loading the styles and the jQuery code we need in the `<head>`.

Then we initialsise the slider with a bit of jQuery.

    $("#sliderNo1").slider({ 
        min:1, 
        max:200, 
        step:1, 
        value:100 
    });

And here is the event handler to put the slider value in the text box

    $("#sliderNo1").on("slidechange", function( event, obj ) {
        $("#sliderValue").val(obj.value);
    });    

For further information you can reference :-

* [CFSLIDER](http://help.adobe.com/en_US/ColdFusion/9.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7aed.html)
* [JQUERY](http://jquery.com/)
* [JQUERY UI](http://jqueryui.com)

