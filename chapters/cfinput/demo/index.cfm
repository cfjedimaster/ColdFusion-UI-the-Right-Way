<cfset data = queryNew("name,age,desc", "varchar,integer,varchar", [
    {name:"Raymond",age:40,desc:"He is Ray"},
    {name:"Richard",age:40,desc:"He is Richard"},
    {name:"Ripley",age:40,desc:"Alien"},
    {name:"Scott",age:60,desc:"The Mighty Scott"},
    {name:"Todd",age:35,desc:"The founder of Cold things."},
    {name:"Dave",age:42,desc:"Kung Fu Master"},
    {name:"David",age:42,desc:"Kung Fu Mimic"},
    {name:"Davina",age:42,desc:"Kung Fu Mistress"}
])>
<cfquery name="qryData" dbtype="query">
    SELECT *
    FROM data
</cfquery>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>jQuery UI Autocomplete - Default functionality</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.9.1.js"></script>
	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<link rel="stylesheet" href="css/custom.css">
	<script>
		$(function() {
			var availableTags = [
			<cfoutput query="qryData">
				<cfif qryData.currentrow NEQ qryData.recordcount>
					"#qryData.name#",
				<cfelse>	
					"#qryData.name#"
				</cfif>
			</cfoutput>
			];
			$( "#firstName" ).autocomplete({
			source: availableTags
			});
		});
	</script>
</head>
<body>
	<div class="ui-widget">
		<ul id="inputs">
			<li>
				<label for="firstName">Enter First Name: </label>
			</li>
			<li>
				<input id="firstName">
			</li>
		</ul>
	</div>
</body>
</html>
