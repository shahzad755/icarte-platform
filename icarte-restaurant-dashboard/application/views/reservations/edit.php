			<?php
			$this->lang->load('ps','english');
			?>
			<ul class="breadcrumb">
				<li><a href="<?php echo site_url() . "/dashboard";?>"><?php echo $this->lang->line('dashboard_label')?></a> <span class="divider"></span></li>
				<li><a href="<?php echo site_url('reservations');?>"><?php echo $this->lang->line('reservations_label')?></a> <span class="divider"></span></li>
				<li><?php echo $this->lang->line('update_resv_label')?></li>
			</ul>
			
			<div class="wrapper wrapper-content animated fadeInRight">
			<?php
			$attributes = array('id' => 'reserve-form');
			echo form_open(site_url('reservations/edit/'.$reservation->id), $attributes);
			?>
				
				<div class="row">
					<div class="col-sm-6">
						<legend><?php echo $this->lang->line('resv_info_lable')?></legend>
						
						<div class="form-group">
							<label><?php echo $this->lang->line('resv_date_label')?></label> <br>
							<?php echo $reservation->resv_date;?>
						</div>
						
						<div class="form-group">
							<label><?php echo $this->lang->line('resv_time_label')?></label>
							<br>
							<?php echo $reservation->resv_time;?>
						</div>
						
						
						<div class="form-group">
							<label><?php echo $this->lang->line('reserved_by')?></label> <br>
							<?php echo $reservation->user_name . "(" . $reservation->user_email . ")";?>
						</div>
						
						<div class="form-group">
							<label><?php echo $this->lang->line('resv_note')?></label> <br>
							<?php echo $reservation->note;?>
						</div>
						
						<div class="form-group">
							<label><?php echo $this->lang->line('resv_status')?></label> <br>
							<select  name="resv_status" id="resv_status">
							<?php
								
								$status = $this->reservation_status->get_all();
									foreach ($status->result() as $status) {
										echo "<option value='".$status->id."'";
										if($reservation->status_id == $status->id) {
											echo " selected ";
										}
										echo ">".$status->title."</option>";
									}
									
							?>
							</select>
						</div>
						
					</div>
				</div>
							
				
				<hr/>
				
				<button type="submit" class="btn btn-primary"><?php echo $this->lang->line('update_button')?></button>
				<a href="<?php echo site_url('reservations');?>" class="btn btn-primary"><?php echo $this->lang->line('cancel_button')?></a>
				<input type="hidden" id="resv_status_hidden" name="resv_status_hidden" value="<?php echo $reservation->status_id; ?>">
				<input type="hidden" id="resv_date_hidden" name="resv_date_hidden" value="<?php echo $reservation->resv_date; ?>">
				<input type="hidden" id="resv_time_hidden" name="resv_time_hidden" value="<?php echo $reservation->resv_time; ?>">
				<input type="hidden" id="resv_id_hidden" name="resv_id_hidden" value="<?php echo $reservation->id; ?>">
				
				<input type="hidden" id="resv_user_id_hidden" name="resv_user_id_hidden" value="<?php echo $reservation->user_id; ?>">
				<input type="hidden" id="resv_user_email_hidden" name="resv_user_email_hidden" value="<?php echo $reservation->user_email; ?>">
				<input type="hidden" id="resv_user_name_hidden" name="resv_user_name_hidden" value="<?php echo $reservation->user_name; ?>">
				<input type="hidden" id="resv_user_phone_hidden" name="resv_user_phone_hidden" value="<?php echo $reservation->user_phone_no; ?>">
				<input type="hidden" id="resv_shop_id_hidden" name="resv_shop_id_hidden" value="<?php echo $reservation->shop_id; ?>">
				<input type="hidden" id="resv_note_hidden" name="resv_note_hidden" value="<?php echo $reservation->note; ?>">
				
			</form>
			</div>
			<script>
			
				$(document).ready(function(){
					$('#reserve-form').validate({
						rules:{
							resv_date:{
								required: true
							}
						},
						messages:{
							resv_date:{
								required: "Please fill reservation date."
							}
						}
					});
					
				});
				
			</script>

