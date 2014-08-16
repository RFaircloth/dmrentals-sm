<cfcomponent name="rentalProperties" output="false">
	
<!--- [ mGetRentalProperties ] -------------------------------------------------------------------------------------------------- --->

	<cffunction		name				=	"mGetRentalProperties"
						displayName		=	"mGetRentalProperties"
						hint				=	"Gets a list of all rental properties, both active and inactive"
						output			=	"false"
						returnType		=	"struct"
						access			=	"remote"	>
					
					<cfargument 	name = "dsn"			type = "string"		required = "yes">
						
					<cfset	propertiesStruct = structNew()>
					
					<cfquery name = 'qGetRentalProperties'	datasource = '#arguments.dsn#'>
						
						select		*
						from		rentalProperties
						order by	streetName, streetNumber
							
					</cfquery>
					
					<cfsaveContent variable = 'rentalPropertiesHTML'>
						
						<div style="height:20px;"></div>
						<p style="font-weight:bold; margin-left:37px;">Total Properties Retrieved:  <cfoutput>#qGetRentalProperties.recordCount#</cfoutput></p>
						<p>&nbsp;</p>
						
						
								
						<table style="padding:0; margin:0; border:0; width:500px; margin-left:37px;">
									
							<cfoutput query="qGetRentalProperties">
								
								<tr id="#propertyID#">
									<td style="width:380px;">#streetNumber# #streetName#, #city#, #state# #zipCode#</td>
									<td style="width:60px; text-align:center;"><a href="" onClick="return false;" class="update">update</a></td>
									<td style="width:60px; text-align:center;"><a href="" onClick="return false;" class="delete">delete</a></td>
								</tr>
									
							</cfoutput>
									
						</table>
							
					</cfsavecontent>
						
					<cffile 	action			=	"write"
								nameconflict	=	"overwrite"
								file			=	"#expandPath('rentalPropertiesHTML.cfm')#"
								output			=	"#rentalPropertiesHTML#">													
						
					<cfset propertiesStruct.STATUS 	=	'Success'>
						
					<cfreturn propertiesStruct />

	</cffunction>
	
	
