<cfsetting showdebugoutput="false">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Calendar</title>
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  	<link rel="stylesheet" href="css/custom.css">
    <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
	<script>
		$(function() {
			$( "#startDate,#endDate" ).datepicker();
			$( ".datePicker" ).datepicker( "option", "dateFormat", "dd/mm/yy" );
		});
	</script>
</head>
<body>
    <div id="wrapper">
    	<ul id="dates">
    		<li>Start Date</li>
    		<li><input type="text" name="startDate" id="startDate" class="datePicker"></li>
    		<li>End Date</li>
    		<li><input type="text" name="endDate" id="endDate" class="datePicker"></li>
    	</ul>
    </div>
</body>
</html>

