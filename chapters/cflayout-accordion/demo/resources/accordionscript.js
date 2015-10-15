$(function() {
	$("#accordion").accordion({
		beforeActivate: function(event, ui) {
			var $header = ui.newHeader,
				content = $header.data("content"),
				target = $header.data("target");

			if (content !== undefined && target !== undefined) {
				$(target).load(content);
			}
		}
	});
});