<!--- [ mGetRentalProperty ] ---------------------------------------------------------------------------------------------------- --->

	<cffunction		name				=	"mGetRentalProperty"
						displayName		=	"mGetRentalProperty"
						hint				=	"Get Single Rental Property Data"
						output			=	"false"
						returnType		=	"struct"
						access			=	"remote"	>
						
					<cfargument		name = "propertyID"		type = "string"		required = "yes">
						
					<cfset	propertyStruct = structNew()>
					
					<cfquery name = "qGetRentalProperty"	datasource="holtzmanrentals">
					
						select		*
						from		rentalProperties
						where		propertyID = '#arguments.propertyID#'
						
					</cfquery>
					
					<cfif qGetRentalProperty.recordCount eq 0 >
					
						<cfset	propertyStruct.STATUS		=	'Unsuccessful'	/>
						
					<cfelseif qGetRentalProperty.recordCount gt 0 >
					
						<cfsaveContent variable = 'rentalPropertyUpdateHTML'>
							
							<script type="text/javascript">
							
								$(document).ready(function() {
									
									$('.error').hide();
									$('#updatingImg').hide();
									$('#updatingText').hide();
									$('#updateError').hide();
									$('.validationError').hide();
									
								});
								
							</script>
							
							<cfoutput query = "qGetRentalProperty">
						
							<div class="rentalPropertyUpdateWindowOverlay"></div>
							
							<form id="updateRentalPropertyForm" method="post">
	
							<div id="rentalPropertyUpdateDialog">
	
								<div class="rentalPropertyUpdateDialogTop"></div>
							
								<div class="rentalPropertyUpdateDialogMiddle">
								
									<p class="heading">Rental Property Update | #streetNumber# #streetName#, #city#, #state#</p>
									<p>&nbsp;</p>
									
									<p class="label">Street Number<span class="requiredNotice">(required)</span><span id="streetNumber_requiredError" class="error required">Entry required...</span></p>
									<p class="input"><input id="streetNumber" name="streetNumber" class="required input01" type="text" size="69" value="#streetNumber#"></p>
									<div class="h8"></div>
									
									<p class="label">Street Name<span class="requiredNotice">(required)</span><span id="streetName_requiredError" class="error required">Entry required...</span></p>
									<p class="input"><input id="streetName" name="streetName" class="required input01" type="text" size="69" value="#streetName#"></p>
									<div class="h8"></div>
									
									<p class="label">City<span class="requiredNotice">(required)</span><span id="city_requiredError" class="error required">Entry required...</span></p>
									<p class="input"><input id="city" name="city" class="required input01" type="text" size="69" value="#city#"></p>
									<div class="h8"></div>
									
									<p class="label">State<span class="requiredNotice">(required)</span><span id="state_requiredError" class="error required">Entry required...</span></p>
									<p class="input"><input id="state" name="state" class="required input01" type="text" size="69" value="#state#"></p>
									<div class="h8"></div>
									
									<p class="label">Zip Code</p>
									<p class="input"><input id="zipCode" name="zipCode" class="input01" type="text" size="69" value="#zipCode#"></p>
									<div class="h8"></div>
									
									<p class="label">Property Type</p>
									<p style="padding-left:20px;"><select id="propertyType" name="propertyType" class="input01">
										
											<option value="#propertyType#" selected>#propertyType#</option>
									
											<option value="House">House</option>
											<option value="Apartment">Apartment</option>
											<option value="Condo/Townhouse">Condo/Townhouse</option>
											<option value="Mobile Home">Mobile Home</option>
											
									   </select></p>
									<div class="h8"></div>
									
									<p class="label">County</p>
									<p class="input"><input id="county" name="county" class="input01" type="text" size="69" value="#county#"></p>
									<div class="h8"></div>
									
									<p class="label">Subdivision</p>
									<p class="input"><input id="subdivision" name="subdivision"class="input01" type="text" size="69" value="#subdivision#"></p>
									<div class="h8"></div>
									
									<p class="label">Total Rooms</p>
									<p class="input"><input id="totalRooms" name="totalRooms" class="input01" type="text" size="69" value="#totalRooms#"></p>
									<div class="h8"></div>
									
									<p class="label">Bedrooms
										<span class="requiredNotice">(required)</span>
										<span id="bedrooms_requiredError" class="error required">Entry required...</span>
										<span id="bedrooms_numberError" class="error number">Entry must be a number...</span>
									</p>
									<p class="input"><input id="bedrooms" name="bedrooms" class="input01" type="text" size="69" value="#bedrooms#"></p>
									<div class="h8"></div>
									
									<p class="label">Full Baths
										<span class="requiredNotice">(required)</span>
										<span id="fullBaths_requiredError" class="error required">Entry required...</span>
										<span id="fullBaths_numberError" class="error number">Entry must be a number...</span>
									</p>
									<p class="input"><input id="fullBaths" name="fullBaths" class="input01" type="text" size="69" value="#fullBaths#"></p>
									<div class="h8"></div>
									
									<p class="label">Half Baths</p>
									<p class="input"><input id="halfBaths" name="halfBaths" class="input01" type="text" size="69" value="#halfBaths#"></p>
									<div class="h8"></div>
									
									<p class="label">Monthly Rent
										<span class="requiredNotice">(required)</span>
										<span id="rent_requiredError" class="error required">Entry required...</span>
										<span id="rent_numberError" class="error number">Entry should be in this format: $950.00</span>
									</p>
									<p class="input"><input id="rent" name="rent" class="input01" type="text" size="69" value="#dollarFormat(rent)#"></p>
									<div class="h8"></div>
									
									<p class="label">Year Built</p>
									<p class="input"><input id="yearBuilt" name="yearBuilt" class="input01" type="text" size="69" value="#yearBuilt#"></p>
									<div class="h8"></div>
									
									<p class="label">Security Deposit
										<span class="requiredNotice">(required / if none, put 0)</span>
										<span id="securityDeposit_requiredError" class="error required">Entry required...</span>
										<span id="securityDeposit_numberError" class="error number">If not 0, entry should be in this format: $950.00</span>
									</p>
									<p class="input"><input id="securityDeposit" name="securityDeposit" class="input01" type="text" size="69" value="#dollarFormat(securityDeposit)#"></p>
									<div class="h8"></div>
									
									<p class="label">Lease Term</p>
									<p class="input"><input id="leaseTerm" name="leaseTerm" class="input01" type="text" size="69" value="#leaseTerm#"></p>
									<div class="h8"></div>
									
									<p class="label">Date Available</p>
									<p class="input"><input id="availabilityDate" name="availabilityDate" class="input01" type="text" size="69" value="#availabilityDate#"></p>
									<div class="h8"></div>
									
									<p class="label">
										<div style="width:100px; float:left; border:0px solid blue; margin-left:20px;">Pets Allowed</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="petsAllowed" name="petsAllowed" class="radio" type="radio" value="Yes"
														<cfif #petsAllowed# is 'Yes'>checked</cfif> >
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="petsAllowed" name="petsAllowed" class="radio" type="radio" value="No"
									   					<cfif #petsAllowed# is 'No'>checked</cfif> >
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									<p class="label">Pet Deposit<span class="requiredNotice">(if none, put 0)</span></p>
									<p class="input"><input id="petDeposit" name="petDeposit" class="input01" type="text" size="69" 
											<cfif isNumeric(petDeposit)> value="#dollarFormat(val(LSParseCurrency(petDeposit)))#"></p>
											<cfelse>                     value="#petDeposit#"</p>
											</cfif>
									<div class="h8"></div>
									
									
									<p class="label">
										<div style="width:100px; float:left; border:0px solid blue; margin-left:20px;">Living Room</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="livingRoom" name="livingRoom" class="radio" type="radio" value="Yes"
														<cfif #livingRoom# is 'Yes'>checked</cfif> >
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="livingRoom" name="livingRoom" class="radio" type="radio" value="No"
									   					<cfif #livingRoom# is 'No'>checked</cfif> >
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									
									<p class="label">
										<div style="width:100px; float:left; border:0px solid blue; margin-left:20px;">Dining Room</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="diningRoom" name="diningRoom" class="radio" type="radio" value="Yes"
														<cfif #diningRoom# is 'Yes'>checked</cfif> >
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="diningRoom" name="diningRoom" class="radio" type="radio" value="No"
									   					<cfif #diningRoom# is 'No'>checked</cfif> >
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>																		
																	
									
									<p class="label">
										<div style="width:100px; float:left; border:0px solid blue; margin-left:20px;">Family Room</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="familyRoom" name="familyRoom" class="radio" type="radio" value="Yes"
														<cfif #familyRoom# is 'Yes'>checked</cfif> >
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="familyRoom" name="familyRoom" class="radio" type="radio" value="No"
									   					<cfif #familyRoom# is 'No'>checked</cfif> >
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>	
									
									
									<p class="label">
										<div style="width:100px; float:left; border:0px solid blue; margin-left:20px;">Fire Place</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="fireplace" name="fireplace" class="radio" type="radio" value="Yes"
														<cfif #fireplace# is 'Yes'>checked</cfif> >
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="fireplace" name="fireplace" class="radio" type="radio" value="No"
									   					<cfif #fireplace# is 'No'>checked</cfif> >
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>	
									
									<p class="label">Appliances</p>
									<p class="input"><input id="appliances" name="appliances" class="input01" type="text" size="69" value="#appliances#"></p>
									<div class="h8"></div>
									
									
									<p class="label">
										<div style="width:100px; float:left; border:0px solid blue; margin-left:20px;">Water Included</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="waterIncluded" name="waterIncluded" class="radio" type="radio" value="Yes"
														<cfif #waterIncluded# is 'Yes'>checked</cfif> >
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="waterIncluded" name="waterIncluded" class="radio" type="radio" value="No"
									   					<cfif #waterIncluded# is 'No'>checked</cfif> >
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									
									<p class="label">
										<div style="width:100px; float:left; border:0px solid blue; margin-left:20px;">Fence</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="fence" name="fence" class="radio" type="radio" value="Yes"
														<cfif #fence# is 'Yes'>checked</cfif> >
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="fence" name="fence" class="radio" type="radio" value="No"
									   					<cfif #fence# is 'No'>checked</cfif> >
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									
									<p class="label">Fence Description</p>
									<div class="h8"></div>
										
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Wood Fence"
												<cfif #fenceDescription# contains "Wood Fence"> checked </cfif> >
												<span style="position:relative; top:-2px;">Wood Fence</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Chain Link Fence"
												<cfif #fenceDescription# contains "Chain Link Fence"> checked </cfif> >
												<span style="position:relative; top:-2px;">Chain Link Fence</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Wrought Iron Fence"
												<cfif #fenceDescription# contains "Wrought Iron Fence"> checked </cfif> >
												<span style="position:relative; top:-2px;">Wrought Iron Fence</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Privacy Fence"
												<cfif #fenceDescription# contains "Privacy Fence"> checked </cfif> >
												<span style="position:relative; top:-2px;">Privacy Fence</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Split Rail Fence"
												<cfif #fenceDescription# contains "Split Rail Fence"> checked </cfif> >
												<span style="position:relative; top:-2px;">Split Rail Fence</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Wire Fence"
												<cfif #fenceDescription# contains "Wire Fence"> checked </cfif> >
												<span style="position:relative; top:-2px;">Wire Fence</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Combination Fence"
												<cfif #fenceDescription# contains "Combination Fence"> checked </cfif> >
												<span style="position:relative; top:-2px;">Combination Fence</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Partial Fence"
												<cfif #fenceDescription# contains "Partial Fence"> checked </cfif> >
												<span style="position:relative; top:-2px;">Partial Fence</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Other (See Remarks)"
												<cfif #fenceDescription# contains "Other"> checked </cfif> >
												<span style="position:relative; top:-2px;">Other</span></p>
												
									<p>&nbsp;</p>
												
												
									<p class="label">Car Storage</p>
									<div class="h8"></div>
										
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="One Car"
												<cfif #carStorage# contains "One Car"> checked </cfif> >
												<span style="position:relative; top:-2px;">One Car</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Two Cars"
												<cfif #carStorage# contains "Two Cars"> checked </cfif> >
												<span style="position:relative; top:-2px;">Two Cars</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Three Cars"
												<cfif #carStorage# contains "Three Cars"> checked </cfif> >
												<span style="position:relative; top:-2px;">Three Cars</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Attached"
												<cfif #carStorage# contains "Attached"> checked </cfif> >
												<span style="position:relative; top:-2px;">Attached</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Detached"
												<cfif #carStorage# contains "Detached"> checked </cfif> >
												<span style="position:relative; top:-2px;">Detached</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Garage"
												<cfif #carStorage# contains "Garage"> checked </cfif> >
												<span style="position:relative; top:-2px;">Garage</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Carport"
												<cfif #carStorage# contains "Carport"> checked </cfif> >
												<span style="position:relative; top:-2px;">Carport</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Parking Spaces"
												<cfif #carStorage# contains "Parking Spaces"> checked </cfif> >
												<span style="position:relative; top:-2px;">Parking Spaces</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Street Parking"
												<cfif #carStorage# contains "Street Parking"> checked </cfif> >
												<span style="position:relative; top:-2px;">Street Parking</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Converted Garage"
												<cfif #carStorage# contains "Converted Garage"> checked </cfif> >
												<span style="position:relative; top:-2px;">Converted Garage</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="RV Storage"
												<cfif #carStorage# contains "RV Storage"> checked </cfif> >
												<span style="position:relative; top:-2px;">RV Storage</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="None"
												<cfif #carStorage# contains "None"> checked </cfif> >
												<span style="position:relative; top:-2px;">None</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Other-See Remarks"
												<cfif #carStorage# contains "Other-See Remarks"> checked </cfif> >
												<span style="position:relative; top:-2px;">Other-See Remarks</span></p>
									<div class="h8"></div>
												
												
									<p class="label">Utilities</p>
									<p style="padding-left:20px;">
										<select id="utilities" name="utilities" class="input01">
											<option value="#utilities#" selected>#utilities#</option>
											<option value="Electric & Gas">Electric & Gas</option>
											<option value="Electric Only">Electric Only</option>
											
									   </select></p>
									<div class="h8"></div>
									
									<p class="label">
										<div style="width:150px; float:left; border:0px solid blue; margin-left:20px;">Alarm System</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="alarmSystem" name="alarmSystem" class="radio" type="radio" value="Yes"
														<cfif #alarmSystem# is 'Yes'>checked</cfif> >
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="alarmSystem" name="alarmSystem" class="radio" type="radio" value="No"
									   					<cfif #alarmSystem# is 'No'>checked</cfif> >
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									<p class="label">
										<div style="width:150px; float:left; border:0px solid blue; margin-left:20px;">Washer / Dryer Included</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="washerDryerIncluded" name="washerDryerIncluded" class="radio" type="radio" value="Yes"
														<cfif #washerDryerIncluded# is 'Yes'>checked</cfif> >
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="washerDryerIncluded" name="washerDryerIncluded" class="radio" type="radio" value="No"
									   					<cfif #washerDryerIncluded# is 'No'>checked</cfif> >
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									<p class="label">
										<div style="width:150px; float:left; border:0px solid blue; margin-left:20px;">Washer / Dryer Hookups</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="washerDryerHookups" name="washerDryerHookups" class="radio" type="radio" value="Yes"
														<cfif #washerDryerHookups# is 'Yes'>checked</cfif> >
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="washerDryerHookups" name="washerDryerHookups" class="radio" type="radio" value="No"
									   					<cfif #washerDryerHookups# is 'No'>checked</cfif> >
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									<p class="label">
										<div style="width:150px; float:left; border:0px solid blue; margin-left:20px;">Storage</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="storage" name="storage" class="radio" type="radio" value="Yes"
														<cfif #storage# is 'Yes'>checked</cfif> >
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="storage" name="storage" class="radio" type="radio" value="No"
									   					<cfif #storage# is 'No'>checked</cfif> >
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									<p class="label">Other</p>
									<p class="input"><input id="other" name="other" class="input01" type="text" size="69" value="#other#"></p>
									<div class="h8"></div>
									
									<p class="label">
										<div style="width:150px; float:left; border:0px solid blue; margin-left:20px;">Available For Rent</div>
										<div style="width:250px; float:left;border:0px solid green;">
													<input id="availableForRent" name="availableForRent" class="radio" type="radio" value="Yes"
														<cfif #availableForRent# is 'Yes'>checked</cfif> >
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="availableForRent" name="availableForRent" class="radio" type="radio" value="No"
									   					<cfif #availableForRent# is 'No'>checked</cfif> >
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									<!--- <p class="label">
										<div style="width:150px; float:left; border:0px solid blue; margin-left:20px;">Property Status</div>
										<div style="width:250px; float:left;border:0px solid green;">
													<input id="softDelete" name="softDelete" class="radio" type="radio" value="Yes"
														<cfif #softDelete# is 'Yes'>checked</cfif> >
															<span style="position:relative; top:-1px;">Online</span> &nbsp;
									   				 <input id="softDelete" name="softDelete" class="radio" type="radio" value="No"
									   					<cfif #softDelete# is 'No'>checked</cfif> >
															<span style="position:relative; top:-1px;">Soft Delete</span> 
										</div>
									<div class="h8" style="clear:both;"></div> --->
									
									<p class="label">Remarks</p>
									<p class="input"><textarea id="remarks" name="remarks" wrap="physical" rows="8" cols="67" class="input01">#remarks#</textarea></p>
									<p>&nbsp;</p>
									<p>&nbsp;</p>
									<p>&nbsp;</p>
									
								</cfoutput>
								
								
								<!--- [ property photos ] ----------------------------------------------------------------------- --->								
									
									<cfquery	name = "qGetPropertyPhotos"		datasource = "holtzmanrentals">
									
										select		photoID, propertyID, photo75x50
										from			rentalPhotos
										where			propertyId	=	'#arguments.propertyID#'
										order by		photoOrder
										
									</cfquery>
									
									<cfif qGetPropertyPhotos.recordCount gt 0>													
									
										<p style="font-size:13px; font-weight:bold; text-decoration:underline; margin-left:20px;">Property Photos</p>
									
											<ul style="width:420px; font-size:12px; list-style-type:disc;">
												<li>Follow the instructions beside each photo to delete a photo.</li>
												<li>You may also left click, hold, and drag a photo to a new location in the order of photos
													to change the display order of the photo on the website.</li>
												<li>To add photos for this property, click the Browse button on the fields at the bottom of this dialog
													to locate your photos</li>
											</ul>
											
									<cfelse>
									
										<p style="font-size:13px; font-weight:bold; text-decoration:underline; margin-left:20px;">Property Photos</p>
									
											<ul style="width:420px; font-size:12px; list-style-type:disc;">
												<li>There are no photos currently assigned to this property.</li>
												<li>To add photos for this property, click the Browse button on the fields below
													to locate your photos</li>
											</ul>
											
									</cfif>
										
										<p>&nbsp;</p>
									

									
									<table id="propertyPhotosTable" cellpadding="0" cellspacing="0">
										
										<!---<cfloop from = '1' to ='#qGetPropertyPhotos.recordCount#' index = 'i'>--->
											
										<cfoutput query="qGetPropertyPhotos">
									
											<!---<cfoutput>--->
											
												<tr id="#photoID#">
													
													<td>
	
													<!--- <p class="label" style="border:1px solid red;">Property Photo #i#</p>
													<div class="h8"></div> --->
													<div class="propertyPhoto"><img src="http://www.holtzmanrealestate.com/user_images/#photo75x50#"></div>
											
													<div class="propertyPhotoInstructions">
														
														<ul style="margin:0px; padding:0 0 0 10px; list-style-position:outside;">
															<li><a id="#photoID#" class="deletePhoto" href="" onclick="return false;">Click here</a> to delete this photo.</li>
														</ul>
													
													</div>
													
													<div style="clear:both; height:30px;"></div>
													
													</td>													
												
												</tr>
												
										</cfoutput>
											
										<!---</cfloop>--->
											
										
									</table>
									
									
			



















									
