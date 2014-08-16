	<style>

			#add_property_link a:hover { color:rgba(255,255,206,1) }
			#submit_button { color:rgba(0,0,0,1); }

	</style>



	<div class="container_100">

			<p>&nbsp;</p>
			<p class="page_heading">Rental Properties Management</p>
			<p>&nbsp;</p>
			<p id="add_property_link"><a href="" onClick=return false>Click here</a> to add a new property.</p>
			<p>&nbsp;</p>
			<p>To update or delete a current property, click "Update" or "Delete" beneath the appropriate property below.</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>

			<form id="property_image_upload_form" enctype="multipart/form-data">

					<input id="property_image" type="file" name="property_image" value="" /><br/>
					<br/>
					<input id="submit_button" type="button" value="upload"/>

					<input id="property_id" type="hidden" value="1"/>

			</form>

			<style>

				.thumb_info_container { margin-top:50px;}
				#thumb img { width:200px; border:1px solid rgba(255,255,255,.8); border-radius:.5em; margin-right:1em; }
				#messageDiv { display:inline-block; vertical-align:top; padding-top:1em; }

			</style>


			<div class="thumb_info_container">

					<span id="thumb"></span> <span id="messageDiv"></span>

			</div>


			<script>

					$(document).ready(function() {

							$('.thumb_info_container span').empty();

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

														success: 		function(response) {

																					console.log(response);

																					var imagePath = 'http://localhost/dmrentals-sm/images/';

																					$('#messageDiv').append($('#messageDiv').html() + '<p>' + response.PROPERTY_IMAGE + '</p>');
																					$('#thumb').append($('#thumb').html() + '<img src=' + imagePath + response.PROPERTY_IMAGE_THUMB + '>');
																			},

														error: 			function(response) {

																					console.log(response);
																			}
									});
							}
					});

			</script>




	</div>