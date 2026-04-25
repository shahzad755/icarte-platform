			<?php
			$this->lang->load('ps', 'english');
			?>
			<ul class="breadcrumb">
				<li><a href="<?php echo site_url() . "/dashboard";?>"><?php echo $this->lang->line('dashboard_label')?></a> <span class="divider"></span></li>
				<li><a href="<?php echo site_url('discount_types');?>"><?php echo $this->lang->line('discount_types_list_label')?></a> <span class="divider"></span></li>
				<li><?php echo $this->lang->line('update_discount_type_label')?></li>
			</ul>
			<div class="wrapper wrapper-content animated fadeInRight">
			<?php
			$attributes = array('id' => 'discount_type-form');
			echo form_open(site_url('discount_types/edit/'.$discount_type->id), $attributes);
			?>
				<div class="row">
					<div class="col-sm-6">
						<legend><?php echo $this->lang->line('discount_type_info_label')?></legend>
						
						<div class="form-group">
							<label><?php echo $this->lang->line('discount_types_name_label')?></label>
							<input class="form-control" type="text" placeholder="Discount Type Name" name='name' id='name' value='<?php echo $discount_type->name;?>'>
						</div>
						
						<div class="form-group">
							<label><?php echo $this->lang->line('discount_percent_label')?></label>
							<input class="form-control" type="text" placeholder="Percent" name='percent' id='percent'
								value='<?php echo $discount_type->percent;?>'>
						</div>
						
						<div class="form-group">
							<label> <?php echo $this->lang->line('choose_item_label')?> </label>
							<div  style="max-height: 30%; overflow-y:  scroll;">
								<?php
									$shop_id = $this->shop->get_current_shop()->id;
									$items = $this->item->get_all($shop_id);
									foreach ($items->result() as $item) {
								?>
										<div class="checkbox">
										  <label>
										    <input type="checkbox" name="items[]" value="<?php echo $item->id;?>"
										    <?php echo ($discount_type->id == $item->discount_type_id)? "checked": ""; ?>>
										    <?php echo $item->name;?>
										  </label>
										</div>
								<?php
									}
								?>
							</div>
						</div>
					</div>
				</div>
				
				<hr/>
				
				<button type="submit" class="btn btn-primary"><?php echo $this->lang->line('save_button')?></button>
				<a href="<?php echo site_url('discount_types');?>" class="btn btn-primary"><?php echo $this->lang->line('cancel_button')?></a>
			</form>
			</div>
			<script>
				$(document).ready(function(){
					$('#discount_type-form').validate({
						rules:{
							name:{
								required: true,
								minlength: 4,
								remote: '<?php echo site_url('discount_types/exists/'.$discount_type->id);?>'
							},
							percent:{
								required: true,
								number: true
							}
						},
						messages:{
							name:{
								required: "Please fill Discount Type Name.",
								minlength: "The length of Discount Type Name must be greater than 4",
								remote: "Discount Type Name is already existed in the system"
							},
							percent:{
								required: true,
								number: true
							}
						}
					});
				});
			</script>