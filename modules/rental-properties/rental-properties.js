
// --- [ rentalPropertyAddDialog jquery ] --------------------------------------------------------------------------------------- //


		$(document).ready(function() {

			$('#add_rental_property_form').hide();
			$('#property_added').hide().empty();
			$('#property_image_upload_div').hide();
			$('#property_image_upload_form').hide();
			
	//		$('.rentalPropertyAddWindowOverlay').hide();
	//		$('.rentalPropertyAddDialog').hide();
	//		$('.rentalPropertyAddResponseWindowOverlay').hide();
	//		$('.rentalPropertyAddProcessingDialog').hide();
	//		$('.rentalPropertyAddResponseDialog').hide();
			
		});
		
		
		$(document).ready(function() {
		
				$('#cancel_add_id').on('click', function() {
			
						$('#add_rental_property_form').slideUp();

				});

				$('#add_property_link').click(function() {

						$('#property_added').hide();
						$('.validation_image_status').hide();
						$('.validation_error').hide();
						$('#adding_img').hide();
						$('#adding_text').hide();
						$('#add_error').hide();
						$('#add_rental_property_form').slideDown();

				});
		});
		
	

		

		
		
// --- [ getCheckboxVals - plug-in function to turn checkbox values into comma-delimited list ] --------------------------------- //


	//	jQuery.fn.getCheckboxVals = function() {
			
			//alert('running getCheckboxVals');
	
	//		var checkboxVals = [];
	//		var i = 0;
	//		this.each(function(i) {
	//			checkboxVals[i] = $(this).val();
	//		});
			
	//		var checkboxVals = checkboxVals.join(', ');
		
	//		return checkboxVals;
	//	}
		
		
	//	jQuery.fn.getPhotoVals = function() {
		
			//alert('running getPhotoVals');
			
	//		var photoVals = [];
	//		var i = 0;
	//		this.each(function(i) {
	//			photoVals[i] = $(this).val();
	//		});
			
	//		var photoVals = photoVals.join(', ');
			
	//		return photoVals;
			
	//	}		
		
		
		

	$(document).ready(function() {

		$('#add_button_id').click(function() {
			
			values	=	{	site_dsn:					'dmrentals-development',
								street_number:				$('#street_number').val(),		
								street_name:				$('#street_name').val(),  
								city:							$('#city').val(),  
								state:						$('#state').val(),   
								zip_code:					$('#zip_code').val(),

								property_type:				$('#property_type, option:selected').val(),
								county:						$('#county').val(),
								subdivision:				$('#subdivision').val(),

								total_rooms:				$('#total_rooms').val(),
								bedrooms:					$('#bedrooms').val(),
								full_baths:					$('#full_baths').val(),
								half_baths:					$('#half_baths').val(),

								living_room:				$('input:radio[name=living_room]:checked').val(),
								dining_room:				$('input:radio[name=dining_room]:checked').val(),
								family_room:				$('input:radio[name=family_room]:checked').val(),
								fireplace:					$('input:radio[name=fireplace]:checked').val(),								

								rent:							$('#rent').val(),
								security_deposit:			$('#security_deposit').val(),
								availability_date:		$('#availability_date').val(),
								lease_term:					$('#lease_term').val(),																

								year_built:					$('#year_built').val(),
								appliances:					$('#appliances').val(), 							
								water_included:			$('input:radio[name=water_included]:checked').val(),
								alarm_system:				$('input:radio[name=alarm_system]:checked').val(),


								pets_allowed:				$('input:radio[name=pets_allowed]:checked').val(),
								pet_deposit:				$('#pet_deposit').val(),

								fence:						$('input:radio[name=fence]:checked').val(),
								fence_description:		$('#fence_description').val(),

								car_parking:				$('#car_parking').val(),
								utilities:					$('#utilities').val(),

								washer_dryer_included:	$('input:radio[name=washer_dryer_included]:checked').val(),
								washer_dryer_hookups:	$('input:radio[name=washer_dryer_hookups]:checked').val(),

								unavailable_repair: 		$('input:radio[name=unavailable_repair]:checked').val(),
								unavailable_rented: 		$('input:radio[name=unavailable_rented]:checked').val(),
								unavailable_other: 		$('input:radio[name=unavailable_other]:checked').val(),

								remarks:						$('#remarks').val()															}
			
			
			//console.log( values );

			//alert(  $('input:file[name$=_propertyPhoto]').getPhotoVals() );
			
			
			$.ajax		({	cache:			false,
								type:				'post',
								url:				'rental-properties.cfc?method=mAddRentalProperty&returnFormat=json',
								dataType:		'json',
								data:				values,
								async:			false,
								success:			function(response) {
								
															//alert('inside success function');
									
														if		(	response.STATUS == 'Success'								)
																{	$('#add_rental_property_form').slideUp();
																	$('#property_added').append('<p>The following property has now been added:</p><br/><p>' + response.STREET_NUMBER + ' ' + response.STREET_NAME + '</p><p>' + response.CITY + ', ' + response.STATE + '</p><br/><br/>');
																	$('#property_added').slideDown();
																	$('#property_image_upload_div').slideDown(); 						}
														
																
														else	{	alert('Failed to add new property');					}
															
													}
			});

		});

	});
	
	
