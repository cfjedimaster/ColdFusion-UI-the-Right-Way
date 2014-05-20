<cfparam name="textarea_1" default="">
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>CFTEXTAREA Alternative</title>
    <link rel="stylesheet" href="css/custom.css">
</head>
<body>
	<cfoutput>
		<div id="content">
			<form name="frmExample" >
			    <textarea id="textarea_1" name="textarea_1">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia, ducimus, libero reprehenderit fuga recusandae iste laudantium earum tempore laborum consequuntur eligendi porro. Quae, nisi quia assumenda explicabo omnis doloribus placeat?
			    </textarea>
			    <input type="submit" value="Update" name="frmExample_submit"/>
			</form>	
		</div>
		#textarea_1#
	</cfoutput>
</body>
<footer>
	<script src="js/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		CKEDITOR.replace('textarea_1');
   	</script>
</footer>
</html>
