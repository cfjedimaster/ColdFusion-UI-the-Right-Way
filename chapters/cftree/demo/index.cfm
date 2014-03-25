<!--- CREATE THE CFC OBJECT --->
<cfset objContent = createObject("component", "content") />
<!--- GET THE INITIAL DATA SOURCE --->
<cfset getSourceData = objContent.getSourceData()>
<!--- GET THE TREE --->
<cfset getTree = objContent.generateTree(ParentID=0,level=0,prev_thing=0,qryTree=getSourceData)>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>CFTREE Alternative</title>
    <link rel="stylesheet" href="css/custom.css">
	<script src="//code.jquery.com/jquery-1.9.1.js"></script>
	<script src="js/main.js"></script>
</head>
<body>
	<div id="geo-tree">
		<cfoutput>#getTree#</cfoutput>
	</div>
</body>
<footer>
</footer>
</html>
