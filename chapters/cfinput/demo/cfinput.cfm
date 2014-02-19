
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
<cfoutput>
    <body>
        <cfform>
            <ul id="inputs">
                <li>
                    <label for="firstName">Enter First Name: </label>
                </li>
                <li>
                    <cfinput name="firstName" id="firstName" type="text" autoSuggest="#valueList(qryData.name)#" typeahead="true" />
                </li>
            </ul>
        </cfform>
    </body>
</cfoutput>
</html>
