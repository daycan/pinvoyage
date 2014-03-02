
$("#geocomplete").geocomplete(
	map: "#map"
);

$("#find").click(function(){
  $("#geocomplete").trigger("geocode");
});


