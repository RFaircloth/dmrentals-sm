<!doctype html>
<html lang="en">

<head>

        <cfinclude template = "/modules/head/head.cfm"> 

</head>

<body>

        <img class="page_background" src="<cfoutput>#application.imagesDir#</cfoutput>/<cfoutput>#application.pageBackgroundImage#</cfoutput>"/>

        <cfinclude template="/modules/misc/screen_width/screen-width.cfm"/>



        <div id="page_wrapper"> 



                <cfinclude template = "/modules/header/header.cfm" />           



                <cfinclude template = "/modules/menu/menu.cfm">
                <script src = "/modules/menu/menu.js"></script>
                <link type="text/css" rel="stylesheet" href="/modules/menu/menu.css" >



                <cfinclude template = "/modules/rental-properties/rental-properties-content.cfm" />
                <script src = "/modules/rental-properties/rental-properties.js"></script>
                <link type="text/css" rel="stylesheet" href="/modules/rental-properties/rental-properties.css" >



        </div> <!--- [ #page_wrapper ] --->


</body>

</html>