
<cfcomponent name = "rentalProperties" output = "false">
	

		<cffunction 	name 			= 	"mUploadPropertyImage"
							displayName	=	"mUploadPropertyImage"
							hint 			=	"Uploads selected image for rental property"
							output 		=	"false"
							returnType 	=	"struct"
							access 		=	"remote" >
								
							<cfargument name = "property_image" 	type = "string" 	required = "yes"	>
							<cfargument name = "property_id" 		type = "string" 	required = "yes" 	>

							<cfset propertyImageStruct = structNew()>

							<cffile 	action 			=	'upload'
										filefield 		=	'property_image'
										destination 	=	'e:\inetpub\webroot\dmrentals-sm\images'
										nameConflict 	=	'makeUnique' >

							<cfimage action 			=	'resize'
										source 			=	'e:\inetpub\webroot\dmrentals-sm\images\#cffile.serverFile#'
										destination 	=	'e:\inetpub\webroot\dmrentals-sm\images\#cffile.serverFileName#_thumb.#cffile.serverFileExt#'
										width 			=	'200'
										height			=	''
										overwrite 		=	'true' >


							<cfset propertyImageStruct.PROPERTY_IMAGE				= 	'#cffile.serverFile#' >
							<cfset propertyImageStruct.PROPERTY_IMAGE_THUMB 	=	'#cffile.serverFileName#_thumb.#cffile.serverFileExt#' >
							<cfset propertyImageStruct.PROPERTY_ID 				=	'#arguments.property_id#'		>

							<cfreturn propertyImageStruct />


		</cffunction>




</cfcomponent>