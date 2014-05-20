<!--- CREATE THE CFC OBJECT --->
<cfset objContent = createObject("component", "content") />
<!--- GET THE INITIAL DATA SOURCE --->
<cfset srcData = objContent.srcData() />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>CFMEDIAPLAYER Alternative</title>
	<link type="text/css" rel="stylesheet" href="shadowbox-3.0.3/shadowbox.css">
    <link rel="stylesheet" href="css/custom.css">
	<script src="js/jquery-2.1.0.min.js"></script>
	<script type="text/javascript" src="shadowbox-3.0.3/shadowbox.js"></script>
</head>
<cfoutput>
<body>
	<ul>
		<cfloop query="srcData">
			<li>
				<cfset data = objContent.srcDataAttributes(srcData.id) />
			    <a rel="#data.rel#" href="#data.href#">
					<img src="#data.imgSrc#" class="media-thumbnail">
				</a>
			</li>
		</cfloop>
	</ul>
</body>
</cfoutput>
<footer>
    <script>
	     Shadowbox.init();
     </script>
</footer>
</html>
