
	<style>

			#add_property_link a:hover { color:rgba(255,255,206,1) }

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




			<div class="preview" style="width:200px; border:1px solid rgba(0,0,0,1)"><img id="thumb" width="100px" src="dmrentals-logo.png"></div>


			<style>

					#processing_image {

							width:1em;
				}

					#processing_image, #processing_text {

							display:none;
				}

			</style>


			<form id="add_new_rental_property_photo_form" method="post">

				<label>Select an image</label>
				<input id="imageUpload" class=" " type="file" size="20" >
				<input id="upload_image_button" type="button" value="upload image">
				<img id="processing_image" src="/site_wide_assets/images/loading.gif" /> <span id="processing_text">Processing...</span>
				
			</form>	
			

			<script>

					$(document).ready(function(){

							$('#upload_image_button').click(function() {

									var thumb = $('img#thumb');

									$('#processing_image, #processing_text').fadeIn();

									fnProcessAddRentalPropertyPhotoForm();

							});

					});

					
					function fnProcessAddRentalPropertyPhotoForm() {

							// alert('inside fnProcessAddRentalPropertyPhotoForm');

							var addNewRentalPropertyPhotoForm = $('#add_new_rental_property_photo_form');

							addNewRentalPropertyPhotoForm.submit(function(objEvent) {

									var jThis = $(this);

									var strName = ('uploader' + (new Date()).getTime());

									var jFrame  = $( '<iframe name=\'' + strName + '\' src=\'about:blank\' />' );

									jFrame.css('display', 'none');

									jFrame.load(function(objEvent) {

											var objUploadBody = window.frames[ strName ].document.getElementsByTagName( 'body' )[ 0 ];
											var jBody = $(objUploadBody);

									});

									$('body:first').append(jFrame);

									jThis 	.attr( 'action', 'rental-properties.cfc?method=mAddRentalPropertyPhoto&returnFormat=json' )
												.attr( 'method', 'post')
												.attr( 'enctype', 'multipart/form-data')
												.attr( 'encoding', 'multipart/form-data')
												.attr( 'target'. strName )

							});
					}



					// 		new AjaxUpload('imageUpload', {

					// 				action: 		$('form#newHotnessForm').attr('action'),
					// 				name: 		'image',

					// 				onSubmit: 	function(file, extension) {

					// 										$('div.preview').addClass('loading');
					// 								},

					// 				onComplete: function(file, response) {

					// 										thumb.load(function(){

					// 												$('div.preview').removeClass('loading');
					// 												thumb.unbind();
					// 										});

					// 										thumb.attr('src', response);
					// 								}
					// 		});
					// 	});
					// }); 		

			</script>

	</div>




