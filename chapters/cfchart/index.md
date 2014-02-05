cfchart
===

The `<cfchart>` tag provides the ability to create charts in CFML. As a very minimal example:

**Listing 1 : min.cfm**

    <cfchart format="html">
	    <cfchartseries type="Bar" label="Numbers">
	         <cfchartdata item="e" value="2.71828">
            <cfchartdata item="&pi;" value="3.14159">
        </cfchartseries>
    </cfchart>

![Minimal example](images/minimal.png "Minimal example")
	
	
`<cfchart>` can implement charts as images in JPG or PNG format, as well as Flash, and - the focus of this chapter - JS/CSS/HTML.

For this chapter we will make use of the [ZingCharts](http://www.zingchart.com/) library, which is the same library ColdFusion uses. However we will simply use ZingCharts directly. Coincidentally the examples will also use JQuery to provide AJAX access to the data for the example, but this is just to demonstrate separation of model and view concerns, and is not a requirement of ZingCharts itself.

As a baseline, here is how one might implement a quick stacked bar chart with `<cfchart>`:

**Listing 2 : cfchart.cfm**
    
    <cfset records = new lib.cfml.DAO().getDataForCfmlVersion()>
	<cfset seriesColours = ["Green","Yellow","Purple"]>
	<cfset seriesColour = 1>
	<cfchart chartwidth="1000" chartheight="750" seriesplacement="stacked" format="html">
		<cfloop query="records" group="item">
			<cfchartseries type="Bar" label="#item#" seriescolor="#seriesColours[seriesColour++]#">
				<cfloop>
					<cfchartdata item="#day#" value="#total#">
				</cfloop>
			</cfchartseries>
		</cfloop>
	</cfchart>

With the data returned from the DAO, this renders:

![&lt;cfchart&gt;](images/cfchart.png "&lt;cfchart&gt;")


Now here is an analogous chart, totally written in simple HTML and JavaScript. 

**Listing 3 : zingChart.html**
    
    <!doctype html>
    <html>
        <head>
            <script type="text/javascript" src="lib/js/zingchart_trial/html5_scripts/zingchart-html5-min.js"></script>
            <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
        </head>
        <body>
            <div id="myChartDiv"></div>
        </body>
        <script type="text/javascript" src="lib/js/renderChart.js"></script>
    </html>

**Listing 4 : renderChart.js**
    
	$(document).ready(function(){
		$.getJSON(
			"lib/cfml/DAO.cfc?method=getDataForJSVersion",
			function(data){
				applyLabels(data.records);
				zingchart.render(configureChartParams(data));	
			}
		);

		var applyLabels = function(records){
			seriesColours = ["Green","Yellow","Purple"];
			records.forEach(function(series, index){
				series["background-color"] = seriesColours[index];
			});
			return records;
		};

		var configureChartParams = function(data){
			return {
				id		: "myChartDiv",
				height	: 750,
				width	: 1000,
				data	: myChart = {
					type	: "bar",
					stacked	: true,
					series	: data.records,
					"scale-x"	: {
						values:data.label
					},
					legend		: {}
				}
			};	
		}

	});
	
	
As you can see, the only mark-up needed is the myChartDiv `<div>`. The rest is done with JavaScript. It might seem like the JavaScript is complicated, but it boils down to a call to `zingchart.render()`, passing it an object containing data and config. As I said above I am using AJAX here to fetch the raw data from the server, but that is not a requirement, it could just as easily be inline JavaScript. Here's the render:

![ZingChart](images/ZingChart.png "ZingChart")

The styling is not exactly the same, but that's due to ColdFusion using different "default" styling than ZingCharts does.

For completeness, here is the code for `DAO.cfc`:

**Listing 5 : DAO.cfc**

    component {

        remote struct function getDataForJSVersion() returnformat="json" {
            return {
                "labels"    = "Mon,Tue,Wed,Thu,Fri",
                "records"    = [
                    {
                        "text"    ="Apples",
                        "values"=[1,2,4,8,4]
                    },{
                        "text"    ="Bananas",
                        "values"=[10,8,6,4,6]
                    },{
                        "text"    ="Cherries",
                        "values"=[1,3,9,3,1]
                    }
                ]
            };
        }

        public query function getDataForCfmlVersion(){
            return queryNew(
                "id,day,item,total",
                "integer,varchar,varchar,integer", [
                    [1, "Mon", "Apples", 1],
                    [4, "Tue", "Apples", 2],
                    [7, "Wed", "Apples", 4],
                    [10, "Thu", "Apples", 8],
                    [13, "Fri", "Apples", 4],
                    [2, "Mon", "Bananas", 10],
                    [5, "Tue", "Bananas", 8],
                    [8, "Wed", "Bananas", 6],
                    [11, "Thu", "Bananas", 4],
                    [14, "Fri", "Bananas", 6],
                    [3, "Mon", "Cherries", 1],
                    [6, "Tue", "Cherries", 3],
                    [9, "Wed", "Cherries", 9],
                    [12, "Thu", "Cherries", 3],
                    [15, "Fri", "Cherries", 1]
                ]
            );
        }
    }

Alternatives
---

* TBC


