<cfparam name="textarea_1" default="">
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>CFTEXTAREA</title>
    <link rel="stylesheet" href="css/custom.css">
</head>
<body>
	<cfoutput>
		<cfform name="frmExample">
			<div id="cftextarea_content">
			    <cftextarea name="textarea_1" richtext="true" toolbar="Basic">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia, ducimus, libero reprehenderit fuga recusandae iste laudantium earum tempore laborum consequuntur eligendi porro. Quae, nisi quia assumenda explicabo omnis doloribus placeat?
			    </cftextarea>
			</div>
		    <cfinput type="submit" value="Update" name="frmExample_submit"/>
		</cfform>
		#textarea_1#
	</cfoutput>	
</body>
</html>
