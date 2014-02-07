<cfset data = queryNew("name,age,desc", "varchar,integer,varchar", [
	{name:"Raymond",age:40,desc:"He is Ray"},
	{name:"Scott",age:60,desc:"The Mighty Scott"},
	{name:"Todd",age:35,desc:"The founder of Cold things."},
	{name:"Dave",age:42,desc:"Kung Fu Master"}
	])>
	
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Test1</title>
	<link rel="stylesheet" href="lib/css/ui-lightness/jquery-ui-1.10.4.custom.min.css">
	<script src="lib/js/jquery-1.10.2.js"></script>
	<script src="lib/js/jquery-ui-1.10.4.custom.min.js"></script>

	<script>
	$(document).ready(function() {
		$("h1").tooltip();
	});
	</script>

</head>
<body>
 
	<p>
		This is just a random paragraph.
	</p>

	<cfoutput query="data">
		<h1 title="This is #name#, who is #age# years old and: #desc#">#name#</h1>
	</cfoutput>	
</body>
</html>
