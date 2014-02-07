<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />

	<title>CFDiv to jQuery Example</title>

	<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" />
	<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
</head>

<body>
	<div class="navbar navbar-default navbar-static-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">CFDiv to jQuery Example</a>
			</div>
		</div>
	</div>

	<div id="wrap">
		<div class="container">
			<div id="content">
				<h1>jQuery Example 1</h1>
				<div id="exampleContents"></div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#exampleContents").load("/cfdiv-source.cfm");
		});
	</script>
</body>
</html>