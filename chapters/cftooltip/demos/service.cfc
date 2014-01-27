component {

	//Little trick to set all response types to JSON
	url.returnformat="json";

	remote function getData(required numeric id) {
		return "Pretend I did a db lookup for person #arguments.id# and I got some stuff.";
	}

}