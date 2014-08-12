

	$(document).ready(function() {

			$('#menu_button').mouseover(function() {

					$(this).css({'backgroundColor':'rgba(255,255,255,.5)', 'color':'rgba(0,0,0,1)', 'cursor':'pointer' });

			});

			$('#menu_button').mouseout(function() {

					$(this).css({'backgroundColor':'rgba(0,0,0,.8)', 'color':'rgba(255,255,206,1)'});

			});

			$('#menu_button').click(function() {

					if 		(	$('#menu_links').is(':hidden') 		)
								{	$('#menu_links').slideDown();
									return false();							}

					else if  (	$('#menu_links').is(':visible')		)
								{ 	$('#menu_links').slideUp();
									return false(); 							}

			});
	});

