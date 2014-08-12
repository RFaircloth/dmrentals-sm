
<cfcomponent hint="handles application settings and variables" output="false">

		<cfset this.name							=	"dmrentals"									/>
		<cfset this.sessionManagement 		= 	true											/>
		<cfset this.sessionTimeout 			= 	"#createTimeSpan(0,1,0,0)#"			/>
		<cfset this.applicationTimeout 		= 	"#createTimeSpan(1,0,0,0)#"			/>




	<cffunction name = "onApplicationStart" >

		<cfset application.absoluteRootDirectory 	=	getDirectoryFromPath(getCurrentTemplatePath()) />

		<!--- <cfset structDelete(session, 'site_manager_id') /> --->

		<cfif  cgi.server_name	is	'local.dm-rentals.com'	>

			<cfset application.site_dsn												=	"dmrentals-development"																/>
			<cfset application.site_name 												= 	"David McDonald Rental Properties"												/>
			<cfset application.site_short_domain 									=	"dm-rentals.com"																		/>
			<cfset application.site_contact_email_recipient						=	"teresa@dm-rentals.com"																/>
			<cfset application.site_contact_email_responder 					=	"teresa@dm-rentals.com"																/>
			<cfset application.site_refer_friend_business_email_recipient 	=	"teresa@dm-rentals.com"																/>
			<cfset application.site_refer_friend_business_email_responder	=	"teresa@dm-rentals.com"																/>
			<cfset application.site_phone_number									=	"912-368-9218"																			/>
			<cfset application.site_street_address									=	"704 E. Oglethorpe Hwy"																/>
			<cfset application.site_city												=	"Hinesville"																			/>
			<cfset application.site_state												=	"GA"																						/>
			<cfset application.site_zip_code											=	"31313"																					/>
			<cfset application.pageBackgroundImage 								=	"nebulosity01_bw_01.jpg"															/>
			<cfset application.site_logo 												= 	"dmrentals-logo.png"																	/>
			<cfset application.rootDir 												=	"/dmrentals/"																			/>
			<cfset application.imagesDir 												=	"site_wide_assets/images"															/>
			<cfset application.userImagesReadDir									=	"http://local.dm-rentals.com/user-images"										/>
			<cfset application.userImagesWriteDir 									=	"e:\inetpub\webroot\dmrentals\user-images" 									/>
			<cfset application.cssDir													=	"/dmrentals/css"																		/>
			<cfset application.jsDir													=	"/dmrentals/js"																		/>
			<cfset application.modulesDir												=	"/dmrentals/modules"																	/>
			<cfset application.includesPath 											=	"/dmrentals/includes"																/>
			<cfset application.modulesCFCPath										=	"modules"																				/>

		<cfelseif cgi.server_name is 'development.dm-rentals.com'		>

			<cfset application.site_dsn												=	"dmrentals-development"																/>
			<cfset application.site_name 												=	"David McDonald Rental Properties" 												/>
			<cfset application.site_short_domain 									=	"dm-rentals.com"																		/>
			<cfset application.site_contact_email_recipient						=	"teresa@dm-rentals.com"																/>
			<cfset application.site_contact_email_responder 					=	"teresa@dm-rentals.com"																/>			
			<cfset application.site_refer_friend_business_email_recipient	=	"teresa@dm-rentals.com"																/>
			<cfset application.site_refer_friend_business_email_responder	=	"teresa@dm-rentals.com"																/>
			<cfset application.site_phone_number									=	"912-368-9218" 																		/>
			<cfset application.site_street_address									=	"704 E. Oglethorpe Hwy"																/>
			<cfset application.site_city												=	"Hinesville"																			/>
			<cfset application.site_state												=	"GA"																						/>
			<cfset application.site_zip_code											=	"31313"																					/>			
			<cfset application.pageBackgroundImage 								=	"nebulosity01_bw_01.jpg"															/>
			<cfset application.site_logo 												= 	"dmrentals-logo.png"																	/>
			<cfset application.rootDir 												=	"/dmrentals-development/"															/>
			<cfset application.imagesDir												=	"site_wide_assets/images"															/>
			<cfset application.userImagesReadDir									=	"http://development.dm-rentals.com/user-images"								/>
			<cfset application.userImagesWriteDir									=	"e:\inetpub\webroot\dmrentals-development\user-images"					/>
			<cfset application.cssDir													=	"/dmrentals-development/css"														/>
			<cfset application.jsDir													=	"/dmrentals-development/js"														/>
			<cfset application.modulesDir												=	"/dmrentals-development/modules/"												/>
			<cfset application.includesPath											=	"/dmrentals-development/includes/"												/>
			<cfset application.modulesCFCPath										=	"modules"																				/>

		<cfelseif cgi.server_name is 'client.dm-rentals.com'		>

			<cfset application.site_dsn												=	"dmrentals-client"	 																/>
			<cfset application.site_name 												=	"David McDonald Rental Properties"												/>
			<cfset application.site_short_domain 									=	"dm-rentals.com"																		/>
			<cfset application.site_contact_email_recipient						=	"teresa@dm-rentals.com"																/>
			<cfset application.site_contact_email_responder 					=	"teresa@dm-rentals.com"																/>			
			<cfset application.site_refer_friend_business_email_recipient	=	"teresa@dm-rentals.com"																/>
			<cfset application.site_refer_friend_business_email_responder	=	"tereaa@dm-rentals.com"																/>
			<cfset application.site_phone_number									=	"912-368-9218"																			/>
			<cfset application.site_street_address									=	"704 E. Oglethorpe Hwy"																/>
			<cfset application.site_city												=	"Hinesville"																			/>
			<cfset application.site_state												=	"GA"																						/>
			<cfset application.site_zip_code											=	"31313"																					/>			
			<cfset application.pageBackgroundImage 								=	"nebulosity01_bw_01.jpg"															/>
			<cfset application.site_logo 												= 	"dmrentals-logo.png"																	/>
			<cfset application.rootDir 												=	"/wdmrentals-client/"																/>
			<cfset application.imagesDir												=	"site_wide_assets/images" 															/>
			<cfset application.userImagesReadDir									=	"http://client.dm-rentals.com/user-images"									/>
			<cfset application.userImagesWriteDir									=	"e:\inetpub\webroot\dmrentals-client\user-images"							/>
			<cfset application.cssDir													=	"/dmrentals-client/css"																/>
			<cfset application.jsDir													=	"/dmrentals-client/js"																/>
			<cfset application.modulesDir												=	"/dmrentals-client/modules/"														/>
			<cfset application.includesPath											=	"/dmrentals-client/includes/"														/>
			<cfset application.modulesCFCPath										=	"modules"																				/>

		<cfelseif cgi.server_name is 'www.dm-rentals.com'		>

			<cfset application.site_dsn												=	"dmrentals-production" 																/>
			<cfset application.site_name 												=	"David McDonald Rental Properties" 												/>
			<cfset application.site_short_domain 									=	"dm-rentals.com"																		/>
			<cfset application.site_contact_email_recipient						=	"teresa@dm-rentals.com"																/>
			<cfset application.site_contact_email_responder 					=	"teresa@dm-rentals.com"																/>			
			<cfset application.site_refer_friend_business_email_recipient	=	"teresa@dm-rentals.com"																/>
			<cfset application.site_refer_friend_business_email_responder	=	"teresa@dm-rentals.com"																/>
			<cfset application.site_phone_number									=	"912-368-9218" 																		/>
			<cfset application.site_street_address									=	"704 E. Oglethorpe Hwy"																/>
			<cfset application.site_city												=	"Hinesville"																			/>
			<cfset application.site_state												=	"GA"																						/>
			<cfset application.site_zip_code											=	"31313"																					/>
			<cfset application.pageBackgroundImage 								=	"nebulosity01_bw_01.jpg"															/>
			<cfset application.site_logo 												= 	"dmrentals-logo.png"																	/>
			<cfset application.rootDir 												=	"/dmrentals-production/"															/>
			<cfset application.imagesDir												=	"site_wide_assets/images"															/>
			<cfset application.userImagesReadDir									=	"http://wwww.dm-rentals.com/user-images"										/>
			<cfset application.userImagesWriteDir									=	"e:\inetpub\webroot\dmrentals-production\user-images"						/>
			<cfset application.cssDir													=	"/dmRentals-production/css"														/>
			<cfset application.jsDir													=	"/dmRentals-production/js"															/>
			<cfset application.modulesDir												=	"/dmRentals-production/modules/"													/>
			<cfset application.includesPath											=	"/dmRentals-production/includes/"												/>
			<cfset application.modulesCFCPath										=	"modules"																				/>


		</cfif>
	
	</cffunction>


	<cffunction name = "onRequestStart">

		<cfif structKeyExists(url, 'reinit')>

			<cfscript>
				onApplicationStart();
			</cfscript>

		</cfif>

	</cffunction>
	

</cfcomponent>		