	<style>

			#add_property_link a:hover { color:rgba(255,255,206,1) }
			#submit_button { color:rgba(0,0,0,1); }

	</style>



	<div class="container_100">

			<p>&nbsp;</p>
			<p class="page_heading">Rental Properties Management</p>
			<p>&nbsp;</p>
			<p id="add_property_link"><a href="" onClick="return false">Click here</a> to add a new property. To update or delete a current property, click "Update" or "Delete" beneath the appropriate property below.</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>

			<div id="property_added">


			</div>

			<form id="add_rental_property_form">

					<h4 id="add_property_heading">Add Rental Property <span class="required_note">( <span class="required_asterick">*<span> denotes required field )</span></h4>

					<div id="street_number_div" class="text_input_container_div_left">

							<label for="street_number" id="street_number_label">Street Number

									<span class="required_asterick">*</span></label>
									<span id="street_number_error" class="error_message"></span>
									<span id="street_number_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="street_number" name="street_number" type="text" value="" >

					</div> <!--- [ street_number_div ] --->

					<div id="street_name_div" class="text_input_container_div_right">

							<label for="street_name" id="street_name_label">Street Name

									<span class="required_asterick">*</span></label>
									<span id="street_name_error" class="error_message"></span>
									<span id="street_name_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="street_name" name="street_name" type="text" value="" >

					</div> <!--- [ street_name_div ] --->

					<div id="city_div" class="text_input_container_div_left">

							<label for="city" id="city_label">City

									<span class="required_asterick">*</span></label>
									<span id="city_error" class="error_message"></span>
									<span id="city_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="city" name="city" type="text" value="" >

					</div> <!--- [ city_div ] --->

					<div id="state_div" class="text_input_container_div_right">

							<label for="state" id="state_label">State

									<span class="required_asterick">*</span></label>
									<span id="state_error" class="error_message"></span>
									<span id="state_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="state" name="state" type="text" value="" >

					</div> <!--- [ state_div ] --->	

					<div id="zip_code_div" class="text_input_container_div_left">

							<label for="zip_code" id="zip_code_label">Zip Code

									<span class="required_asterick">*</span></label>
									<span id="zip_code_error" class="error_message"></span>
									<span id="zip_code_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="zip_code" name="zip_code" type="text" value="" >

					</div> <!--- [ zip_code_div ] --->




					<div style="clear:both; height:100px"></div>




					<div id="property_type_div" class="select_input_container_div_left">

							<label for="property_type" id="property_type_label">Property Type

									<span class="required_asterick">*</span></label>
									<span id="property_type_error" class="error_message"></span>
									<span id="property_type_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<select id="property_type" class="select_input" name="property_type">

											<option value="House">House</option>
											<option value="Apartment">Apartment</option>
											<option value="Condo/Townhouse">Condo/Townhouse</option>
											<option value="Mobile Home">Mobile Home</option>

									</select>

					</div> <!--- [ property_type_div ] --->

					<div id="county_div" class="text_input_container_div_right">

							<label for="county" id="county_label">County

									<span class="required_asterick">*</span></label>
									<span id="county_error" class="error_message"></span>
									<span id="county_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="county" name="county" type="text" value="" >

					</div> <!--- [ county_div ] --->

					<div id="subdivision_div" class="text_input_container_div_left">

							<label for="subdivision" id="subdivision_label">Subdivision

									<span class="required_asterick">*</span></label>
									<span id="subdivision_error" class="error_message"></span>
									<span id="subdivision_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="subdivision" name="subdivision" type="text" value="" >

					</div> <!--- [ subdivision_div ] --->									




			<div style="clear:both; height:100px"></div>




					<div id="total_rooms_div" class="text_input_container_div_left">

							<label for="total_rooms" id="total_rooms_label">Total Rooms

									<span class="required_asterick">*</span></label>
									<span id="total_rooms_error" class="error_message"></span>
									<span id="total_rooms_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="total_rooms" name="total_rooms" type="text" value="" >

					</div> <!--- [ total_rooms_div ] --->

					<div id="bedrooms_div" class="text_input_container_div_right">

							<label for="bedrooms" id="bedrooms_label">Bedrooms

									<span class="required_asterick">*</span></label>
									<span id="bedrooms_error" class="error_message"></span>
									<span id="bedrooms_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="bedrooms" name="bedrooms" type="text" value="" >

					</div> <!--- [ bedrooms_div ] --->

					<div id="full_baths_div" class="text_input_container_div_left">

							<label for="full_baths" id="full_baths_label">Full Baths

									<span class="required_asterick">*</span></label>
									<span id="full_baths_error" class="error_message"></span>
									<span id="full_baths_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="full_baths" name="full_baths" type="text" value="" >

					</div> <!--- [ full_baths_div ] --->

					<div id="half_baths_div" class="text_input_container_div_right">

							<label for="half_baths" id="half_baths_label">Half Baths

									<span class="required_asterick">*</span></label>
									<span id="half_baths_error" class="error_message"></span>
									<span id="half_baths_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="half_baths" name="half_baths" type="text" value="" >

					</div> <!--- [ half_baths_div ] --->																




					<div style="clear:both; height:100px"></div>




					<div id="living_room_div" class="radio_input_container_div_left">

							<label for="living_room" id="living_room_label">Living Room

								<span class="required_asterick">*</span></label>
								<span id="living_room_error" class="error_message"></span>
								<span id="living_room_valid" class="field_valid"></span>
								<img class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
								<input id="living_room" class="radio" name="living_room" type="radio" value="Yes"><span id="living_room_yes_text" class="radio_input_label">Yes</span>
								<input id="living_room" class="radio" name="living_room" type="radio" value="No"><span id="living_room_no_text" class="radio_input_label">No</span>

					</div> <!--- [ living_room_div ] --->

					<div id="dining_room_div" class="radio_input_container_div_left">

							<label for="dining_room" id="dining_room_label">Dining Room

								<span class="required_asterick">*</span></label>
								<span id="dining_room_error" class="error_message"></span>
								<span id="dining_room_valid" class="field_valid"></span>
								<img class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
								<input id="dining_room" class="radio" name="dining_room" type="radio" value="Yes"><span id="dining_room_yes_text" class="radio_input_label">Yes</span>
								<input id="dining_room" class="radio" name="dining_room" type="radio" value="No"><span id="dining_room_no_text" class="radio_input_label">No</span>

					</div> <!--- [ dining_room_div ] --->




					<div style="clear:both; height:50px"></div>





					<div id="family_room_div" class="radio_input_container_div_left">

							<label for="family_room" id="family_room_label">Family Room

								<span class="required_asterick">*</span></label>
								<span id="family_room_error" class="error_message"></span>
								<span id="family_room_valid" class="field_valid"></span>
								<img class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
								<input id="family_room" class="radio" name="family_room" type="radio" value="Yes"><span id="family_room_yes_text" class="radio_input_label">Yes</span>
								<input id="family_room" class="radio" name="family_room" type="radio" value="No"><span id="family_room_no_text" class="radio_input_label">No</span>

					</div> <!--- [ family_room_div ] --->

					<div id="fireplace_div" class="radio_input_container_div_left">

							<label for="fireplace" id="fireplace_label">Fireplace

								<span class="required_asterick">*</span></label>
								<span id="fireplace_error" class="error_message"></span>
								<span id="fireplace_valid" class="field_valid"></span>
								<img class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
								<input id="fireplace" class="radio" name="fireplace" type="radio" value="Yes"><span id="fireplace_yes_text" class="radio_input_label">Yes</span>
								<input id="fireplace" class="radio" name="fireplace" type="radio" value="No"><span id="fireplace_no_text" class="radio_input_label">No</span>

					</div> <!--- [ fireplace_div ] --->




					<div style="clear:both; height:50px"></div>	




					<div id="rent_div" class="text_input_container_div_left">

							<label for="rent" id="rent_label">Rent

									<span class="required_asterick">*</span></label>
									<span id="rent_error" class="error_message"></span>
									<span id="rent_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="rent" name="rent" type="text" value="" >

					</div> <!--- [ rent_div ] --->

					<div id="security_deposit_div" class="text_input_container_div_right">

							<label for="security_deposit" id="security_deposit_label">Security Deposit

									<span class="required_asterick">*</span></label>
									<span id="security_deposit_error" class="error_message"></span>
									<span id="security_deposit_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="security_deposit" name="security_deposit" type="text" value="" >

					</div> <!--- [ security_deposit_div ] --->

					<div id="availability_date_div" class="text_input_container_div_left">

							<label for="availability_date" id="rent_label">Availability Date

									<span class="required_asterick">*</span></label>
									<span id="availability_date_error" class="error_message"></span>
									<span id="availability_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="availability_date" name="availability_date" type="text" value="" >

					</div> <!--- [ availability_date_div ] --->

					<div id="lease_term_div" class="text_input_container_div_right">

							<label for="lease_term" id="lease_term_label">Lease Term

									<span class="required_asterick">*</span></label>
									<span id="lease_term_error" class="error_message"></span>
									<span id="lease_term_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="lease_term" name="lease_term" type="text" value="" >

					</div> <!--- [ lease_term_div ] --->																




					<div style="clear:both; height:100px"></div>




					<div id="year_built_div" class="text_input_container_div_left">

							<label for="year_built" id="year_built_label">Year Built

									<span class="required_asterick">*</span></label>
									<span id="year_built_error" class="error_message"></span>
									<span id="year_built_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="year_built" name="year_built" type="text" value="" >

					</div> <!--- [ year_built_div ] --->

					<div id="appliances_div" class="text_input_container_div_right">

							<label for="appliances" id="appliances_label">Appliances

									<span class="required_asterick">*</span></label>
									<span id="appliances_error" class="error_message"></span>
									<span id="appliances_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="appliances" name="appliances" type="text" value="" >

					</div> <!--- [ appliances_div ] --->

					<p>&nbsp;</p>

					<div id="water_included_div" class="radio_input_container_div_left">

							<label for="water_included" id="water_included_label">Water Included

								<span class="required_asterick">*</span></label>
								<span id="water_included_error" class="error_message"></span>
								<span id="water_included_valid" class="field_valid"></span>
								<img class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
								<input id="water_included" class="radio" name="water_included" type="radio" value="Yes"><span id="water_included_yes_text" class="radio_input_label">Yes</span>
								<input id="water_included" class="radio" name="water_included" type="radio" value="No"><span id="water_included_no_text" class="radio_input_label">No</span>

					</div> <!--- [ water_included_div ] --->

					<div id="alarm_system_div" class="radio_input_container_div_left">

							<label for="alarm_system" id="alarm_system_label">Alarm System

								<span class="required_asterick">*</span></label>
								<span id="alarm_system_error" class="error_message"></span>
								<span id="alarm_system_valid" class="field_valid"></span>
								<img class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
								<input id="alarm_system" class="radio" name="alarm_system" type="radio" value="Yes"><span id="alarm_system_yes_text" class="radio_input_label">Yes</span>
								<input id="alarm_system" class="radio" name="alarm_system" type="radio" value="No"><span id="alarm_system_no_text" class="radio_input_label">No</span>

					</div> <!--- [ alarm_system_div ] --->					




					<div style="clear:both; height:100px"></div>	




					<div id="pets_allowed_div" class="radio_input_container_div_left">

							<label for="pets_allowed" id="pets_allowed_label">Pets Allowed

								<span class="required_asterick">*</span></label>
								<span id="pets_allowed_error" class="error_message"></span>
								<span id="pets_allowed_valid" class="field_valid"></span>
								<img class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
								<input id="pets_allowed" class="radio" name="pets_allowed" type="radio" value="Yes"><span id="pets_allowed_yes_text" class="radio_input_label">Yes</span>
								<input id="pets_allowed" class="radio" name="pets_allowed" type="radio" value="No"><span id="pets_allowed_no_text" class="radio_input_label">No</span>

					</div> <!--- [ pets_allowed_div ] --->	

					<div id="pet_deposit_div" class="text_input_container_div_right">

							<label for="pet_deposit" id="pet_deposit_label">Pet Deposit

									<span class="required_asterick">*</span></label>
									<span id="pet_deposit_error" class="error_message"></span>
									<span id="pet_deposit_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="pet_deposit" name="pet_deposit" type="text" value="" >

					</div> <!--- [ pet_deposit_div ] --->

					<div style="clear:both"></div>

					<div id="fence_div" class="radio_input_container_div_left">

							<label for="fence" id="fence_label">Fence

								<span class="required_asterick">*</span></label>
								<span id="fence_error" class="error_message"></span>
								<span id="fence_valid" class="field_valid"></span>
								<img class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
								<input id="fence" class="radio" name="fence" type="radio" value="Yes"><span id="fence_yes_text" class="radio_input_label">Yes</span>
								<input id="fence" class="radio" name="fence" type="radio" value="No"><span id="fence_no_text" class="radio_input_label">No</span>

					</div> <!--- [ fence_div ] --->	

					<div id="fence_description_div" class="text_input_container_div_right">

							<label for="fence_description" id="fence_description_label">Fence Description

									<span class="required_asterick">*</span></label>
									<span id="fence_description_error" class="error_message"></span>
									<span id="fence_description_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="fence_description" name="fence_description" type="text" value="" >

					</div> <!--- [ fence_description_div ] --->							

																																	



					<div style="clear:both; height:100px"></div>	




					<div id="car_parking_div" class="text_input_container_div_left">

							<label for="car_parking" id="car_parking_label">Car Parking

									<span class="required_asterick">*</span></label>
									<span id="car_parking_error" class="error_message"></span>
									<span id="car_parking_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="car_parking" name="car_parking" type="text" value="(Number Spaces, Type)" >

					</div> <!--- [ car_parking_div ] --->	

					<div id="utilities_div" class="text_input_container_div_right">

							<label for="utilities" id="utilities_label">Utilities

									<span class="required_asterick">*</span></label>
									<span id="utilities_error" class="error_message"></span>
									<span id="utilities_valid" class="field_valid"></span>
									<img  class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
									<input id="utilities" name="utilies" type="text" value="" >

					</div> <!--- [ utilities_div ] --->

					<p>&nbsp;</p>

					<div id="washer_dryer_included_div" class="radio_input_container_div_left">

							<label for="washer_dryer_included" id="washer_dryer_included_label">Washer &amp; Dryer Included

								<span class="required_asterick">*</span></label>
								<span id="washer_dryer_included_error" class="error_message"></span>
								<span id="washer_dryer_included_valid" class="field_valid"></span>
								<img class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
								<input id="washer_dryer_included" class="radio" name="washer_dryer_included" type="radio" value="Yes"><span id="washer_dryer_included_yes_text" class="radio_input_label">Yes</span>
								<input id="washer_dryer_included" class="radio" name="washer_dryer_included" type="radio" value="No"><span id="washer_dryer_included_no_text" class="radio_input_label">No</span>

					</div> <!--- [ washer_dryer_included_div ] --->

					<div id="washer_dryer_hookups_div" class="radio_input_container_div_left">

							<label for="washer_dryer_hookups" id="washer_dryer_hookups_label">Washer &amp; Dryer Hookups

								<span class="required_asterick">*</span></label>
								<span id="washer_dryer_hookups_error" class="error_message"></span>
								<span id="washer_dryer_hookups_valid" class="field_valid"></span>
								<img class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
								<input id="washer_dryer_hookups" class="radio" name="washer_dryer_hookups" type="radio" value="Yes"><span id="washer_dryer_hookups_yes_text" class="radio_input_label">Yes</span>
								<input id="washer_dryer_hookups" class="radio" name="washer_dryer_hookups" type="radio" value="No"><span id="washer_dryer_hookups_no_text" class="radio_input_label">No</span>

					</div> <!--- [ washer_dryer_hookups_div ] --->													




					<div style="clear:both; height:100px;"></div>





					<div id="unavailable_repair_div" class="radio_input_container_div_left">

							<label for="unavailable_repair" id="unavailable_repair_label">Unavailable - Repair

								<span class="required_asterick">*</span></label>
								<span id="unavailable_repair_error" class="error_message"></span>
								<span id="unavailable_repair_valid" class="field_valid"></span>
								<img class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
								<input id="unavailable_repair" class="radio" name="unavailable_repair" type="radio" value="Yes"><span id="unavailable_repair_yes_text" class="radio_input_label">Yes</span>
								<input id="unavailable_repair" class="radio" name="unavailable_repair" type="radio" value="No"><span id="unavailable_repair_no_text" class="radio_input_label">No</span>

					</div> <!--- [ unavailable_repair_div ] --->

					<div id="unavailable_rented_div" class="radio_input_container_div_right">

							<label for="unavailable_rented" id="unavailable_rented_label">Unavailable - Rented

								<span class="required_asterick">*</span></label>
								<span id="unavailable_rented_error" class="error_message"></span>
								<span id="unavailable_rented_valid" class="field_valid"></span>
								<img class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
								<input id="unavailable_rented" class="radio" name="unavailable_rented" type="radio" value="Yes"><span id="unavailable_rented_yes_text" class="radio_input_label">Yes</span>
								<input id="unavailable_rented" class="radio" name="unavailable_rented" type="radio" value="No"><span id="unavailable_rented_no_text" class="radio_input_label">No</span>

					</div> <!--- [ unavailable_rented_div ] --->

					<div style="clear:both; height:20px;"></div>

					<div id="unavailable_other_div" class="radio_input_container_div_left">

							<label for="unavailable_other" id="unavailable_other_label">Unavailable - Other

								<span class="required_asterick">*</span></label>
								<span id="unavailable_other_error" class="error_message"></span>
								<span id="unavailable_other_valid" class="field_valid"></span>
								<img class="validation_image_status" src="/site_wide_assets/images/valid.png"></span><br/>
								<input id="unavailable_other" class="radio" name="unavailable_other" type="radio" value="Yes"><span id="unavailable_other_yes_text" class="radio_input_label">Yes</span>
								<input id="unavailable_other" class="radio" name="unavailable_other" type="radio" value="No"><span id="unavailable_other_no_text" class="radio_input_label">No</span>

					</div> <!--- [ unavailable_other_div ] --->					




					<div style="clear:both;height:50px;"></div>





					<div id="remarks_div" class="textarea_input_container_div">

							<label for="remarks" id="remarks_label">Remarks</label><br/>

							<textarea id="remarks" name="remarks" wrap="physical" row="8" style="width:650px"></textarea>

					</div>




					<div style="height:50px;"></div>




					<input id="add_button_id" type="button" value="submit"> &nbsp;
					<input id="cancel_add_id" type="button" value="cancel">
					<span class="validation_error">Please check the form for error messages</span>
					<span id="adding_img"><img src="/site_wide_assets/images/loading.gif"></span>
					<span id="adding_text">Adding record...</span>
					<span id="add_error">Add failed. Please try again...</span>

					<input id="site_dsn" name="site_dsn" type="hidden" value="<cfoutput>#application.site_dsn#</cfoutput>" >


					<div style="clear:both; height:100px;"></div>



			</form>


			<div class="uploaded_image_info_container">


			</div>


			<div id="property_image_upload_div">

				<p>Would you like to add images for this property at this time?</p>

					<input id="add_image_yes" name="add_image_yes" type="button" value="yes">&nbsp;
					<input id="add_image_no"  name="add_image_no"  type="button" value="no ">

			</div>

			<form id="property_image_upload_form" enctype="multipart/form-data">

					<input id="property_image" type="file" name="property_image" value="" /><br/>
					<br/>
					<input id="submit_button" type="button" value="upload"/>

					<input id="property_id" type="hidden" value="1"/>

			</form>

			<style>

				.uploaded_image_info_container 	{ margin-top:50px; }
				.uploaded_image img 					{ width:200px; border:1px solid rgba(255,255,255,.8); border-radius:.5em; margin-right:1em; margin-top:4em;}
				.uploaded_image_name 				{ display:inline-block; vertical-align:top; padding-top:1em; margin-top:4em; }						
				.image_message_container img		{ display:inline-block; vertical-align:top; margin-top:5em; width:1em; }
				.processing_image_text 				{ display:inline-block; vertical-align:top; margin-top:4.85em; color:rgba(255,0,0,1); }
				.processing_complete_text 			{ display:inline-block; vertical-align:top; margin-top:4.85em; }

			</style>





			<script>

					$(document).ready(function() {

							$('.uploaded_image_info_container span').empty();
							$('#property_image').val('');

					});

			</script>


			<script>

					$(document).ready(function() {

							$('#submit_button').on('click', function(e) {

									e.preventDefault();

									console.log('1');

									var formValues = { property_image: 	$('#property_image').val(),
															 property_id: 		$('#property_id').val()			}

									ajaxUpload(formValues); 

							});


							function ajaxUpload(formValues) {

									console.log('ajaxUpload function called');

									console.log(formValues);

									console.log(formValues.property_image);
									console.log(formValues.property_id);

									var formValues = new FormData();
									formValues.append('property_image', $('#property_image')[0].files[0]);
									formValues.append('property_id', $('#property_id').val());

									console.log(formValues);

									$.ajax	({ 	url: 				'rental-properties.cfc?method=mUploadPropertyImage&returnFormat=json',
														data: 			formValues,
														cache: 			false,
														processData: 	false,
														contentType:   false,
														type: 			'post',
														dataType: 		'json',

														beforeSend: 	function() {

																					$('.uploaded_image_info_container').append('<span class="image_message_container"><img src="../../site_wide_assets/images/loading.gif"> <span class="processing_image_text">Processing image: please wait...</span></span>')	
																			},

														success: 		function(response) {

																					console.log(response); 

																					var imagePath = '<cfoutput>#application.userImagesReadDir#/</cfoutput>';

																							$('.image_message_container').empty();
																							$('.uploaded_image_info_container').append('<span class="uploaded_image"> <img src=' + imagePath + response.UPLOADED_IMAGE + '></span> <span class="processing_complete_text">Image processing complete</span><div style="clear:both"></div>');
																							$('#property_image').val('');																					

																					// $.when(	$('.uploaded_image_info_container').empty(),
																					// 			$('.uploaded_image_info_container').append('<span class="uploaded_image"> <img src=' + imagePath + response.UPLOADED_IMAGE + '></span> <span class="processing_complete_text">Image processing complete!</span><div style="clear:both"></div>'),
																					// 			$('#property_image').val('')
																					// 			 ).done(function() {

																					//					$('.image_message_container').empty().append('<span class="processing_complete_text">Processing complete!</span>').css({'color':'rgba(255,255,255,1)'});
																					//			});
																			},

														error: 			function(response) {

																					console.log(response);
																			}
									});
							}
					});

			</script>




	</div>