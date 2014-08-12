<!doctype html>
<html lang="en">

<head>

		<title><cfoutput>Site Manager: #application.site_name#</cfoutput></title>

		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<link type='text/css' rel='stylesheet' href='/site_wide_assets/css/reset.css' />

		<script src="/site_wide_assets/jquery/jquery-2.1.1.min.js"></script>
		<script src="/site_wide_assets/harvey/harvey.js"></script>
		<script src="/site_wide_assets/harvey/site_wide_harvey.js"></script>
		<script src="/modules/menu/menu.js"></script>

</head>

<body>

		<style>
				.page_background { height:auto; width:100%; min-height:100%; min-width:100%; position:fixed; top:0px; left:0px; }
		</style>

		<img class="page_background" src="<cfoutput>#application.imagesDir#</cfoutput>/<cfoutput>#application.pageBackgroundImage#</cfoutput>"/>

		<cfinclude template="/modules/misc/screen_width/screen-width.cfm"/>




		<style>

				@media screen and (max-width:601px) and (orientation:portrait) {

						#page_wrapper { position:relative; width:95%; margin:0 auto; margin-top:1em; }

				}

				@media screen and (min-width:602px) {

						#page_wrapper {	position:relative; width:90%; margin:0 auto; margin-top:1.5em; max-width:1400px; }

				}

		</style>

		<div id="page_wrapper">




				<style>
						.container_100 { border:1px solid rgba(255,255,255,.7); border-radius:1em; background-color:rgba(0,0,0,.6);
											  margin-bottom:1em; padding:1em 2em; }
				</style>

				<div id="header" class="container_100">





						<style>

							@media screen and (max-width:601px) and (orientation:portrait) {

								#logo { margin-top:.5em; margin-bottom:.75em; margin-left:1em; float:none; max-width:500px; }
							}

							@media screen and (min-width:602px) {

								#logo 		{ 	margin-top:.25em; float:left; max-width:500px; }
							}

						</style>

						<img id="logo" src="<cfoutput>#application.imagesDir#</cfoutput>/<cfoutput>#application.site_logo#</cfoutput>" />




					<div style="clear:both;"></div>

				</div> <!--- [ #header ] --->					





				<style>

						.menu_container_100 	{ 	border:1px solid rgba(255,255,255,.7); border-radius:1em; background-color:rgba(0,0,0,.6);
											 			margin-bottom:1em; margin-top:1.5em; padding:1em 2em; text-align:center;}

						.menu_button 			{  padding:4px 18px 4px 18px;	border:1px solid rgba(255,255,206,.5); border-radius:.5em;
														color:rgba(255,255,206,1); background-color:rgba(0,0,0,.8); }

				</style>

				<div id="menu" class="menu_container_100">

					<span class="menu_button">Menu</span>

				</div> <!--- [ #menu ] --->





		</div> <!--- [ #page_wrapper ] --->


</body>

</html>