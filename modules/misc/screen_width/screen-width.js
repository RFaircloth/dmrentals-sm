
$(document).ready(function() {

	var innerWindowWidth = $(window).innerWidth();
	$('#current_screen_width').html('current screen width = ' + innerWindowWidth);

	$(window).resize(function() {

	 	var innerWindowWidth = $(window).innerWidth();
	 	$('#current_screen_width').html('current screen width = ' + innerWindowWidth);

	});

});