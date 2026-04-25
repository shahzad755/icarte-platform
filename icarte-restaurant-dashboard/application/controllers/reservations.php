<?php
require_once('main.php');

class Reservations extends Main
{
	function __construct()
	{
		parent::__construct('reservations');
		$this->load->library('common');
		$this->load->library('email',array(
			'mailtype'  => 'html',
			'newline'   => '\r\n'
		));
	}
	
	function index()
	{
		$shop_id = $this->get_current_shop()->id;
		$data['reservations'] = $this->reservation->get_all_by($shop_id)->result();	
		$content['content'] = $this->load->view('reservations/calendarView',$data,true);		
		$this->load_template($content);
	}
	
	function edit($reservation_id)
	{
		
		if(!$this->session->userdata('is_shop_admin')) {
			 $this->check_access('edit');
		}
		
		if ($this->input->server('REQUEST_METHOD')=='POST') {
			
			if($this->input->post('resv_status_hidden') != $this->input->post('resv_status')) { 
			
				$reserve_data = array(
					'status_id' => $this->input->post('resv_status')
				);
				
				if($this->reservation->save($reserve_data, $reservation_id)) {
					$this->session->set_flashdata('success','Reservation is successfully updated.');
						
					$this->send_email_to_user(
					$this->input->post('resv_user_id_hidden'), 
					$this->input->post('resv_user_email_hidden'),
					$this->input->post('resv_user_name_hidden'),
					$this->input->post('resv_user_phone_hidden'), 
					$this->input->post('resv_shop_id_hidden'), 
					$this->input->post('resv_id_hidden'), 
					$this->input->post('resv_date_hidden'),
					$this->input->post('resv_time_hidden'), 
					$this->input->post('resv_note_hidden'), 
					$this->reservation_status->get_info($this->input->post('resv_status'))->title);
					
					
					
				} else {
					$this->session->set_flashdata('error','Database error occured.Please contact your system administrator.');
				}
				redirect(site_url('reservations'));
				
			
			} else {
				redirect(site_url('reservations'));
			}
		}
		
		$data['reservation'] = $this->reservation->get_info($reservation_id);
		$content['content'] = $this->load->view('reservations/edit',$data,true);
		$this->load_template($content);
		
	}
	
	function send_email_to_user($user_id, $user_email, $user_name, $user_phone, $shop_id, $resv_id, $resv_date, $resv_time, $note, $resv_status_title) 
	{
		
		$shop = $this->shop->get_info($shop_id);
		$resv_info = "Please take note your reservation status has been changed to " . $resv_status_title . ". Your reservation detail infromation at below:";
		
		
		$sender_email = trim($shop->sender_email);
		$sender_name  = $shop->name;
		$sender_phone  = $shop->phone;
		$sender_address = $shop->address;
		
		$to = $user_email;
		$subject = 'Reservation';
		
		$html = "<p>Hi ".$user_name.",</p>".
				$resv_info.
				"<br><br>Date : " . $resv_date . " (DD/MM/YYYY)<br>".
				"Time : " . $resv_time . " (HH-MM)<br>".
				"Additional Note : " . $note . " <br>".
	
				
				"<br>Reserved Person Detail<br>".
				"Name : " . $user_name ."<br>".
				"Email : " . $user_email ."<br>".
				"Phone No : " . $user_phone ."<br><br>".
				
				"<p>Best Regards,<br/>"
				.$sender_name. "<br>".
				"Phone(".$sender_phone.")<br>".
				"Address(".$sender_address.")<br>".
				"</p>";
		
					
		$this->email->from($sender_email,$sender_name);
		$this->email->to($to); 
		$this->email->subject($subject);
		$this->email->message($html);	
		if($this->email->send()){
			return true;
		} else {
			return false;
		}
		
		
	}
	
	
}
?>