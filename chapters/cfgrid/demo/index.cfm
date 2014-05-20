<cfsetting showdebugoutput="false">
<!--- CREATE THE CFC OBJECT --->
<cfset objContent = createObject("component", "cfc.content") />
<!--- OBTAIN THE DATA --->
<cfset qryData = objContent.srcData() />
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=1024" />
    <title>CFGRID - ALTERNATIVE USING datatables</title>
    <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
</head>
<cfoutput>
<body>
    <div id="dt_div">
        <table id="dt_table" class="display">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Type</th>
                    <th>Sub Type</th>
                    <th>Title</th>
                    <th>Name</th>
                    <th>Year</th>
                </tr>
            </thead>
            <tbody>
                <cfloop query="qryData">
                    <tr>
                        <td>#qryData.id#</td>
                        <td>#qryData.type#</td>
                        <td>#qryData.sub_type#</td>
                        <td>#qryData.title#</td>
                        <td>#qryData.name#</td>
                        <td>#qryData.year#</td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </div>
</body>
</cfoutput>
<footer>
    <script type="text/javascript" charset="utf8" src="js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" charset="utf8" src="js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready( function () {
            $('#dt_table').DataTable();
        } );
    </script>
</footer>
</html>

