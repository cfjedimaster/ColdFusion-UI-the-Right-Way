$(document).ready(function(){
	$.getJSON(
		"DAO.cfc?method=getDataForJSVersion",
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
			height	: 375,
			width	: 500,
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