<!--- [ Photo sorting code ] ------------------------------------------------------------------------ --->
							
<!--- [ 000 - fn to create newOrder variable holding list of id's ] ---------------------------------------------- --->

	<script type="text/javascript">
	
		
		
		$(document).ready(function() {
			
			var newOrder = '';			
			
			$('#propertyPhotosTable tr').each(function(i,o) {
				
				if		( newOrder.length			)
						{ newOrder += ',' + o.id;	}
				
				else	{ newOrder = o.id			}
			});
			
			$('photosIDs').val(newOrder);
			
			//console.log('newOrder = ' + newOrder);
			
<!--- [ 000 - upon Drop of table row, create and save newOrder of ids, run output table fn ] -------------------- --->
			
			$('#propertyPhotosTable').tableDnD ({
				
				onDrop: function(table, row) {
					
							var newOrder = '';
					
							$('#propertyPhotosTable tr').each(function(i,o) {
						
								if		( newOrder.length			)
										{ newOrder += ',' + o.id;	}
								
								else	{ newOrder = o.id;			}
								
							});
					
					var datavalues	=	{	dsn:		'<cfoutput>#application.dsn#</cfoutput>',
											newOrder:	newOrder									};					
					
					//console.log(datavalues);
				
					$.ajax	({	cache:		false,
								url:		'rentalProperties.cfc?method=mUpdateRentalPhotosOrder&returnFormat=json',
								type:		"post",
								dataType:	"json",
								data:		datavalues
								
					});
					
				}
				
			});
			
		});

			
	</script>
																	




















			
							<!--- [ File Upload Section ] ----------------------------------------------------------------------- --->
							
								<script type="text/javascript">
								
									$(document).ready(function() {
										
										$('#add-file-upload-update').attr('href', 'javascript:void(0)').click(function(objEvent) {
											
											addNewUpload();
											objEvent.preventDefault();
											return(false);
											
										});
									});
									
								</script>
								
								<script type="text/javascript">
								
									function addNewUpload() {
										
										var newUploadField = $('#element-update-templates div.row').clone();
										var	newUploadFieldHTML = newUploadField.html();
										
										var newUploadFieldCount = $('#files').find('div.row').length + 1;
										 	newUploadField.attr( 'id', ('file' + newUploadFieldCount) );
										 	
											newUploadFieldHTML = newUploadFieldHTML
												.replace(	new RegExp('::FIELD2::', 'i'), newUploadFieldCount 		)
												.replace(	new RegExp('::FIELD3::', 'i'), (newUploadFieldCount + '_propertyPhoto')	);
												
											newUploadField.html(newUploadFieldHTML);
											
											$('#files').append(newUploadField);
											
									}
									
								</script>
																				
									
								<div  style="padding-left:20px;" id="files">
								
									<div id="file1" class="row">
										<p>Add Property Image</p>
										<input type="file" name="1_propertyPhoto" size="57" value="">
										<div class="h8"></div>
									</div>
									
								</div>
								
								<p style="padding-left:20px;"><a id="add-file-upload-update">Add New Image Field</a></p>
								
								<!--- DOM templates. --->
								<div id="element-update-templates" style="display: none ;">
 
									<div id="::FIELD1::" class="row">
										<p>Property Image ::FIELD2::</p>
										<input type="file" name="::FIELD3::" size="57" value="">
										<div class="h8"></div>
									</div>
 
								</div>									
									
							<!--- [ / File Upload Section ] --------------------------------------------------------------------- --->	






















									<p>&nbsp;</p>

									
									<p class="input">
										<input id="updateButton" type="submit" value="submit"> &nbsp;
										<input id="cancelUpdateButton" class="cancelUpdate" type="button" value="cancel">
										<span class="validationError">Please check the form for entry error messages...</span>
										<span id="updatingImg"><img src="../../site_images/ajax-loader.gif"></span>
										<span id="updatingText">Updating record...</span>
										<span id="updateError">Update failed...please try again.</span></p>
									<div class="h8"></div>
									
									<input id="propertyID" name="propertyID" value="<cfoutput>#qGetRentalProperty.propertyID#</cfoutput>" type="hidden">
											
								</div>
							
								<div style="clear:both;"></div>
							
								<div class="rentalPropertyUpdateDialogBottom"></div>
	
							</div>
							
							</form>
			
							
						</cfsavecontent>
						
						<cffile 	action			=	"write"
									nameconflict	=	"overwrite"
									file				=	"#expandPath('rentalPropertyUpdateHTML.cfm')#"
									output			=	"#rentalPropertyUpdateHTML#">													
						
						<cfset propertyStruct.STATUS 	=	'Success'>
					
					</cfif>
						
					<cfreturn propertyStruct />

						
	</cffunction>
	
	




















	
	
<!--- [ 000 - CFFunction - ajax update rental photos order ] -------------------------------------------------------------------- --->

	<cffunction		name				=	"mUpdateRentalPhotosOrder"
						displayname		=	"mUpdateRentalPhotosOrder"
						hint				=	"Updates rental photo order display on website"
						output			=	"false"
						access			=	"remote"
						returnType		=	"struct">
					
			<cfargument	name="dsn"			type="string"	required="yes">
			<cfargument name="newOrder"	type="string"	required="yes">
			
			<cfset rentalPhotosOrderStruct 		=	structNew()>
			
			<cfset counter = 1>
			
			<cfloop list="#arguments.newOrder#" index="i">
			
				<cfquery name="qUpdateRentalPhotosOrder"	datasource="#arguments.dsn#">
				
					update		rentalPhotos
					set			photoOrder = '#counter#'
					where			photoID = '#i#'
					
				</cfquery>
				
				<cfset counter = counter + 1>
				
			</cfloop>
			
			<cfquery name="qGetNewRentalPhotosOrder"	datasource="#arguments.dsn#">
			
					select		photoOrder
					from			rentalPhotos
					order by		photoOrder
					
			</cfquery>
			
			<cfset	rentalPhotosOrderStruct.MESSAGE							=	"Success"	/>
			<cfset	rentalPhotosOrderStruct.QGETNEWRENTALPHOTOSORDER	=	"#qGetNewRentalPhotosOrder#"	/>
			
			<cfreturn rentalPhotosOrderStruct	/>
			
	</cffunction>	
	
	




















	
	
<!--- [ mCreateRentalPropertyAddDialog ] ---------------------------------------------------------------------------------------- --->

	<cffunction		name				=	"mCreateRentalPropertyAddDialog"
						displayName		=	"mCreateRentalPropertyAddDialog"
						hint				=	"Creates HTML code for rental property add dialog and saves via cfsavecontent to file"
						output			=	"false"
						returnType		=	"struct"
						access			=	"remote"	>
					
					<cfset addDialogStruct = structNew() >
					
						<!--- [ rentalPropertyAddDialog ] ----------------------------------------------------------------------- --->
						
						<cfsavecontent variable="rentalPropertyAddDialogHTML">
							
							<script type="text/javascript">
							
								$(document).ready(function() {
			
										$('.error').hide();
										$('#addingImg').hide();
										$('#addingText').hide();
										$('#addError').hide();
										$('.validationError').hide();

								});
								
							</script>

							<div class="rentalPropertyAddWindowOverlay"></div>
							
							<form id="addNewRentalPropertyForm" method="post">
	
							<div class="rentalPropertyAddDialog"> <!--- [ closed ] --->
	
								<div class="rentalPropertyAddDialogTop"></div>
							
								<div class="rentalPropertyAddDialogMiddle"> <!--- [ closed ] --->
								
									<p class="heading">Add New Rental Property</p>
									<p>&nbsp;</p>

									<p class="label">Street Number<span class="requiredNotice">(required)</span><span id="streetNumber_requiredError" class="error required">Entry required...</span></p>
									<p class="input"><input id="streetNumber" name="streetNumber" class="required input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									<p class="label">Street Name<span class="requiredNotice">(required)</span><span id="streetName_requiredError" class="error required">Entry required...</span></p>
									<p class="input"><input id="streetName" name="streetName" class="required input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									<p class="label">City<span class="requiredNotice">(required)</span><span id="city_requiredError" class="error required">Entry required...</span></p>
									<p class="input"><input id="city" name="city" class="required input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									<p class="label">State<span class="requiredNotice">(required)</span><span id="state_requiredError" class="error required">Entry required...</span></p>
									<p class="input"><input id="state" name="state" class="required input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									<p class="label">Zip Code</p>
									<p class="input"><input id="zipCode" name="zipCode" class="input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									<p class="label">Property Type</p>
									<p style="padding-left:20px;">
										<select id="propertyType" name="propertyType" class="input01">

											<option value="House">House</option>
											<option value="Apartment">Apartment</option>
											<option value="Condo/Townhouse">Condo/Townhouse</option>
											<option value="Mobile Home">Mobile Home</option>
											
									   </select></p>
									<div class="h8"></div>
									
									<p class="label">County</p>
									<p class="input"><input id="county" name="county"class="input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									<p class="label">Subdivision</p>
									<p class="input"><input id="subdivision" name="subdivision" class="input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									<p class="label">Total Rooms</p>
									<p class="input"><input id="totalRooms" name="totalRooms" class="input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									<p class="label">Bedrooms
										<span class="requiredNotice">(required)</span>
										<span id="bedrooms_requiredError" class="error required">Entry required...</span>
										<span id="bedrooms_numberError" class="error number">Entry must be a number...</span>
									</p>
									<p class="input"><input id="bedrooms" name="bedrooms" class="input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									<p class="label">Full Baths
										<span class="requiredNotice">(required)</span>
										<span id="fullBaths_requiredError" class="error required">Entry required...</span>
										<span id="fullBaths_numberError" class="error number">Entry must be a number...</span>
									</p>
									<p class="input"><input id="fullBaths" name="fullBaths" class="input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									<p class="label">Half Baths</p>
									<p class="input"><input id="halfBaths" name="halfBaths" class="input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									<p class="label">Monthly Rent
										<span class="requiredNotice">(required)</span>
										<span id="rent_requiredError" class="error required">Entry required...</span>
										<span id="rent_numberError" class="error number">Entry should be in this format: $950.00</span>
									</p>
									<p class="input"><input id="rent" name="rent" class="input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									<p class="label">Year Built</p>
									<p class="input"><input id="yearBuilt" name="yearBuilt" class="input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									<p class="label">Security Deposit
										<span class="requiredNotice">(required / if none, put 0)</span>
										<span id="securityDeposit_requiredError" class="error required">Entry required...</span>
										<span id="securityDeposit_numberError" class="error number">If not 0, entry should be in this format: $950.00</span>
									</p>
									<p class="input"><input id="securityDeposit" name="securityDeposit" class="input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									<p class="label">Lease Term</p>
									<p class="input"><input id="leaseTerm" name="leaseTerm" class="input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									<p class="label">Date Available</p>
									<p class="input"><input id="availabilityDate" name="availabilityDate" class="input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									<p class="label">
										<div style="width:100px; float:left; border:0px solid blue; margin-left:20px;">Pets Allowed</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="petsAllowed" name="petsAllowed" class="radio" type="radio" value="Yes">
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="petsAllowed" name="petsAllowed" class="radio" type="radio" value="No" checked>
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									<p class="label">Pet Deposit</p>
									<p class="input"><input id="petDeposit" name="petDeposit" class="input01" type="text" size="69" value="0"></p>
									<div class="h8"></div>
									
									
									<p class="label">
										<div style="width:100px; float:left; border:0px solid blue; margin-left:20px;">Living Room</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="livingRoom" name="livingRoom" class="radio" type="radio" value="Yes">
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="livingRoom" name="livingRoom" class="radio" type="radio" value="No" checked>
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									
									<p class="label">
										<div style="width:100px; float:left; border:0px solid blue; margin-left:20px;">Dining Room</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="diningRoom" name="diningRoom" class="radio" type="radio" value="Yes">
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				<input id="diningRoom" name="diningRoom" class="radio" type="radio" value="No" checked>
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>																		
																	
									
									<p class="label">
										<div style="width:100px; float:left; border:0px solid blue; margin-left:20px;">Family Room</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="familyRoom" name="familyRoom" class="radio" type="radio" value="Yes">
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="familyRoom" name="familyRoom" class="radio" type="radio" value="No" checked>
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>	
									
									
									<p class="label">
										<div style="width:100px; float:left; border:0px solid blue; margin-left:20px;">Fire Place</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="fireplace" name="fireplace" class="radio" type="radio" value="Yes">
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="fireplace" name="fireplace" class="radio" type="radio" value="No" checked>
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>	
									
									<p class="label">Appliances</p>
									<p class="input"><input id="appliances" name="appliances" class="input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									
									<p class="label">
										<div style="width:100px; float:left; border:0px solid blue; margin-left:20px;">Water Included</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="waterIncluded" name="waterIncluded" class="radio" type="radio" value="Yes">
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="waterIncluded" name="waterIncluded" class="radio" type="radio" value="No" checked>
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									
									<p class="label">
										<div style="width:100px; float:left; border:0px solid blue; margin-left:20px;">Fence</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="fence" name="fence" class="radio" type="radio" value="Yes">
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="fence" name="fence" class="radio" type="radio" value="No" checked>
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									
									<p class="label">Fence Description</p>
									<div class="h8"></div>
										
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Wood Fence">
												<span style="position:relative; top:-2px;">Wood Fence</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Chain Link Fence">
												<span style="position:relative; top:-2px;">Chain Link Fence</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Wrought Iron Fence">
												<span style="position:relative; top:-2px;">Wrought Iron Fence</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Privacy Fence">
												<span style="position:relative; top:-2px;">Privacy Fence</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Split Rail Fence">
												<span style="position:relative; top:-2px;">Split Rail Fence</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Wire Fence">
												<span style="position:relative; top:-2px;">Wire Fence</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Combination Fence">
												<span style="position:relative; top:-2px;">Combination Fence</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Partial Fence">
												<span style="position:relative; top:-2px;">Partial Fence</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="fenceDescription" name="fenceDescription" type="checkbox" value="Other (See Remarks)">
												<span style="position:relative; top:-2px;">Other</span></p>
												
									<p>&nbsp;</p>
												
												
									<p class="label">Car Storage</p>
									<div class="h8"></div>
										
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="One Car">
												<span style="position:relative; top:-2px;">One Car</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Two Cars">
												<span style="position:relative; top:-2px;">Two Cars</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Three Cars">
												<span style="position:relative; top:-2px;">Three Cars</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Attached">
												<span style="position:relative; top:-2px;">Attached</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Detached">
												<span style="position:relative; top:-2px;">Detached</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Garage">
												<span style="position:relative; top:-2px;">Garage</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Carport">
												<span style="position:relative; top:-2px;">Carport</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Parking Spaces">
												<span style="position:relative; top:-2px;">Parking Spaces</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Street Parking">
												<span style="position:relative; top:-2px;">Street Parking</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Converted Garage">
												<span style="position:relative; top:-2px;">Converted Garage</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="RV Storage">
												<span style="position:relative; top:-2px;">RV Storage</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="None">
												<span style="position:relative; top:-2px;">None</span></p>
												
									<p class="input" style="margin-left:20px;"><input id="carStorage" name="carStorage" type="checkbox" value="Other-See Remarks">
												<span style="position:relative; top:-2px;">Other-See Remarks</span></p>
									<div class="h8"></div>
												
												
									<p class="label">Utilities</p>
									<p style="padding-left:20px;">
										<select id="utilities" name="utilities" class="input01">
											<option value="Electric &amp; Gas">Electric &amp; Gas</option>
											<option value="Electric Only">Electric Only</option>
											
									   </select></p>
									<div class="h8"></div>
									
									<p class="label">
										<div style="width:150px; float:left; border:0px solid blue; margin-left:20px;">Alarm System</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="alarmSystem" name="alarmSystem" class="radio" type="radio" value="Yes">
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="alarmSystem" name="alarmSystem" class="radio" type="radio" value="No" checked>
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									<p class="label">
										<div style="width:150px; float:left; border:0px solid blue; margin-left:20px;">Washer / Dryer Included</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="washerDryerIncluded" name="washerDryerIncluded" class="radio" type="radio" value="Yes">
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="washerDryerIncluded" name="washerDryerIncluded" class="radio" type="radio" value="No" checked>
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									<p class="label">
										<div style="width:150px; float:left; border:0px solid blue; margin-left:20px;">Washer / Dryer Hookups</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="washerDryerHookups" name="washerDryerHookups" class="radio" type="radio" value="Yes">
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="washerDryerHookups" name="washerDryerHookups" class="radio" type="radio" value="No" checked>
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									<p class="label">
										<div style="width:150px; float:left; border:0px solid blue; margin-left:20px;">Storage</div>
										<div style="width:100px; float:left;border:0px solid green;">
													<input id="storage" name="storage" class="radio" type="radio" value="Yes">
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="storage" name="storage" class="radio" type="radio" value="No" checked>
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									<p class="label">Other</p>
									<p class="input"><input id="other" name="other" class="input01" type="text" size="69" value=""></p>
									<div class="h8"></div>
									
									<p class="label">
										<div style="width:150px; float:left; border:0px solid blue; margin-left:20px;">Available For Rent</div>
										<div style="width:250px; float:left;border:0px solid green;">
													<input id="availableForRent" name="availableForRent" class="radio" type="radio" value="Yes">
															<span style="position:relative; top:-1px;">Yes</span> &nbsp;
									   				 <input id="availableForRent" name="availableForRent" class="radio" type="radio" value="No" checked>
															<span style="position:relative; top:-1px;">No</span> 
										</div>
									<div class="h8" style="clear:both;"></div>
									
									
									<p class="label">Remarks</p>
									<p class="input"><textarea id="remarks" name="remarks" wrap="physical" rows="8" cols="68" class="input01"></textarea></p>
									<p>&nbsp;</p>










									
							<!--- [ File Upload Section ] ----------------------------------------------------------------------- --->
							
								<script type="text/javascript">
								
									$(document).ready(function() {
										
										$('#add-file-upload').attr('href', 'javascript:void(0)').click(function(objEvent) {
											
											addNewUpload();
											objEvent.preventDefault();
											return(false);
											
										});
									});
									
								</script>
								
								<script type="text/javascript">
								
									function addNewUpload() {
										
										var	newUploadField = $('#element-templates div.row').clone();
										var	newUploadFieldHTML = newUploadField.html();
										
										var	newUploadFieldCount = $('#files').find('div.row').length + 1;
										 		newUploadField.attr( 'id', ('file' + newUploadFieldCount) );
										 	
												newUploadFieldHTML = newUploadFieldHTML
													.replace(	new RegExp('::FIELD2::', 'i'), newUploadFieldCount 		)
													.replace(	new RegExp('::FIELD3::', 'i'), (newUploadFieldCount + '_propertyPhoto')	);
												
												newUploadField.html(newUploadFieldHTML);
											
												$('#files').append(newUploadField);
											
									}
									
								</script>
																				
									
								<div  style="padding-left:20px;" id="files">
								
									<div id="file1" class="row">
										<p>Property Image 1 (main image)</p>
										<input type="file" name="1_propertyPhoto" size="57" value="">
										<div class="h8"></div>
									</div>
									
								</div>
								
								<p style="padding-left:20px;"><a id="add-file-upload">Add New Image Field</a></p>
								
								<!--- DOM templates. --->
								<div id="element-templates" style="display: none ;">
 
									<div id="::FIELD1::" class="row">
										<p>Property Image ::FIELD2::</p>
										<input type="file" name="::FIELD3::" size="57" value="">
										<div class="h8"></div>
									</div>
 
								</div>									
									
							<!--- [ / File Upload Section ] --------------------------------------------------------------------- --->		
									










															
									<p>&nbsp;</p>
									
									<p class="input">
										<input id="addButton" type="submit" value="submit"> &nbsp;
										<input id="cancelAddButton" class="cancelAdd" type="button" value="cancel">
										<span class="validationError">Please check the form for entry error messages...</span>
										<span id="addingImg"><img src="../../site_images/ajax-loader.gif"></span>
										<span id="addingText">Adding record...</span>
										<span id="addError">Add failed...please try again.</span></p>
									<div class="h8"></div>
											
								</div> <!--- [ .rentalPropertyAddDialogMiddle ] --->
								
								<div style="clear:both;"></div>
							
								<div class="rentalPropertyAddDialogBottom"></div>
	
							</div> <!--- [ .rentalPropertyAddDialog ] --->
							
						</form>
						
			
							
					</cfsavecontent>
					
					<cffile 	action			=	"write"
								nameconflict	=	"overwrite"
								file				=	"#expandPath('rentalPropertyAddDialogHTML.cfm')#"
								output			=	"#rentalPropertyAddDialogHTML#">
								
					<cfset	addDialogStruct.STATUS = 'Success'>
					
					<cfreturn addDialogStruct	/>
					
	</cffunction>						
	
























<!--- [ mAddRentalPropertyPhoto ] ----------------------------------------------------------------------------------------------- --->

		<cffunction		name				=	"mAddRentalPropertyPhoto"
							displayname		=	"mAddRentalPropertyPhoto"
							hint				=	"Adds Single Rental Property Image"
							output			=	"false"
							returnType		=	"struct"
							access			=	"remote">

							<cfargument 	name 				= "upload_image" 	type = "string" 	required = "yes" 	/>

							<cfset 			property_photo_struct = structNew() />

							<cffile			action			=	"upload"
												destination		=	"e:\inetpub\webroot\dmrentals\upload-directory"
												accept			=	"image/jpg, image/pjgp, image/jpeg, image/pjpeg, image/png"
												nameConflict	=	"makeUnique" />

							<cfset 			property_photo_struct.PROPERTYPHOTOFILENAME	=	cffile.serverfile />

							<cfreturn 		property_photo_struct />

		</cffunction>						








	
<!--- [ mAddRentalProperty ] ---------------------------------------------------------------------------------------------------- --->

						
	<cfsetting requesttimeout="60000">

	<cffunction		name				=	"mAddRentalProperty"
						displayname		=	"mAddRentalProperty"
						hint				=	"Adds Rental Property Info and Images"
						output			=	"false"
						returnType		=	"struct"
						access			=	"remote">
					
						<!--- <cfargument 	name = "dsn"				type = "string"		required = "yes"> --->
						<cfargument		name = "streetNumber"			type = "string"		required = "yes">
						<cfargument 	name = "streetName"				type = "string"		required = "yes">
						<cfargument		name = "city"						type = "string"		required = "yes">
						<cfargument		name = "state"						type = "string"		required = "yes">
						<cfargument 	name = "zipCode"					type = "string"		required = "no">
					
						<cfargument		name = "propertyType"			type = "string"		required = "no">
						<cfargument		name = "county"					type = "string"		required = "no">
						<cfargument 	name = "subdivision"				type = "string"		required = "no">
						<cfargument		name = "totalRooms"				type = "string"		required = "no">
						<cfargument		name = "bedrooms"					type = "string"		required = "yes">
						<cfargument		name = "fullBaths"				type = "string"		required = "yes">
						<cfargument 	name = "halfBaths"				type = "string"		required = "no">
					
						<cfargument		name = "rent"						type = "string"		required = "yes">
						<cfargument		name = "yearBuilt"				type = "string"		required = "no">
						<cfargument 	name = "securityDeposit"		type = "string"		required = "yes">
						<cfargument		name = "leaseTerm"				type = "string"		required = "no">
						<cfargument		name = "availabilityDate"		type = "string"		required = "no">
						<cfargument		name = "petsAllowed"				type = "string"		required = "no">
						<cfargument 	name = "petDeposit"				type = "string"		required = "no">
					
						<cfargument		name = "livingRoom"				type = "string"		required = "no">
						<cfargument		name = "diningRoom"				type = "string"		required = "no">
						<cfargument 	name = "familyRoom"				type = "string"		required = "no">
						<cfargument		name = "fireplace"				type = "string"		required = "no">
						<cfargument		name = "appliances"				type = "string"		required = "no">
						<cfargument		name = "waterIncluded"			type = "string"		required = "no">
					
						<cfargument 	name = "fence"						type = "string"		required = "no">
						<cfargument		name = "fenceDescription"		type = "string"		required = "no" 	default="">
						<cfargument		name = "carStorage"				type = "string"		required = "no"	default="">
						<cfargument 	name = "utilities"				type = "string"		required = "no">
						<cfargument		name = "alarmSystem"				type = "string"		required = "no">
						<cfargument		name = "washerDryerIncluded"	type = "string"		required = "no">
						<cfargument		name = "washerDryerHookups"	type = "string"		required = "no">
					
						<cfargument 	name = "storage"					type = "string"		required = "no">
						<cfargument		name = "other"						type = "string"		required = "no">
						<cfargument		name = "availableForRent"		type = "string"		required = "no">
						<!--- <cfargument 	name = "softDelete"				type = "string"		required = "no"> --->
						<cfargument		name = "remarks"					type = "string"		required = "no">
					

					
					<cfset	addPropertyStruct = structNew() >
					
					<cfquery name="qAddRentalProperty" datasource="holtzmanrentals">
					
						insert into		rentalProperties
						
											( 	streetNumber, streetName, city, state, zipCode, propertyType, county, subdivision,
										  		totalRooms, bedrooms, fullBaths, halfBaths, rent, yearBuilt, securityDeposit, leaseTerm,
										  		availabilityDate, petsAllowed, petDeposit, livingRoom, diningRoom, familyRoom, fireplace,
										  		appliances, waterIncluded, fence, fenceDescription, carStorage, utilities, alarmSystem,
										  		washerDryerIncluded, washerDryerHookups, storage, other, availableForRent, remarks )							
										  
						values			( 	<cfqueryparam		cfsqltype="cf_sql_varchar"		value="#arguments.streetNumber#">,
										  		<cfqueryparam 		cfsqltype="cf_sql_varchar" 	value="#arguments.streetName#">,
										  		<cfqueryparam 		cfsqltype="cf_sql_varchar" 	value="#arguments.city#">,
										  		<cfqueryparam 		cfsqltype="cf_sql_varchar" 	value="#arguments.state#">,
										  		<cfqueryparam 		cfsqltype="cf_sql_varchar" 	value="#arguments.zipCode#">,
										  		<cfqueryparam 		cfsqltype="cf_sql_varchar" 	value="#arguments.propertyType#">,
										  		<cfqueryparam 		cfsqltype="cf_sql_varchar" 	value="#arguments.county#">,
										  		<cfqueryparam 		cfsqltype="cf_sql_varchar" 	value="#arguments.subdivision#">,
										  		<cfqueryparam 		cfsqltype="cf_sql_char"			value="#arguments.totalRooms#">,
										  		<cfqueryparam 		cfsqltype="cf_sql_tinyint"		value="#arguments.bedrooms#">,
										  		<cfqueryparam		cfsqltype="cf_sql_tinyint"		value="#arguments.fullBaths#">,
										  		<cfqueryparam		cfsqltype="cf_sql_char"			value="#arguments.halfBaths#">,
										  		<cfqueryparam		cfsqltype="cf_sql_smallint"	value="#val(LSParseCurrency(arguments.rent))#">,
										  		<cfqueryparam		cfsqltype="cf_sql_varchar"		value="#arguments.yearBuilt#">,
										  		<cfqueryparam		cfsqltype="cf_sql_smallint"	value="#val(LSParseCurrency(arguments.securityDeposit))#">,
										  		<cfqueryparam		cfsqltype="cf_sql_varchar"		value="#arguments.leaseTerm#">,
										  		<cfqueryparam		cfsqltype="cf_sql_varchar"		value="#arguments.availabilityDate#">,
										  		<cfqueryparam		cfsqltype="cf_sql_char"			value="#arguments.petsAllowed#">,
										 		<cfqueryparam		cfsqltype="cf_sql_char"			value="#arguments.petDeposit#">,
										  		<cfqueryparam		cfsqltype="cf_sql_char"			value="#arguments.livingRoom#">,
										  		<cfqueryparam		cfsqltype="cf_sql_char"			value="#arguments.diningRoom#">,
										  		<cfqueryparam		cfsqltype="cf_sql_char"			value="#arguments.familyRoom#">,
										  		<cfqueryparam 		cfsqltype="cf_sql_char"			value="#arguments.fireplace#">,
										  		<cfqueryparam		cfsqltype="cf_sql_varchar"		value="#arguments.appliances#">,
										  		<cfqueryparam		cfsqltype="cf_sql_char"			value="#arguments.waterIncluded#">,
										  		<cfqueryparam		cfsqltype="cf_sql_char"			value="#arguments.fence#">,
										 		<cfqueryparam		cfsqltype="cf_sql_varchar"		value="#arguments.fenceDescription#">,
										 		<cfqueryparam		cfsqltype="cf_sql_varchar"		value="#arguments.carStorage#">,
										  		<cfqueryparam		cfsqltype="cf_sql_varchar"		value="#arguments.utilities#">,
										  		<cfqueryparam		cfsqltype="cf_sql_char"			value="#arguments.alarmSystem#">,
										  		<cfqueryparam		cfsqltype="cf_sql_char"			value="#arguments.washerDryerIncluded#">,
										  		<cfqueryparam		cfsqltype="cf_sql_char"			value="#arguments.washerDryerHookups#">,
										  		<cfqueryparam 		cfsqltype="cf_sql_char"			value="#arguments.storage#">,
										  		<cfqueryparam		cfsqltype="cf_sql_varchar"		value="#arguments.other#">,
										  		<cfqueryparam		cfsqltype="cf_sql_char"			value="#arguments.availableForRent#">,
										  		<cfqueryparam		cfsqltype="cf_sql_varchar" 	value="#arguments.remarks#"> )
										  
					</cfquery>
					
					
					<cfquery		name="qGetLastInsertID"		datasource="holtzmanrentals">
					
						select		LAST_INSERT_ID() as propertyID
						from			rentalProperties
						
					</cfquery>	
					
					<cfset userImages 			= 	expandPath('../user_images/')>
					<cfset userImagesDirectory	=	getDirectoryFromPath(userImages)>
					
					<cfset loopCounter = 0 />
					<cfset rowNumber = 1 /> <!--- [ new ] --->

					<cfloop index="imageNumber" from="1" to="100" step="1">
 
						<cfset imageFileField = '#imageNumber#_propertyPhoto' />
 
						<cfif (structKeyExists(form, imageFileField) and len(form[imageFileField]))>

							<cffile	action			=	"upload"
										filefield		=	"#imageFileField#"
										destination		=	"e:\inetpub\webroot\upload-directory"
										accept			=	"image/jpg, image/pjgp, image/jpeg, image/pjpeg, image/png"
										nameConflict	=	"makeUnique" />


							<cfset 	streetNumber = '#arguments.streetNumber#'/>
							<cfset 	streetName   = '#arguments.streetName#' />
							<cfset 	newFileName	=	'#streetNumber#-#streetName#'	/>

							<cfset	newFileName		 	=	'#streetNumber#-#streetName#'	/>																							
							<cfset 	fileNameDateTime 	= 	"#dateFormat(now(), 'yyyy-mm-dd')#-#timeFormat(now(), 'H-mm-SS-l')#" />

							<cfset	renamedNewFileName	=	reReplace(reReplace(newFileName, '[^a-zA-Z0-9\-]', '', 'all'), ' ', '-', 'all') 	/>
							<cfset	originalImageExt		=	cffile.serverFileExt	/>

							<cfset	newFileNameComplete	=	'#renamedNewFileName#-#fileNameDateTime#.#originalImageExt#'	/>

							<cffile	action			=	"copy"
										source			=	"e:\inetpub\webroot\upload-directory\#cffile.serverFile#"
										destination		=	"e:\inetpub\webroot\renamed-uploads\#newFileNameComplete#"	/>

							<cfif isImageFile('e:\inetpub\webroot\renamed-uploads\#newFileNameComplete#') >

									<cfimage		action			=	"resize"
													width				=	"200"
													height			=	""
													source			=	"e:\inetpub\webroot\renamed-uploads\#newFileNameComplete#"
													destination		=	"e:\inetpub\webroot\holtzman-rentals\user_images\photo200_#newFileNameComplete#"
													overwrite		=	"true"	/>

									<cfset		photo200			=	"photo200_#newFileNameComplete#"	/>

									<cfimage		action			=	"resize"
													width				=	"75"
													height			=	"50"
													source			=	"e:\inetpub\webroot\renamed-uploads\#newFileNameComplete#"
													destination		=	"e:\inetpub\webroot\holtzman-rentals\user_images\photo75x50_#newFileNameComplete#"
													overwrite		=	"true"	/>

									<cfset		photo75x50		=	"photo75x50_#newFileNameComplete#"	/>

									<cfimage		action			=	"resize"
													width				=	"458"
													height			=	"306"
													source			=	"e:\inetpub\webroot\renamed-uploads\#newFileNameComplete#"
													destination		=	"e:\inetpub\webroot\holtzman-rentals\user_images\photo458x306_#newFileNameComplete#"
													overwrite		=	"true"	/>

									<cfset		photo458x306	=	"photo458x306_#newFileNameComplete#"	/>




									<cfquery	name = "qInsertPhotos"	datasource="holtzmanrentals">
							
											insert
											into		rentalPhotos
								
														( 	propertyID, photo200, photo75x50, photo458x306, photoOrder )
											
											values	( 	<cfqueryparam		cfsqltype = "cf_sql_int"		value = "#qGetLastInsertID.propertyID#"	>,
											  				<cfqueryparam		cfsqltype = "cf_sql_varchar"	value = "#photo200#"								>,
											  				<cfqueryparam		cfsqltype = "cf_sql_varchar"	value = "#photo75x50#"							>,
											  				<cfqueryparam		cfsqltype = "cf_sql_varchar"	value = "#photo458x306#"						>,
											  				<cfqueryparam		cfsqltype = "cf_sql_int"		value = "#imageNumber#"							>

															)
											  
									</cfquery>


							</cfif> <!--- [ cfif isImageFile] --->

							<cffile	action		=	"delete"
										file			=	"e:\inetpub\webroot\renamed-uploads\#newFileNameComplete#"	/>

						</cfif> <!--- [ structKeyExists(form, imageFileField) ] --->



						</cfloop> <!--- [ loop over image field ] --->


						<cfdirectory	action		=	"list"
											directory	=	"e:\inetpub\webroot\upload-directory"
											name			=	"image_list"	/>

						<cfloop 	query			=	"image_list">

							<cffile	action		=	"delete"
										file			=	"e:\inetpub\webroot\upload-directory\#image_list.name#"	/>

						</cfloop>



					<cfset addPropertyStruct.STATUS	=	'Success'	/>
					
					<cfreturn addPropertyStruct	/>


					
</cffunction>					





































<!--- [ mUpdateRentalProperty ] ------------------------------------------------------------------------------------------------- --->

	<cffunction		name				=	"mUpdateRentalProperty"
						displayName		=	"mUpdateRentalProperty"
						hint				=	"Updates Rental Property Data &amp; Photos"
						output			=	"false"
						returnType		=	"struct"
						access			=	"remote"	>
					
						<!--- <cfargument 	name = "dsn"					type = "string"		required = "yes"> --->
						<cfargument		name = "propertyID"				type = "string"		required = "yes">
						<cfargument		name = "streetNumber"			type = "string"		required = "yes">
						<cfargument 	name = "streetName"				type = "string"		required = "yes">
						<cfargument		name = "city"						type = "string"		required = "yes">
						<cfargument		name = "state"						type = "string"		required = "yes">
						<cfargument 	name = "zipCode"					type = "string"		required = "no">
						<cfargument		name = "propertyType"			type = "string"		required = "no">
						<cfargument		name = "county"					type = "string"		required = "no">
						<cfargument 	name = "subdivision"				type = "string"		required = "no">
						<cfargument		name = "totalRooms"				type = "string"		required = "no">
						<cfargument		name = "bedrooms"					type = "string"		required = "yes">
						<cfargument		name = "fullBaths"				type = "string"		required = "yes">
						<cfargument 	name = "halfBaths"				type = "string"		required = "no">
						<cfargument		name = "rent"						type = "string"		required = "yes">
						<cfargument		name = "yearBuilt"				type = "string"		required = "no">
						<cfargument 	name = "securityDeposit"		type = "string"		required = "yes">
						<cfargument		name = "leaseTerm"				type = "string"		required = "no">
						<cfargument		name = "availabilityDate"		type = "string"		required = "no">
						<cfargument		name = "petsAllowed"				type = "string"		required = "no">
						<cfargument 	name = "petDeposit"				type = "string"		required = "no">
						<cfargument		name = "livingRoom"				type = "string"		required = "no">
						<cfargument		name = "diningRoom"				type = "string"		required = "no">
						<cfargument 	name = "familyRoom"				type = "string"		required = "no">
						<cfargument		name = "fireplace"				type = "string"		required = "no">
						<cfargument		name = "appliances"				type = "string"		required = "no">
						<cfargument		name = "waterIncluded"			type = "string"		required = "no">
						<cfargument 	name = "fence"						type = "string"		required = "no">
						<cfargument		name = "fenceDescription"		type = "string"		required = "no"		default="">
						<cfargument		name = "carStorage"				type = "string"		required = "no"		default="">
						<cfargument 	name = "utilities"				type = "string"		required = "no">
						<cfargument		name = "alarmSystem"				type = "string"		required = "no">
						<cfargument		name = "washerDryerIncluded"	type = "string"		required = "no">
						<cfargument		name = "washerDryerHookups"	type = "string"		required = "no">
						<cfargument 	name = "storage"					type = "string"		required = "no">
						<cfargument		name = "other"						type = "string"		required = "no">
						<cfargument		name = "availableForRent"		type = "string"		required = "no">
						<cfargument		name = "remarks"					type = "string"		required = "no">
																													
						
					<cfset	rentalPropertyUpdateStruct = structNew()>
					
					<cfquery		name = "qUpdateRentalProperty"	datasource = "holtzmanrentals"		>
					
						update		rentalProperties
						
						set			streetNumber 			= 	<cfqueryparam 	cfsqltype = "cf_sql_varchar"	value = "#arguments.streetNumber#"									>,
										streetName				= 	<cfqueryparam 	cfsqltype = "cf_sql_varchar" 	value = "#arguments.streetName#"										>,
										city						= 	<cfqueryparam 	cfsqltype = "cf_sql_varchar" 	value = "#arguments.city#"												>,
										state						= 	<cfqueryparam 	cfsqltype = "cf_sql_varchar" 	value = "#arguments.state#"											>,
										zipCode					= 	<cfqueryparam 	cfsqltype = "cf_sql_varchar" 	value = "#arguments.zipCode#"											>,
									
										propertyType			= 	<cfqueryparam 	cfsqltype = "cf_sql_varchar" 	value = "#arguments.propertyType#"									>,
										county					= 	<cfqueryparam 	cfsqltype = "cf_sql_varchar" 	value = "#arguments.county#"											>,
										subdivision				= 	<cfqueryparam 	cfsqltype = "cf_sql_varchar" 	value = "#arguments.subdivision#"									>,
										totalRooms				= 	<cfqueryparam 	cfsqltype = "cf_sql_char" 		value = "#arguments.totalRooms#"										>,
										bedrooms					=	<cfqueryparam	cfsqltype = "cf_sql_tinyint"	value = "#arguments.bedrooms#"										>,
										fullBaths				=	<cfqueryparam	cfsqltype = "cf_sql_tinyint"	value = "#arguments.fullBaths#"										>,
									
										halfBaths				= 	<cfqueryparam 	cfsqltype = "cf_sql_char" 		value = "#arguments.halfBaths#"										>,
										rent						= 	<cfqueryparam 	cfsqltype = "cf_sql_smallint" value = "#val(LSParseCurrency(arguments.rent))#"				>,
										yearBuilt				= 	<cfqueryparam 	cfsqltype = "cf_sql_varchar" 	value = "#arguments.yearBuilt#"										>,
										securityDeposit		= 	<cfqueryparam 	cfsqltype = "cf_sql_smallint"	value = "#val(LSParseCurrency(arguments.securityDeposit))#"	>,
										leaseTerm				=	<cfqueryparam	cfsqltype = "cf_sql_varchar"	value = "#arguments.leaseTerm#"										>,
										availabilityDate		=	<cfqueryparam	cfsqltype = "cf_sql_varchar"	value = "#arguments.availabilityDate#"								>,
									
										petsAllowed				= 	<cfqueryparam 	cfsqltype = "cf_sql_char" 		value = "#arguments.petsAllowed#"									>,
										petDeposit				= 	<cfqueryparam 	cfsqltype = "cf_sql_char"	 	value = "#arguments.petDeposit#"										>,
										livingRoom				= 	<cfqueryparam 	cfsqltype = "cf_sql_char" 		value = "#arguments.livingRoom#"										>,
										diningRoom				= 	<cfqueryparam 	cfsqltype = "cf_sql_char"		value = "#arguments.diningRoom#"										>,
										familyRoom				=	<cfqueryparam	cfsqltype = "cf_sql_char"		value = "#arguments.familyRoom#"										>,
										fireplace				=	<cfqueryparam	cfsqltype = "cf_sql_char"		value = "#arguments.fireplace#"										>,
									
										appliances				= 	<cfqueryparam 	cfsqltype = "cf_sql_varchar" 	value = "#arguments.appliances#"										>,
										waterIncluded			= 	<cfqueryparam 	cfsqltype = "cf_sql_char"	 	value = "#arguments.waterIncluded#"									>,
										fence						= 	<cfqueryparam 	cfsqltype = "cf_sql_char" 		value = "#arguments.fence#"											>,
										fenceDescription		= 	<cfqueryparam 	cfsqltype = "cf_sql_varchar"	value = "#arguments.fenceDescription#"								>,
										carStorage				=	<cfqueryparam	cfsqltype = "cf_sql_varchar"	value = "#arguments.carStorage#"										>,
									
										utilities				= 	<cfqueryparam 	cfsqltype = "cf_sql_varchar" 	value = "#arguments.utilities#"										>,
										alarmSystem				= 	<cfqueryparam 	cfsqltype = "cf_sql_char"	 	value = "#arguments.alarmSystem#"									>,
										washerDryerIncluded	= 	<cfqueryparam 	cfsqltype = "cf_sql_char" 		value = "#arguments.washerDryerIncluded#"							>,
										washerDryerHookups	= 	<cfqueryparam 	cfsqltype = "cf_sql_char"		value = "#arguments.washerDryerHookups#"							>,
										storage					=	<cfqueryparam	cfsqltype = "cf_sql_char"		value = "#arguments.storage#"											>,
										other						=	<cfqueryparam	cfsqltype = "cf_sql_varchar"	value = "#arguments.other#"											>,
									
										availableForRent		= 	<cfqueryparam 	cfsqltype = "cf_sql_char"		value = "#arguments.availableForRent#"								>,
										remarks					=	<cfqueryparam	cfsqltype = "cf_sql_varchar"	value = "#arguments.remarks#"											>
									
						where			propertyID = '#arguments.propertyID#'								
						
					</cfquery>
					
					
					
			<!--- [ image processing for rental property update ] --------------------------------------------------------------- --->
		
					
 					<!--- <cfset userImages 			= 	expandPath('../user_images/')>
					<cfset userImagesDirectory	=	getDirectoryFromPath(userImages)>	 --->


					<cfloop index="imageNumber" from="1" to="100" step="1">
 

						<cfset imageFileField = "#imageNumber#_propertyPhoto" />
 
						<cfif (structKeyExists(form, imageFileField) and len(form[imageFileField]))>

							<cffile	action					=	"upload"
										filefield				=	"#imageFileField#"
										destination				=	"e:\inetpub\webroot\upload-directory"
										accept					=	"image/jpg, image/pjpg, image/jpeg, image/pjpeg, image/png"
										nameConflict			=	"makeUnique"	/>

							<cfset	streetNumber			=	'#arguments.streetNumber#'	/>
							<cfset	streetName				=	'#arguments.streetName#'	/>
							<cfset	newFileName				=	'#streetNumber#-#streetName#'	/>

							<cfset	fileNameDateTime		=	"#dateFormat(now(), 'yyyy-mm-dd')#-#timeFormat(now(), 'H-mm-SS-l')#"	/>

							<cfset	renamedNewFileName	=	reReplace(reReplace(newFileName, '^[a-zA-Z0-9\-]', '', 'all'), ' ', '-', 'all')	/>
							<cfset	originalImageExt		=	cffile.serverFileExt	/>

							<cfset	newFileNameComplete	=	'#renamedNewFileName#-#fileNameDateTime#.#originalImageExt#'	/>

							<cffile	action					=	'copy'
										source					=	'e:\inetpub\webroot\upload-directory\#cffile.serverFile#'
										destination				=	'e:\inetpub\webroot\renamed-uploads\#newFileNameComplete#'	/>


							<cfif isImageFile('e:\inetpub\webroot\renamed-uploads\#newFileNameComplete#')	>

										<cfimage		action			=	"resize"
														width				=	"200"
														height			=	""
														source			=	"e:\inetpub\webroot\renamed-uploads\#newFileNameComplete#"
														destination		=	"e:\inetpub\webroot\holtzman-rentals\user_images\photo200_#newFileNameComplete#"
														overwrite		=	"true"	/>

										<cfset		photo200			=	"photo200_#newFileNameComplete#"	/>

										<cfimage		action			=	"resize"
														width				=	"75"
														height			=	"50"
														source			=	"e:\inetpub\webroot\renamed-uploads\#newFileNameComplete#"
														destination		=	"e:\inetpub\webroot\holtzman-rentals\user_images\photo75x50_#newFileNameComplete#"
														overwrite		=	"true"	/>

										<cfset		photo75x50		=	"photo75x50_#newFileNameComplete#"	/>

										<cfimage		action			=	"resize"
														width				=	"458"
														height			=	"306"
														source			=	"e:\inetpub\webroot\renamed-uploads\#newFileNameComplete#"
														destination		=	"e:\inetpub\webroot\holtzman-rentals\user_images\photo458x306_#newFileNameComplete#"
														overwrite		=	"true"	/>

										<cfset		photo458x306	=	"photo458x306_#newFileNameComplete#"	/>

										<!--- [ query number of current photos for this property to determine photoOrder ] --->

										<cfquery		name	=	"qGetPropertyPhotos"		datasource	=	"holtzmanRentals"	>

														select	photoID
														from		rentalPhotos
														where		propertyID = '#arguments.propertyID#'

										</cfquery>

										<cfset		photoOrder	=	qGetPropertyPhotos.recordCount + imageNumber	/>

										<cfquery		name	=	"qInsertPhotos"	datasource	=	"holtzmanRentals"	>

														insert
														into		rentalPhotos

																	(	propertyID, photo200, photo75x50, photo458x306, photoOrder )

														values	(	<cfqueryparam		cfsqltype	=	"cf_sql_int"		value	=	"#arguments.propertyID#"		>,
																		<cfqueryparam		cfsqltype	=	"cf_sql_varchar"	value	=	"#photo200#"						>,
																		<cfqueryparam		cfsqltype	=	"cf_sql_varchar"	value	=	"#photo75x50#"						>,
																		<cfqueryparam		cfsqltype	=	"cf_sql_varchar"	value	=	"#photo458x306#"					>,
																		<cfqueryparam		cfsqltype	=	"cf_sql_varchar"	value	=	"#photoOrder#"						>


																		)

										</cfquery>

							</cfif> <!--- [ cfif isImageFile ] --->

							<cffile	action		=	"delete"
										file			=	"e:\inetpub\webroot\renamed-uploads\#newFileNameComplete#"	/>

						</cfif> <!--- [ structKeyExists(form, imageFileField) ] --->



					</cfloop> <!--- [ loop over image fields in form ] --->


					<cfdirectory	action		=	"list"
										directory	=	"e:\inetpub\webroot\upload-directory"
										name			=	"imageList"	/>

					<cfloop query = "imageList">

						<cffile	action	=	"delete"
									file		=	"e:\inetpub\webroot\upload-directory\#imageList.name#" />

					</cfloop>
		
					
					
					<cfset	rentalPropertyUpdateStruct.STATUS		=	'Success'		/>
							
					<cfsaveContent variable = 'rentalPropertyUpdateResponseHTML'>
						
							<cfoutput>
								
								<div class="rentalPropertyUpdateWindowOverlay"></div>
	
								<div class="rentalPropertyUpdateResponseDialog">
	
									<div class="rentalPropertyUpdateResponseDialogTop"></div>
							
									<div class="rentalPropertyUpdateResponseDialogMiddle">								
								
										<div style="text-align:center;">
											<p style="font-size:13px;">The property has been successfully updated.</p>
											<div class="h8"></div>
											<input id="continueUpdateButton" type="button" name="continue" value="continue">
										</div>
									
									</div>
							
									<div style="clear:both;"></div>
							
									<div class="rentalPropertyUpdateResponseDialogBottom"></div>
									
								</div>
								
							</cfoutput>									
								

								
							
						</cfsavecontent>
						
						<cffile 	action			=	"write"
									nameconflict	=	"overwrite"
									file				=	"#expandPath('rentalPropertyUpdateResponseHTML.cfm')#"
									output			=	"#rentalPropertyUpdateResponseHTML#">						
						
						<cfreturn	rentalPropertyUpdateStruct		/>
						

	</cffunction>
	
	



































	
<!--- [ mRentalPropertyDeleteConfirmDialog ] ------------------------------------------------------------------------------------ --->

	<cffunction		name			=	"mCreateRentalPropertyDeleteConfirmDialog"
					displayName		=	"mCreateRentalPropertyDeleteConfirmDialog"
					hint			=	"Creates the confirmation dialog for deletion of selected rental property"
					output			=	"false"
					returnType		=	"struct"
					access			=	"remote"	>
					
					<!--- <cfargument 	name = "dsn"					type = "string"		required = "yes"> --->
					<cfargument		name = "propertyID"				type = "string"		required = "yes">
						
						
					<cfset	confirmRentalPropertyDeleteStruct = structNew()>
					
					<cfquery		name = "qGetRentalProperty"	datasource = "holtzmanrentals"		>
					
						select		streetNumber, streetName, city, state
						from		rentalProperties
						where		propertyID = '#arguments.propertyID#'								
						
					</cfquery>
					
					<cfif qGetRentalProperty.recordCount gt 0>
					
						<cfset	confirmRentalPropertyDeleteStruct.STATUS		=	'Success'		/>
							
						<cfsaveContent variable = 'confirmRentalPropertyDeleteDialogHTML'>
								
								<div class="windowOverlay"></div>
	
								<div class="rentalPropertyDeleteConfirmDialog">
	
									<div class="rentalPropertyDeleteConfirmDialogTop"></div>
									
									<cfoutput query="qGetRentalProperty">
							
										<div id="div-#propertyID#" class="rentalPropertyDeleteConfirmDialogMiddle">
									
											<p style="font-weight:bold;">You are about to delete the following property:</p>
											<div class="h8"></div>
											<p>#streetNumber# #streetName#, #city#, #state#</p>
											<div class="h8"></div>
											<p>Are you sure you want to do this?</p>
											<div class="h8"></div>
											<p><input id="deleteConfirmYes" name="deleteConfirm" type="radio" value="yes"> <span style="position:relative; top:-1px;">Yes</span> &nbsp;&nbsp;
											   <input id="deleteConfirmNo"  name="deleteConfirm" type="radio" value="no" checked> <span style="position:relative; top:-1px;">No</span></p>
											<p>&nbsp;</p>
											<p style="width:450px; text-align:justify;">Note:  Choosing "Yes" above performs a "hard delete" of this property, meaning that property record is
												deleted from the database and the property's photos are deleted from the file system.  If you want to
												simply make the property inactive and prevent its display on the website, use the "Update" function
												for this property and choose "Soft Delete" for the Property Status.
											<p>&nbsp;</p>
											<input id="continueDeleteButton" type="button" name="continueDelete" value="continue"> &nbsp;
											<input id="cancelDeleteButton" class="cancelDelete" type="button" value="cancel">
											
											
											
										</cfoutput>
									
									</div>
							
									<div style="clear:both;"></div>
							
									<div class="rentalPropertyDeleteConfirmDialogBottom"></div>
									
								</div>							
							
						</cfsavecontent>
						
						<cffile 	action			=	"write"
									nameconflict	=	"overwrite"
									file				=	"#expandPath('rentalPropertyDeleteConfirmDialogHTML.cfm')#"
									output			=	"#confirmRentalPropertyDeleteDialogHTML#">
									
					<cfelse>
					
						<cfset		confirmRentalPropertyDeleteStruct.STATUS	=	"Unsuccessful">
						
					</cfif>						
						
						<cfreturn	confirmRentalPropertyDeleteStruct		/>
						

	</cffunction>
	
	



































	
	
<!--- [ mRentalPropertyDeleteSuccessDialog / this function deletes the property and build success dialog ] ---------------------- --->

	<cffunction		name			=	"mRentalPropertyDeleteSuccessDialog"
					displayName		=	"mRentalPropertyDeleteSuccessDialog"
					hint			=	"Deletes the property and builds success confirmation dialog"
					output			=	"false"
					returnType		=	"struct"
					access			=	"remote"	>
					
					<!--- <cfargument 	name = "dsn"					type = "string"		required = "yes"> --->
					<cfargument		name = "propertyID"				type = "string"		required = "yes">
						
						
					<cfset	rentalPropertyDeleteStruct = structNew()>
					
					<cfquery		name = "qDeleteRentalProperty"	datasource = "holtzmanrentals"		>
					
						delete
						from		rentalProperties
						where		propertyID = '#arguments.propertyID#'								
						
					</cfquery>
					
					<cfquery		name = "qSelectRentalPropertyPhotos"	datasource = "holtzmanrentals"	>
					
						select		*
						from		rentalPhotos
						where		propertyID = '#arguments.propertyID#'
						
					</cfquery>
					
					<cfoutput query = "qSelectRentalPropertyPhotos">
					
						<cfif #fileExists(expandPath('/holtzmanRentals/user_images/#photo200#'))#>
							<cffile		action = "delete"	file = "#expandPath('/holtzmanRentals/user_images/#photo200#')#">
						</cfif>
						
						<cfif #fileExists(expandPath('/holtzmanRentals/user_images/#photo75x50#'))#>
							<cffile		action = "delete"	file = "#expandPath('/holtzmanRentals/user_images/#photo75x50#')#">
						</cfif>
						
						<cfif #fileExists(expandPath('/holtzmanrentals/user_images/#photo458x306#'))#>
							<cffile		action = "delete"	file = "#expandPath('/holtzmanRentals/user_images/#photo458x306#')#">
						</cfif>
						
					</cfoutput>
					
					<cfset	rentalPropertyDeleteStruct.STATUS		=	'Success'		/>
							
						<cfsaveContent variable = 'rentalPropertyDeleteSuccessDialogHTML'>
								
								<!--- <div class="windowOverlay"></div> --->
	
								<div class="rentalPropertyDeleteSuccessDialog">
	
									<div class="rentalPropertyDeleteSuccessDialogTop"></div>

									<div class="rentalPropertyDeleteSuccessDialogMiddle">
									
										<div style="text-align:center;">
										<p style="font-weight:bold;">The property has been deleted.</p>
										<p>&nbsp;</p>
											<input id="closeDeleteDialog" type="button" name="closeDeleteDialog" value="close">
										</div>
									
									</div>
							
									<div style="clear:both;"></div>
							
									<div class="rentalPropertyDeleteSuccessDialogBottom"></div>
									
								</div>							
							
						</cfsavecontent>
						
						<cffile 	action			=	"write"
									nameconflict	=	"overwrite"
									file			=	"#expandPath('rentalPropertyDeleteSuccessDialogHTML.cfm')#"
									output			=	"#rentalPropertyDeleteSuccessDialogHTML#">				
						
						<cfreturn	rentalPropertyDeleteStruct		/>
						

	</cffunction>
	
	
<!--- [ mDeleteRentalPropertyPhoto / deletes rental photo when link is clicked in update property dialog ] ---------------------- --->

	<cffunction		name			=	"mDeleteRentalPropertyPhoto"
					displayName		=	"mDeleteRentalPropertyPhoto"
					hint			=	"Deletes rental property photos when link is clicked in property update dialog"
					output			=	"false"
					returnType		=	"struct"
					access			=	"remote"	>
					
					<cfargument		name = "photoID"				type = "string"		required = "yes">
					
						
					<cfset	photoDeleteStruct = structNew()>
					
					<cfquery		name = "qGetPhotoFileToDelete"	datasource = "holtzmanrentals"	>
					
						select		photo200, photo75x50, photo458x306
						from		rentalPhotos
						where		photoID = '#arguments.photoID#'
						
					</cfquery>
					
					<cfquery		name = "qDeletePhotoRecord"	datasource = "holtzmanrentals"		>
					
						delete
						from		rentalPhotos
						where		photoID = '#arguments.photoID#'								
						
					</cfquery>
					
					
					<cfif #fileExists(expandPath('/holtzmanRentals/user_images/#qGetPhotoFileToDelete.photo200#'))#>
						<cffile action="delete" file="#expandPath('/holtzmanRentals/user_images/#qGetPhotoFileToDelete.photo200#')#">
					</cfif>
					
					<cfif #fileExists(expandPath('/holtzmanRentals/user_images/#qGetPhotoFileToDelete.photo75x50#'))#>
						<cffile action="delete" file="#expandPath('/holtzmanRentals/user_images/#qGetPhotoFileToDelete.photo75x50#')#">
					</cfif>
					
					<cfif #fileExists(expandPath('/holtzmanRentals/user_images/#qGetPhotoFileToDelete.photo458x306#'))#>
						<cffile action="delete" file="#expandPath('/holtzmanRentals/user_images/#qGetPhotoFileToDelete.photo458x306#')#">
					</cfif>					

					
					<cfset	photoDeleteStruct.STATUS		=	'Success'				/>
					<cfset	photoDeleteStruct.photoID		=	'#arguments.photoID#'	/>		
						
					<cfreturn	photoDeleteStruct		/>
						

	</cffunction>				

</cfcomponent>