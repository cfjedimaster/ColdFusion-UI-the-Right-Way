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
<cfoutput>
	<body>
		<table>
			<thead>
				<tr>
					<td><strong>Name</strong></td>
					<td><strong>Age</strong></td>
					<td><strong>Description</strong></td>
				</tr>
			</thead>
			<tbody>
				<cfloop query="qryData">
					<tr>
						<td>#name#</td>
						<td>#age#</td>
						<td>#desc#</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
	</body>
</cfoutput>
</html>
