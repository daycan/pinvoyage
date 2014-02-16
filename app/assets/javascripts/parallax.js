jQuery(document).ready(function () {
	var jumboHeight = $('.jumbotron').outerHeight();
	function parallax(){
	    var scrolled = $(window).scrollTop();
	    $('.bg').css('height', (jumboHeight-scrolled));
	}


	$(window).scroll(function(e){
	    parallax();
	});
})