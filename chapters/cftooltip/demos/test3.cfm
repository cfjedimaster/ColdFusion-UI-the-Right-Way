<cfset data = queryNew("id,name,age,desc", "integer,varchar,integer,varchar", [
	{id:1, name:"Raymond",age:40,desc:"He is Ray"},
	{id:2, name:"Scott",age:60,desc:"The Mighty Scott"},
	{id:3, name:"Todd",age:35,desc:"The founder of Cold things."},
	{id:4, name:"Dave",age:42,desc:"Kung Fu Master"}
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
		$(document).tooltip({
			items:'p.person',
			content:function(callback) {
				var id = $(this).data("id");
				$.get('service.cfc?method=getdata',{id:id}, function(res) {
					callback(res);
				});
			}
		});
	});
	</script>

</head>
<body>
 
	<p>
		This is just a random paragraph.
	</p>

	<cfoutput query="data">
		<p class='person' data-id="#id#">#name#</p>
	</cfoutput>	
</body>
</html>
