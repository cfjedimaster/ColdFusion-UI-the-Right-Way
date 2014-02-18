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
