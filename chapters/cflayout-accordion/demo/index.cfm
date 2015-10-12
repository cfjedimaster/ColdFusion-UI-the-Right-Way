<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
        <title>Accordion Layout Using jQuery UI</title>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <style>
            body {margin: 20px;}
        </style>
	</head>
	<body>
		<div id="accordion">
			<h3>American League - East</h3>
			<div>
				<ul>
                    <li>Baltimore Orioles</li>
                    <li>Boston Red Sox</li>
                    <li>New York Yankees</li>
                    <li>Tampa Bay Rays</li>
                    <li>Toronto Blue Jays</li>
                </ul>
			</div>
			<h3>American League - Central</h3>
			<div>
				 <ul>
                    <li>Chicago White Sox</li>
                    <li>Cleveland Indians</li>
                    <li>Detroit Tigers</li>
                    <li>Kansas City Royals</li>
                    <li>Minnesota Twins</li>
                </ul>
			</div>
			<h3 data-content="alwest.cfm" data-target="#alwestDiv">American League - West</h3>
			<div id="alwestDiv"></div>
		</div>

		<script src="//code.jquery.com/jquery.js"></script>
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		<script src="./resources/accordionscript.js"></script>
	</body>
</html>