var map;
function initialise() {
	var mapOptions = {
		zoom		: 15,
		center		: new google.maps.LatLng(-37.0477058,174.500332),
		mapTypeId	: google.maps.MapTypeId.SATELLITE
	};
	map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}

google.maps.event.addDomListener(window, 'load', initialise);