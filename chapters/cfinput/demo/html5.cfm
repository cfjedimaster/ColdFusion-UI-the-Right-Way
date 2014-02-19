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
    <link rel="stylesheet" href="css/custom.css">
</head>
<body>
	<h4>HTML 5 browsers</h4>
	<label>
		Enter First Name<br />
		<input type="text" name="firstName" id="firstName" list="listFirstNames" maxlength="20" style="width:15%;">
		<datalist id="listFirstNames">
			<cfoutput query="qryData">
				<option value="#qryData.name#">
			</cfoutput>
		</datalist>
	</label>
	<h4>Legacy and HTML 5 browsers</h4>
	<label>
		Enter First Name<br />
		<input type="text" name="firstName" id="firstName" list="listFirstNames" maxlength="20" style="width:15%;"><br />
	</label>
	<datalist id="listFirstNames">
		<label>
			OR select one from the list below:<br />
			<select name="firstName">
				<cfoutput query="qryData">
					<option value="#qryData.name#">
				</cfoutput>
			</select>
		</label>
	</datalist>
</body>
</html>

