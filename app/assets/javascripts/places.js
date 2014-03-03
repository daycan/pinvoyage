jQuery(document).ready(function () {
	$("#geocomplete").geocomplete();

	$("#geofind").click(function(){
	  $("#geocomplete").trigger("geocode");
	});
});