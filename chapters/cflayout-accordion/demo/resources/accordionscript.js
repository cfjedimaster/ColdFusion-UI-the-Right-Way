$(function() {
	//initialize the accordion
	$("#accordion").accordion({
		beforeActivate: function(event, ui) {
			var $header = ui.newHeader,
				content = $header.data("content"),
				target = $header.data("target");

			if (content !== undefined) {
				$(target).load(content);
			}
		}
	});
});