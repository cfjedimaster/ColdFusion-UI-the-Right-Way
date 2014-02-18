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

