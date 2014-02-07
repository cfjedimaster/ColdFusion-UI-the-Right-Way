$(document).ready(function(){
	var daoProxy = new DAOProxy();
	var data = daoProxy.getData();
	renderData($("#data-goes-here"), data);
});