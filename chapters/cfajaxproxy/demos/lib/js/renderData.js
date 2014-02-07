renderData = function(element, data){
	data.labels.forEach(function(day,i){
		element.append("<h2>" + day + "</h2>")
			.append(
				(function(){
					return "<ul>"
							+ data.records.reduce(
								function(previousValue,currentValue){
									return previousValue + "<li>" + currentValue.text + ": " + currentValue.values[i] + "</li>";
								},
								""
							)
							+ "</ul>"
					;
				})()
			);
		;
	});
};