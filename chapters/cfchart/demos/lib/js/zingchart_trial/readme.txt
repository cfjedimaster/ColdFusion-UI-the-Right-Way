ZingChart
================================================

Thank you for trying ZingChart, what we hope you will find to be the most comprehensive JavaScript visualization library out there. We have included this simple tutorial to help you get started with your first chart.  You can find a comprehensive documentation site at www.zingchart.com/reference.  Here you will find a section on all of our JSON syntax attributes, tons of demos and tutorials, as well as documentation for our 150+ API methods and events.

================================================

Contact Us:

Email: support@zingchart.com
Phone: +1 858-490-5281
Twitter: twitter.com/ZingChart
Pinterest: pinterest.com/ZingChart

We're normally available between 8:00AM and 5:00PM PDT (GMT -8:00), Monday through Friday.

================================================

REQUIREMENTS

- ZingChart Library
- Web browser
- JavaScript support for HTML5 charts
- Flash version 10+ for Flash charts
- A text editor or IDE
- Web server access is required to host locally.  For Mac, we recommend MAMP and for Windows we recommend XAMPP or WampServer.


GETTING STARTED


STEP 1: Extract Zip file and place files in web directory


STEP 2: Skeleton File

Create a simple HTML skeleton file to hold your first example.

	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="utf-8">
	<title>Hello ZingChart</title>
	</head>
	<body>
 
	<div id="myChartDiv"></div>
 
	<script src="html5_scripts/zingchart-html5-min.js"></script>
	<script src="license.js"></script> //once you have purchased a license
	<script>
	 // your JavaScript will go here
	</script>
	</body>
	</html>

** Note: Make sure to add a <div> tag to hold your chart and link to the ZingChart library you downloaded. Be sure to include the correct path to the library. **


STEP 3: Configure a ZingChart Chart Object

In your JavaScript <script> element, we'll make a simple object that defines a line chart with two sets of values.

	var myChart = {
		type   : "line",
		title  : {text: "Hello ZingChart World!"},
		series : [
			{values:[5, 10, 15, 5, 10, 5]},
			{values:[2, 4, 6, 8, 10, 12]}
		]
	};


STEP 4: Call the Render Function

The zingchart object includes a render() method which takes a configuration object. The most basic example is shown below. The render() method should also be placed within the <script> element.

	zingchart.render({
		id : "myChartDiv",
		height : 450,
		width : 600,
		data : myChart
	});	

- id references the DOM id to render the chart to
- height and width are the dimension of the chart in pixels
- data is a reference to a JavaScript variable that defines the structure and data of the chart

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

HERE IS THE COMPLETE CODE YOU NEED TO RENDER YOUR FIRST CHART

	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="utf-8">
	<title>Hello ZingChart</title>
	</head>
	<body>
 
	<div id="myChartDiv"></div>
 
	<script src="html5_scripts/zingchart-html5-min.js"></script>
	<script src="license.js"></script> <!--Once you have purchased a license-->
	
	<script>
	 var myChart = {
		type   : "line",
		title  : {text: "Hello ZingChart World!"},
		series : [
			{values:[5, 10, 15, 5, 10, 5]},
			{values:[2, 4, 6, 8, 10, 12]}
		]
	};
	window.onload=function(){
	zingchart.render({
		id : "myChartDiv",
		height : 450,
		width : 600,
		data : myChart
		});	
	};
	</script>
	</body>
	</html>

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Hopefully this brief step by step example helped you render your first ZingChart.  For more detailed documentation and demos please visit our documentation site at www.zingchart.com/reference.  If you are looking for more personalized support or have questions regarding specific functionality please feel free to contact us.

================================================

Contact Us:

Email: support@zingchart.com
Phone: +1 858-490-5281
Twitter: twitter.com/ZingChart
Pinterest: pinterest.com/ZingChart

We're normally available between 8:00AM and 5:00PM PDT (GMT -8:00), Monday through Friday.

================================================
