
<cfcomponent name = "rentalProperties" output = "false">


		<cffunction 	name 			=	"mAddRentalProperty"
							displayName	=	"mAddRentalProperty"
							hint			=	"Adds New Rental Property Data"
							output		=	"false"
							returnType	=	"struct"
							access		=	"remote" >


							<cfargument name = "site_dsn" 					type = "string" 	required = "yes">
							<cfargument name = "street_number"				type = "string" 	required = "yes">
							<cfargument name = "street_name" 				type = "string" 	required = "yes">
							<cfargument name = "city" 							type = "string" 	required = "yes">
							<cfargument name = "state" 						type = "string" 	required = "yes">
							<cfargument name = "zip_code" 					type = "string" 	required = "yes">

							<cfargument name = "property_type"				type = "string" 	required = "yes">
							<cfargument name = "county" 						type = "string" 	required = "yes">
							<cfargument name = "subdivision" 				type = "string" 	required = "yes">

							<cfargument name = "total_rooms" 				type = "string" 	required = "yes">
							<cfargument name = "bedrooms" 					type = "string" 	required = "yes">
							<cfargument name = "full_baths" 					type = "string" 	required = "yes">
							<cfargument name = "half_baths" 					type = "string" 	required = "yes">

							<cfargument name = "living_room" 				type = "string" 	required = "yes">
							<cfargument name = "dining_room" 				type = "string" 	required = "yes">
							<cfargument name = "family_room" 				type = "string" 	required = "yes">
							<cfargument name = "fireplace" 					type = "string" 	required = "yes">

							<cfargument name = "rent" 							type = "string" 	required = "yes">
							<cfargument name = "security_deposit" 			type = "string" 	required = "yes">
							<cfargument name = "availability_date"			type = "string" 	required = "yes">
							<cfargument name = "lease_term" 					type = "string" 	required = "yes">

							<cfargument name = "year_built" 					type = "string" 	required = "yes">
							<cfargument name = "appliances" 					type = "string" 	required = "yes">
							<cfargument name = "water_included" 			type = "string" 	required = "yes">
							<cfargument name = "alarm_system" 				type = "string" 	required = "yes">

							<cfargument name = "pets_allowed" 				type = "string" 	required = "yes">
							<cfargument name = "pet_deposit" 				type = "string" 	required = "yes">
								
							<cfargument name = "fence" 						type = "string" 	required = "yes">
							<cfargument name = "fence_description"			type = "string" 	required = "yes">

							<cfargument name = "car_parking" 				type = "string" 	required = "yes">
							<cfargument name = "utilities" 					type = "string" 	required = "yes">

							<cfargument name = "washer_dryer_included" 	type = "string" 	required = "yes">
							<cfargument name = "washer_dryer_hookups"		type = "string" 	required = "yes">

							<cfargument name = "unavailable_repair" 		type = "string" 	required = "yes">
							<cfargument name = "unavailable_rented" 		type = "string" 	required = "yes">
							<cfargument name = "unavailable_other" 		type = "string" 	required = "yes">

							<cfargument name = "remarks" 						type = "string" 	required = "yes">


							<cfset addPropertyStruct = structNew() >

							<cfquery name = "qAddRentalProperty" datasource="#application.site_dsn#">
								

									insert into rental_properties

													( 	street_number, street_name, city, state, zip_code, property_type,
													 	county, subdivision, total_rooms, bedrooms, full_baths, half_baths,
													 	living_room, dining_room, family_room, fireplace, rent, security_deposit,
													 	availability_date, lease_term, year_built, appliances, water_included, alarm_system,
													 	pets_allowed, pet_deposit, fence, fence_description, car_parking, utilities,
													 	washer_dryer_included, washer_dryer_hookups, unavailable_repair, unavailable_rented,
													 	unavailable_other, remarks	)

									values 		( 	<cfqueryparam 	cfsqltype = "cf_sql_varchar" 		value = "#arguments.street_number#">,
										  				<cfqueryparam 	cfsqltype = "cf_sql_varchar" 		value = "#arguments.street_name#">,
										  				<cfqueryparam 	cfsqltype = "cf_sql_varchar" 		value = "#arguments.city#">,
										  				<cfqueryparam 	cfsqltype = "cf_sql_varchar" 		value = "#arguments.state#">,
										  				<cfqueryparam 	cfsqltype = "cf_sql_varchar" 		value = "#arguments.zip_code#">,
														<cfqueryparam 	cfsqltype = "cf_sql_varchar" 		value = "#arguments.property_type#">,
														<cfqueryparam 	cfsqltype = "cf_sql_varchar" 		value = "#arguments.county#">,
														<cfqueryparam 	cfsqltype = "cf_sql_varchar" 		value = "#arguments.subdivision#">,
										  				<cfqueryparam 	cfsqltype = "cf_sql_char"			value = "#arguments.total_rooms#">,
										  				<cfqueryparam 	cfsqltype = "cf_sql_tinyint"		value = "#arguments.bedrooms#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_tinyint"		value = "#arguments.full_baths#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_char"			value = "#arguments.half_baths#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_char"			value = "#arguments.living_room#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_char"			value = "#arguments.dining_room#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_char"			value = "#arguments.family_room#">,
										  				<cfqueryparam 	cfsqltype = "cf_sql_char"			value = "#arguments.fireplace#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_smallint"		value = "#val(LSParseCurrency(arguments.rent))#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_smallint"		value = "#val(LSParseCurrency(arguments.security_deposit))#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_date"			value = "#parseDateTime(arguments.availability_date, 'mmm d, yyyy')#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_varchar"		value = "#arguments.lease_term#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_varchar"		value = "#arguments.year_built#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_varchar"		value = "#arguments.appliances#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_char"			value = "#arguments.water_included#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_char"			value = "#arguments.alarm_system#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_char"			value = "#arguments.pets_allowed#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_char"			value = "#arguments.pet_deposit#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_char"			value = "#arguments.fence#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_varchar"		value = "#arguments.fence_description#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_varchar"		value = "#arguments.car_parking#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_varchar"		value = "#arguments.utilities#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_char"			value = "#arguments.washer_dryer_included#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_char"			value = "#arguments.washer_dryer_hookups#">,
										  				<cfqueryparam 	cfsqltype = "cf_sql_char" 			value = "#arguments.unavailable_repair#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_char" 			value	= "#arguments.unavailable_rented#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_char" 			value = "#arguments.unavailable_other#">,
										  				<cfqueryparam	cfsqltype = "cf_sql_varchar" 		value = "#arguments.remarks#"> )

							</cfquery>


							<cfquery		name="qGetLastInsertID"		datasource="#arguments.site_dsn#">
					
									select	LAST_INSERT_ID() as property_id
									from		rental_properties
						
							</cfquery>


							<cfset 	addPropertyStruct.STATUS 			= 	'Success' 									/>
							<cfset 	addPropertyStruct.PROPERTY_ID		=	'#qGetLastInsertID.property_id#' 	/>

							<cfset 	addPropertyStruct.STREET_NUMBER 	=	'#arguments.street_number#' 			/>
							<cfset	addPropertyStruct.STREET_NAME		=	'#arguments.street_name#'				/>
							<cfset 	addPropertyStruct.CITY				=	'#arguments.city#' 						/>
							<cfset 	addPropertyStruct.STATE 			=	'#arguments.state#' 						/>

							<cfreturn addPropertyStruct />


		</cffunction>


	

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
										destination 	=	'#application.userImagesWriteDir#' 
										nameConflict 	=	'makeUnique' >

							<cfset propertyImageStruct.UPLOADED_IMAGE 			=	'#cffile.serverFile#' >

							<cfimage action 			=	'resize'
										source 			=	'e:\inetpub\webroot\dmrentals\user-images\#cffile.serverFile#'
										destination 	=	'e:\inetpub\webroot\dmrentals\user-images\#cffile.serverFileName#_w200.#cffile.serverFileExt#'
										width 			=	'200'
										height			=	''
										overwrite 		=	'true' >
											
							</cfimage>

							<cfset propertyImageStruct.IMAGE_200 					=	'#cffile.serverFileName#_w200.#cffile.serverFileExt#' >

							<cfimage action 			=	'resize'
										source 			=	'#application.userImagesWriteDir#\#cffile.serverFile#'
										destination 	=	'#application.userImagesWriteDir#\#cffile.serverFileName#_w320.#cffile.serverFileExt#'
										width 			=	'320'
										height			=	''
										overwrite 		=	'true' >

							<cfset propertyImageStruct.IMAGE_320 					= '#cffile.serverFileName#_w320.#cffile.serverFileExt#' >

							<cfimage action 			=	'resize'
										source 			=	'#application.userImagesWriteDir#\#cffile.serverFile#'
										destination 	=	'#application.userImagesWriteDir#\#cffile.serverFileName#_w480.#cffile.serverFileExt#'
										width 			=	'480'
										height			=	''
										overwrite 		=	'true' >

							<cfset propertyImageStruct.IMAGE_480 					= '#cffile.serverFileName#_w480.#cffile.serverFileExt#' >

							<cfimage action 			=	'resize'
										source 			=	'#application.userImagesWriteDir#\#cffile.serverFile#'
										destination 	=	'#application.userImagesWriteDir#\#cffile.serverFileName#_w600.#cffile.serverFileExt#'
										width 			=	'600'
										height			=	''
										overwrite 		=	'true' >

							<cfset propertyImageStruct.IMAGE_600 					= '#cffile.serverFileName#_w600.#cffile.serverFileExt#' >

							<cfimage action 			=	'resize'
										source 			=	'#application.userImagesWriteDir#\#cffile.serverFile#'
										destination 	=	'#application.userImagesWriteDir#\#cffile.serverFileName#_w800.#cffile.serverFileExt#'
										width 			=	'800'
										height			=	''
										overwrite 		=	'true' >

							<cfset propertyImageStruct.IMAGE_800 					= '#cffile.serverFileName#_w800.#cffile.serverFileExt#' >																				


							<cfset propertyImageStruct.UPLOADED_IMAGE				= 	'#cffile.serverFile#' >
							<cfset propertyImageStruct.PROPERTY_ID 				=	'#arguments.property_id#'		>

							<cfreturn propertyImageStruct />


		</cffunction>




</cfcomponent>