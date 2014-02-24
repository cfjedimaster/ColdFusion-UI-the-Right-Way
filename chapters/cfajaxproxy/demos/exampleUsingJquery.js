// jquery.js
$(document).ready(function(){
	$.ajax(
		"DAO.cfc?method=getData&returnformat=json",
		{
			success	: function(json){
				data = JSON.parse(json);
				renderData($("#data-goes-here"), data);
			}
		}
	);

});