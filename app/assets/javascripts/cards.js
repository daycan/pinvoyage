jQuery(document).ready(function () {
	$("#geocomplete").geocomplete({
		map: "#map_canvas",
		details: "form",
		detailsAttribute: "geodata",
	});

	$("#geofind").click(function(){
	  $("#geocomplete").trigger("geocode");
	});

});