// --- [ / show add dialog and process submission via ajax ] -------------------------------------------------------------------- //

	
	
	
		
						// ---[ runs after #addButton is clicked ] ---//
							
								$(document).ready(function() {
									
									$('#add_button_id').on('click', function() {
										
 									//	var dialogPosition = $(window).scrollTop();
									//	var dialogPosition = dialogPosition + 100;
									//	$('.rentalPropertyAddProcessingDialog').css('top', dialogPosition);										
									//	$('.rentalPropertyAddDialog').fadeOut(250);
									//	$('.rentalPropertyAddProcessingDialog').fadeIn(250);
										//alert('About to run processAddRentalPropertyForm function');
										processAddRentalPropertyForm();
										
									});
								});

						
						//--- [ jquery code that intercepts form submission and processes form through inserted iframe ] ---//
	
								function processAddRentalPropertyForm() {
									
									//alert('inside function processAddRentalPropertyForm');
				
									var addNewRentalPropertyForm = $('#addNewRentalPropertyForm');
									//console.log(jForm);

									addNewRentalPropertyForm.submit(function(objEvent){	
										
										//alert('inside addNewRentalPropertyForm.submit function');					
						
										var jThis = $(this);
										//$('#loading').fadeIn(500);
 
										var strName = ("uploader" + (new Date()).getTime());
										var jFrame = $( "<iframe name=\"" + strName + "\" src=\"about:blank\" />" );

										jFrame.css("display", "none");
										jFrame.load(function(objEvent){				

											var objUploadBody = window.frames[ strName ].document.getElementsByTagName( "body" )[ 0 ];
											var jBody = $(objUploadBody);

 											var dialogPosition = $(window).scrollTop();
											var dialogPosition = dialogPosition + 100;
											$('.rentalPropertyAddResponseDialog').css('top', dialogPosition);
											$('.rentalPropertyAddProcessingDialog').fadeOut(250);	
											$('.rentalPropertyAddResponseDialog').fadeIn(250);
 											

										});
						
										$("body:first").append(jFrame);
										

										jThis
												.attr( "action", "rentalProperties.cfc?method=mAddRentalProperty&returnFormat=json" )
												.attr( "method", "post" )
												.attr( "enctype", "multipart/form-data" )
												.attr( "encoding", "multipart/form-data" )
												.attr( "target", strName )

									});
									
								}

								
								
// --- [ continue button js from add response ] --------------------------------------------------------------------------------- //

	$(document).ready(function() {
	
		$('#continueButton').click(function() {
		
			fnGetRentalProperties();
			$('.rentalPropertyAddResponseDialog').fadeOut(250, function() {
			
				$('.rentalPropertyAddWindowOverlay').fadeOut(250);
				
			});
		});
	});

// --- [ / continue button js from add response ] ------------------------------------------------------------------------------- //								

