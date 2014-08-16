
<cfoutput>

		<cftry>
			
				<cffile 	action 			=	'upload'
							filefield 		=	'file-0'
							destination 	=	'e:\inetpub\webroot\imagesToDelete'
							nameConflict 	=	'makeUnique' >

						<cfcatch>#cfcatch.message#</cfcatch>

		</cftry>

</cfoutput>

