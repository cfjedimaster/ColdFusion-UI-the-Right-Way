<cfset data = queryNew("name,age,desc", "varchar,integer,varchar", [
    {name:"Raymond",age:40,desc:"He is Ray"},
    {name:"Scott",age:60,desc:"The Mighty Scott"},
    {name:"Todd",age:35,desc:"The founder of Cold things."},
    {name:"Dave",age:42,desc:"Kung Fu Master"}
])>

<cfquery name="qryData" dbtype="query">
    SELECT *
    FROM data
</cfquery>

<!DOCTYPE html>
<html lang="en">
<body>
	<cftable query="qryData" startRow="1" colSpacing="3" HTMLTable colHeaders>
	    <cfcol header="<b>Name</b>" align="Left" width="5" text="#name#">
	    <cfcol header="<b>Age</b>" align="Left" width="5" text="#age#">
	    <cfcol header="<b>Description</b>" align="Left" width="5" text="#desc#">
	</cftable>
</body>
</html>
