	<?php
	$this->lang->load('ps', 'english');
	?>
	<ul class="breadcrumb">
		<li><a href="<?php echo site_url('dashboard');?>"><?php echo $this->lang->line('dashboard_label')?></a> <span class="divider"></span></li>
		<li><?php echo $this->lang->line('shop_info_label')?></li>
	</ul>

	<!-- Message -->
	<?php if($this->session->flashdata('success')): ?>
		<div class="alert alert-success fade in">
			<?php echo $this->session->flashdata('success');?>
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
		</div>
	<?php elseif($this->session->flashdata('error')):?>
		<div class="alert alert-danger fade in">
			<?php echo $this->session->flashdata('error');?>
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
		</div>
	<?php endif;?>
	
	<?php
	$attributes = array('id' => 'shop-form');
	echo form_open(site_url("shops/edit/".$shop->id), $attributes);
	?>
		<div class="row">
							
							
							<ul id="myTab" class="nav nav-tabs">
							   <li class="active"><a href="#shopinfo" data-toggle="tab">Shop Information</a></li>
							   <li><a href="#payment" data-toggle="tab">Payment Setting</a></li>
							   <li><a href="#currency" data-toggle="tab">Currency Setting</a></li>
							   <li><a href="#sender" data-toggle="tab">Sending Email Setting(For SMTP)</a></li>
							   <li><a href="#shipping" data-toggle="tab">Shipping Rate</a></li>
							</ul>
							<div id="myTabContent" class="tab-content">
							   <div class="tab-pane fade in active" id="shopinfo">
							      <br>
							      <div class="form-group">
							      	<label>
							      		<?php echo $this->lang->line('name_label')?>
							      		<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('shop_name_tooltips')?>">
							      			<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		</a>
							      	</label>
							      	<input class="form-control" type="text" placeholder="Name" name='name' id='name'
							      	 value="<?php echo $shop->name;?>">
							      </div>
							      
							      <div class="form-group">
							      	<label><?php echo $this->lang->line('description_label')?>
							      		<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('shop_desc_tooltips')?>">
							      			<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		</a>
							      	</label>
							      	<textarea class="form-control" name="description" placeholder="Description" rows="9"><?php echo $shop->description;?></textarea>
							      </div>
							      
							      <div class="form-group">
							      	<label><input type="checkbox" name="status" value="1" <?php if($shop->status == 1) echo "checked";?> >&nbsp;&nbsp;Status For Publish</label>
							      </div>
							      
							      <div class="form-group">
							      	<label><?php echo $this->lang->line('shop_keyword_label')?>
							      		<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('shop_keyword_tooltips')?>">
							      			<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		</a>
							      	</label>
							      	<input class="form-control" type="text" placeholder="Keyword" name='keyword' id='keyword' value="<?php echo $shop->keyword;?>">
							      </div>
							      
							      <div class="form-group">
							      	<label><?php echo $this->lang->line('phone_label')?>
							      		<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('shop_phone_tooltips')?>">
							      			<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		</a>
							      	</label>
							      	<input class="form-control" type="text" placeholder="Phone" name='phone' id='phone'
							      	 value="<?php echo $shop->phone;?>">
							      </div>
							      
							      <div class="form-group">
							      	<label><?php echo $this->lang->line('contact_email_label')?>
							      		<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('shop_email_tooltips')?>">
							      			<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		</a>
							      	</label>
							      	<input class="form-control" type="text" placeholder="Email" name='email' id='email'
							      	 value="<?php echo $shop->email;?>">
							      </div>
							      
							      <div class="form-group">
							      	<label><?php echo $this->lang->line('shop_lat_label')?>
							      		<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('shop_lat_tooltips')?>">
							      			<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		</a>
							      	</label><br>
							      	<input class="form-control" type="text" placeholder="Latitude" name='lat' id='lat' value="<?php echo $shop->lat;?>">
							      </div>
							      
							      <div class="form-group">
							      	<label><?php echo $this->lang->line('shop_lng_label')?>
							      		<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('shop_lng_tooltips')?>">
							      			<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		</a>
							      	</label><br>
							      	<input class="form-control" type="text" placeholder="Longitude" name='lng' id='lng' value="<?php echo $shop->lng;?>">
							      </div>
							      
							      <div class="form-group">
							      	<label><?php echo $this->lang->line('address_label')?>
							      		<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('shop_address_tooltips')?>">
							      			<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		</a>
							      	</label>
							      	<textarea class="form-control" name="address" placeholder="Address" rows="5"><?php echo $shop->address;?></textarea>
							      </div>
							      
							      
							      <div class="form-group">
							      	<label><?php echo $this->lang->line('shop_cover_photo_label')?>
							      		<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('shop_photo_tooltips')?>">
							      			<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		</a>
							      		
							      	</label> <br>
							      	<?php echo $this->lang->line('shop_image_recommended_size')?>
							      	<a class="btn btn-primary btn-upload pull-right" data-toggle="modal" data-target="#uploadImage">
							      		<?php echo $this->lang->line('replace_photo_button')?> 
							      	</a>
							      	<hr/>					
							      	<?php
							      		$images = $this->image->get_all_by_type($shop->id, 'shop')->result();
							      		if(count($images) > 0):
							      	?>
							      		<div class="row">
							      		<?php
							      			$i= 0;
							      			foreach ($images as $img) {
							      				if ($i>0 && $i%3==0) {
							      					echo "</div><div class='row'>";
							      				}
							      				
							      				echo '<div class="col-md-4" style="height:100"><div class="thumbnail">'.
							      					'<img src="'.base_url('uploads/thumbnail/'.$img->path).'"><br/>'.
							      					'<p class="text-center">'.
							      					'<a  data-toggle="modal" data-target="#updateDesc" class="detail-img" id="'.$img->id.'" 
							      						desc="'.$img->description.'" image="'.base_url('uploads/'.$img->path).'">Detail<a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.
							      					'<a data-toggle="modal" data-target="#deletePhoto" class="delete-img" id="'.$img->id.'"   
							      						image="'.$img->path.'">Remove</a></p>'.
							      					'</div></div>';
							      			   $i++;
							      			}
							      		?>
							      		</div>
							      	
							      	<?php
							      		endif;
							      	?>
							      </div>
							      
							   </div>
							   <div class="tab-pane fade" id="payment">
							      	<div class="form-group">
							      		<br>
							      		<label>
							      		<?php echo $this->lang->line('paypal_label')?>
							      		</label>
							      		<br>
							      		
							      		<label><?php echo $this->lang->line('paypal_option_label')?>
							      			<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('paypal_option_tooltips')?>">
							      				<span class='glyphicon glyphicon-info-sign menu-icon'>
							      			</a>
							      			<i>(<?php echo $this->lang->line('paypal_additional_message')?>)</i>
							      		</label>
							      		<input class="form-control" type="text" placeholder="Paypal Email" name='paypal_email' id='paypal_email'
							      		 value="<?php echo $shop->paypal_email;?>">
							      		 <br>
							      		 
							      		 <label><?php echo $this->lang->line('paypal_payment_type_label')?>
							      		 	<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('paypal_payment_type_tooltips')?>">
							      		 		<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		 	</a>
							      		 </label>
							      		 <input class="form-control" type="text" placeholder="Paypal Payment Type" name='paypal_payment_type' id='paypal_payment_type' value="<?php echo $shop->paypal_payment_type;?>">
							      		 <br>
							      		 
							      		 <label><?php echo $this->lang->line('paypal_environment_label')?>
							      		 	<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('paypal_environment_tooltips')?>">
							      		 		<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		 	</a>
							      		 </label>
							      		 <input class="form-control" type="text" placeholder="Paypal Environment" name='paypal_environment' id='paypal_environment' value="<?php echo $shop->paypal_environment; ?>">
							      		 <br>
							      		 
							      		 <label><?php echo $this->lang->line('paypal_appid_label')?>
							      		 	<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('paypal_appid_tooltips')?>">
							      		 		<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		 	</a>
							      		 </label>
							      		 <input class="form-control" type="text" placeholder="Paypal AppId Live" name='paypal_appid_live' id='paypal_appid_live' value="<?php echo $shop->paypal_appid_live; ?>">
							      		 <br>
							      		 
							      		 <label><?php echo $this->lang->line('paypal_merchantname_label')?>
							      		 	<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('paypal_merchantname_tooltips')?>">
							      		 		<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		 	</a>
							      		 </label>
							      		 <input class="form-control" type="text" placeholder="Paypal Merchant Name" name='paypal_merchantname' id='paypal_merchantname' value="<?php echo $shop->paypal_merchantname; ?>">
							      		 <br>
							      		 
							      		 <label><?php echo $this->lang->line('paypal_customerid_label')?>
							      		 	<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('paypal_customerid_tooltips')?>">
							      		 		<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		 	</a>
							      		 </label>
							      		 <input class="form-control" type="text" placeholder="Paypal Customer Id" name='paypal_customerid' id='paypal_customerid' value="<?php echo $shop->paypal_customerid;?>">
							      		 <br>
							      		 
							      		 <label><?php echo $this->lang->line('paypal_ipnurl_label')?>
							      		 	<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('paypal_ipnurl_toltips')?>">
							      		 		<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		 	</a>
							      		 </label>
							      		 <input class="form-control" type="text" placeholder="Paypal IpnUrl" name='paypal_ipnurl' id='paypal_ipnurl' value="<?php echo $shop->paypal_ipnurl; ?>">
							      		 <br>
							      		 
							      		 <label><?php echo $this->lang->line('paypal_memo_label')?>
							      		 	<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('paypal_memo_tooltips')?>">
							      		 		<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		 	</a>
							      		 </label>
							      		 <input class="form-control" type="text" placeholder="Paypal Memo" name='paypal_memo' id='paypal_memo' value="<?php echo $shop->paypal_memo; ?>">
							      		 <br>
							      		 
							      		<hr>
							      		
							      		<label>
							      		<?php echo $this->lang->line('bank_transfer_label')?>
							      		</label>
							      		<br>
							      		
							      		<label><?php echo $this->lang->line('bank_account_label')?>
							      			<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('bank_account_tooltips')?>">
							      				<span class='glyphicon glyphicon-info-sign menu-icon'>
							      			</a>	
							      		</label>
							      		<input class="form-control" type="text" placeholder="Bank Account" name='bank_account' id='bank_account'
							      		 value="<?php echo $shop->bank_account;?>">
							      		 <br>
							      		 
							      		<label><?php echo $this->lang->line('bank_name_label')?>
							      		 	<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('bank_name_tooltips')?>">
							      		 		<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		 	</a>
							      		</label>
							      		<input class="form-control" type="text" placeholder="Bank Name" name='bank_name' id='bank_name'
							      		value="<?php echo $shop->bank_name;?>">
							      		<br>
							      		  
							      		<label><?php echo $this->lang->line('bank_code_label')?>
							      		    <a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('bank_code_tooltips')?>">
							      		  	 	<span class='glyphicon glyphicon-info-sign menu-icon'>
							      			</a>  	
							      		</label>
							      		<input class="form-control" type="text" placeholder="Bank Code" name='bank_code' id='bank_code'
							      		value="<?php echo $shop->bank_code;?>">
							      		<br>
							      		   
							      	    <label><?php echo $this->lang->line('branch_code_label')?>
							      		  	<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('branch_code_tooltips')?>">
							      		  		<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		  	</a>
							      	    </label>
							      	    <input class="form-control" type="text" placeholder="Branch Name" name='branch_code' id='branch_code'
							      	    value="<?php echo $shop->branch_code;?>">
							      	    <br>
							      		   
							      	    <label><?php echo $this->lang->line('swift_code_label')?>
							      		   	<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('swift_code_tooltips')?>">
							      		   		<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		   	</a>
							      	    </label>
							      	    <input class="form-control" type="text" placeholder="Swift Code" name='swift_code' id='swift_code'
							      	    value="<?php echo $shop->swift_code;?>">
							      		  
							      		<hr>
							      		
							      		<label>
							      		<?php echo $this->lang->line('cod_label')?>
							      		</label>
							      		<br>
							      		<label><?php echo $this->lang->line('cod_email_label')?>
							      		   	<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('code_email_tooltips')?>">
							      		   		<span class='glyphicon glyphicon-info-sign menu-icon'>
							      		   	</a>
							      		</label>
							      		<input class="form-control" type="text" placeholder="COD Confirmation Email" name='cod_email' id='cod_email'
							      		value="<?php echo $shop->cod_email;?>">
							      		
							      	</div>
							   </div>
							   <div class="tab-pane fade" id="currency">
							     <br>
							     <div class="col-sm-6">
							     	<div class="form-group">
							     		<label><?php echo $this->lang->line('currency_symbol_label')?> 
							     			<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('currency_symbol_tooltips')?>">
							     				<span class='glyphicon glyphicon-info-sign menu-icon'>
							     			</a>
							     		</label>
							     		<input class="form-control" type="text" placeholder="Currency Symbol" name='currency_symbol' id='currency_symbol'
							     		 value="<?php echo $shop->currency_symbol;?>">
							     	</div>
							     	
							     							
							     	<div class="form-group">
							     		<label><?php echo $this->lang->line('currency_form_label')?> 
							     			<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('currency_form_tooltips')?>">
							     				<span class='glyphicon glyphicon-info-sign menu-icon'>
							     			</a>
							     		</label>
							     		<input class="form-control" type="text" placeholder="Currency Short Form" name='currency_short_form' id='currency_short_form'
							     		 value="<?php echo $shop->currency_short_form;?>">
							     	</div>
							     		
							     	
							     </div>
							   </div>
							   
							   <div class="tab-pane fade" id="sender">
							   	 <br>
							   	 <div class="col-sm-6">
							   	 	<div class="form-group">
							   			<label><?php echo $this->lang->line('sender_email_label')?> 
							   				<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('sender_email_tooltips')?>">
							   					<span class='glyphicon glyphicon-info-sign menu-icon'>
							   				</a>
							   			</label>
							   			<input class="form-control" type="text" placeholder="Sender Email" name='sender_email' id='sender_email' value="<?php echo $shop->sender_email;?>">
							   		</div>
							   	 </div>
							   </div>
							   
							   <div class="tab-pane fade" id="shipping">
							   	 <br>
							   	 <div class="col-sm-6">
							   	 	<div class="form-group">
							   			<label><?php echo $this->lang->line('shipping_rate_label')?> 
							   				<a href="#" class="tooltip-ps" data-toggle="tooltip" title="<?php echo $this->lang->line('shipping_rate_tooltips')?>">
							   					<span class='glyphicon glyphicon-info-sign menu-icon'>
							   				</a>
							   			</label>
							   			<br>
							   			( <i><?php echo $this->lang->line('shipping_rate_message'); ?></i> )
							   			<input class="form-control" type="text" placeholder="Flat rate shipping" name='flat_rate_shipping' id='flat_rate_shipping' value="<?php echo $shop->flat_rate_shipping;?>">
							   		</div>
							   	 </div>
							   </div>
							   
							</div>
							
							
						</div>
						
						
						
						<hr/>
		
		<input type="submit" value="<?php echo $this->lang->line('update_button')?>" class="btn btn-primary"/>
		<input type="submit" value="<?php echo $this->lang->line('delete_button')?>" class="btn btn-primary delete-shop" data-toggle="modal" data-target="#deleteShop"/>
		<a href="<?php echo site_url('shops');?>" class="btn btn-primary"><?php echo $this->lang->line('cancel_button')?></a>
	</form>
	
	<div class="modal fade"  id="uploadImage">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title"><?php echo $this->lang->line('replace_photo_button')?></h4>
				</div>
				<?php
				$attributes = array('id' => 'upload-form','enctype' => 'multipart/form-data');
				echo form_open(site_url("shops/upload/".$shop->id), $attributes);
				?>
					<div class="modal-body">
						<div class="form-group">
							<label><?php echo $this->lang->line('upload_photo_label')?></label>
							<input type="file" name="images1">
							<br/>
							<label><?php echo $this->lang->line('photo_desc_label')?></label>
							<textarea class="form-control" name="image_desc" rows="9"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" value="<?php echo $this->lang->line('upload_button')?>" class="btn btn-primary"/>
						<a type="button" class="btn btn-default" data-dismiss="modal"><?php echo $this->lang->line('cancel_button')?></a>
					</div>
				</form>
			</div>
		</div>
	</div>
				
	<div class="modal fade"  id="updateDesc">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title"><?php echo $this->lang->line('update_photo_desc_label')?></h4>
				</div>
				<?php
				$attributes = array('id' => 'image-form','enctype' => 'multipart/form-data');
				echo form_open('', $attributes);
				?>
					<div class="modal-body">
						<div class="form-group">
							<div class="row">
								<img class="col-sm-12 image">
							</div>
							<br/>
							<label><?php echo $this->lang->line('photo_desc_label')?></label>
							<textarea class="form-control edit_image_desc" name="image_desc" rows="9"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" value="Upload" class="btn btn-primary"/>
						<a type="button" class="btn btn-default" data-dismiss="modal">Cancel</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="modal fade"  id="deletePhoto">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title"><?php echo $this->lang->line('delete_cover_photo_label')?></h4>
				</div>
				<div class="modal-body">
					<p><?php echo $this->lang->line('delete_photo_confirm_message')?></p>
				</div>
				<div class="modal-footer">
					<a type="button" class="btn btn-default btn-delete-image">Yes</a>
					<a type="button" class="btn btn-default" data-dismiss="modal">Cancel</a>
				</div>
			</div>
		</div>			
	</div>
	
	<div class="modal fade"  id="deleteShop">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title"><?php echo $this->lang->line('delete_shop_label')?></h4>
				</div>
				<div class="modal-body">
					<p><?php echo $this->lang->line('delete_shop_confirm_message')?></p>
					<p>1. Categories</p>
					<p>2. Sub-Categories</p>
					<p>3. Items and Discounts</p>
					<p>4. Items Like, Review and Inquiry</p>
					<p>5. Shop, Feed, Followers and Transaction</p>
					<p>6. Analytics Counts</p>
					<p>7. Coupons</p>
					<p>8. Reservation</p>
				</div>
				<div class="modal-footer">
					<a type="button" class="btn btn-default btn-delete-shop">Yes</a>
					<a type="button" class="btn btn-default" data-dismiss="modal">Cancel</a>
				</div>
			</div>
		</div>			
	</div>
	
	<script>
		$(document).ready(function(){
			
			$('.btn-upload').click(function(e){
				e.preventDefault();
			});
			
			$('.detail-img').click(function(e){
				e.preventDefault();
				var id = $(this).attr('id');
				var desc = $(this).attr('desc');
				var image = $(this).attr('image');
				var action = "<?php echo site_url("shops/edit_image/".$shop->id);?>";
				$('#image-form').attr('action', action + "/" + id);
				$('#image-form .edit_image_desc').val(desc);
				$('#image-form .image').attr('src',image);
			});
			
			$('.delete-img').click(function(e){
				e.preventDefault();
				var id = $(this).attr('id');
				var image = $(this).attr('image');
				var action = '<?php echo site_url('shops/delete_image/'.$shop->id);?>/' + id + '/' + image;
				$('.btn-delete-image').attr('href', action);
			});
			
			$('.delete-shop').click(function(e){
				e.preventDefault();
				var id = $(this).attr('id');
				var image = $(this).attr('image');
				var action = '<?php echo site_url('shops/delete_shop/'.$shop->id);?>';
				$('.btn-delete-shop').attr('href', action);
			});
			
			$(document).ready(function(){
				$(function () { $("[data-toggle='tooltip']").tooltip(); });
			});	
		});
		
		
		$('#shop-form').validate({
			rules:{
				name:{
					required: true
				},
				description:{
					required : true
				},
				email: {
					required: true,
					email: true
				}
			},
			messages:{
				name:{
					required: "Please Fill Shop Name."
				},
				description:{
					required: "Please Fill Shop Description."
				},
				email: {
					email: "Email format is wrong.",
					required : "Please Fill Shop Email."
				}
			}
		});	
		
	</script>
	
	