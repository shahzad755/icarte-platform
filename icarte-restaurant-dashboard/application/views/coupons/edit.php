<?php
$this->lang->load('ps', 'english');
?>
<ul class="breadcrumb">
	<li><a href="<?php echo site_url() . "/dashboard";?>"><?php echo $this->lang->line('dashboard_label')?></a> <span class="divider"></span></li>
	<li><a href="<?php echo site_url('coupons');?>"><?php echo $this->lang->line('coupons_list_label')?></a> <span class="divider"></span></li>
	<li><?php echo $this->lang->line('update_coupon_label')?></li>
</ul>
<div class="wrapper wrapper-content animated fadeInRight">
<?php
$attributes = array('id' => 'coupon-form');
echo form_open(site_url('coupons/edit/'.$coupon->id), $attributes);
?>
	<div class="row">
		<div class="col-sm-6">
			<legend><?php echo $this->lang->line('coupon_label')?></legend>
			
			<div class="form-group">
				<label><?php echo $this->lang->line('coupon_name_label')?></label>
				<br>
				( <i><?php echo $this->lang->line('coupon_amount_message'); ?></i> )
				
				<input class="form-control" type="text" placeholder="Coupon Name" name='coupon_name' id='coupon_name' value="<?php echo $coupon->coupon_name; ?>">
			</div>
			
			<div class="form-group">
				<label><?php echo $this->lang->line('coupon_code_label')?></label>
				<br>
				( <i><?php echo $this->lang->line('coupon_code_message'); ?></i> )
				<input class="form-control" type="text" placeholder="Coupon Code" name='coupon_code' id='coupon_code' value="<?php echo $coupon->coupon_code; ?>">
			</div>
			
			<div class="form-group">
				<label><?php echo $this->lang->line('coupon_amount_label')?> &nbsp;(<?php echo $this->shop->get_current_shop()->currency_symbol; ?>)</label>
				<input class="form-control" type="text" placeholder="Coupon Discount Amount" name='coupon_amount' id='coupon_amount' value="<?php echo $coupon->coupon_amount; ?>"> 
			</div>
			
		</div>
	</div>
	
	<hr/>
	
	<button type="submit" class="btn btn-primary"><?php echo $this->lang->line('save_button')?></button>
	<a href="<?php echo site_url('coupons');?>" class="btn btn-primary"><?php echo $this->lang->line('cancel_button')?></a>
</form>
</div>
<script>
	$(document).ready(function(){
		$('#coupon-form').validate({
			rules:{
				coupon_name:{
					required: true,
					minlength: 3
				},
				coupon_code:{
					required: true,
					minlength: 3
				},
				coupon_amount:{
					required: true,
					number: true
				}
			},
			messages:{
				coupon_name:{
					required: "Please Fill Coupon Name.",
					minlength: "The length of Coupon Name must be greater than 4"
				},
				coupon_code:{
					required: "Please Fill Coupon Code.",
					minlength: "The length of Coupon Code must be greater than 4"
				},
				coupon_amount:{
					required: "Please Fill Coupon Discount Amount",
					number: "Please Fill number only"
				}
			}
		});
	});
</script>