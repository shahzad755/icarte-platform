<?php 
require_once(APPPATH.'/libraries/REST_Controller.php');

class Reservations extends REST_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->library('email',array(
       	'mailtype'  => 'html',
        	'newline'   => '\r\n'
		));
	}
		
	function add_post()
	{
		$send_user = false;
		$send_shop = false;
		
		$data = $this->post();	
		if ($data == null) {
			$this->response(array('error' => array('message' => 'invalid_json')));
		}
		
		if (!array_key_exists('resv_date', $data)) {
			$this->response(array('error' => array('message' => 'require_date')));
		}
			
		if (!array_key_exists('resv_time', $data)) {
			$this->response(array('error' => array('message' => 'require_time')));
		}
		
		if (!array_key_exists('shop_id', $data)) {
			$this->response(array('error' => array('message' => 'require_shop_id')));
		}
		
		$reservation_data = array(
			'resv_date'      => $data['resv_date'],
			'resv_time'      => $data['resv_time'],
			'note'           => $data['note'],
			'shop_id'        => $data['shop_id'],
			'user_id'        => $data['user_id'],
			'user_email'     => $data['user_email'],
			'user_phone_no'  => $data['user_phone_no'],
			'user_name'      => $data['user_name'],
			'status_id'      => 1 
		);
		
		
		$this->reservation->save($reservation_data);
		
		if($this->send_email_to_user($data['user_id'],$data['user_email'],$data['user_name'],$data['user_phone_no'],$data['shop_id'],$reservation_data['id'],$data['resv_date'],$data['resv_time'],$data['note']))
		{
			$send_user = true;
		}
		
		if($this->send_email_to_shop($data['user_id'],$data['user_email'],$data['user_name'],$data['user_phone_no'],$data['shop_id'],
		  $reservation_data['id'],$data['resv_date'],$data['resv_time'],$data['note']))
		{
			$send_shop = true;
		}
		
		if($send_user && $send_shop) {
			
			$this->response(array('success_status'=>1,'reserve_id'=>$reservation_data['id']));
			//Reservation is successfully inserted.
		} else if($send_user && !$send_shop){
			
			$this->response(array('success_status'=>2,'reserve_id'=>$reservation_data['id']));
			//Reservation is successfully submitted but email cannot send to shop.
		} else if(!$send_user && $send_shop){
			
			$this->response(array('success_status'=>3,'reserve_id'=>$reservation_data['id']));
			//Reservation is successfully submitted but email cannot send to user.
		} else if(!$send_user && !$send_shop){
			
			$this->response(array('success_status'=>4,'reserve_id'=>$reservation_data['id']));
			//Reservation is successfully submitted but email cannot send to both user and shop.
		} else {
		
			//$this->response(array('error'=>'reservation_email_error'));
			$this->response(array('success_status'=>1,'reserve_id'=>$reservation_data['id']));
		}
		
		
		
	}
	
	
	function send_email_to_user($user_id, $user_email, $user_name, $user_phone, $shop_id, $resv_id, $resv_date, $resv_time, $note) 
	{
		$shop = $this->shop->get_info($shop_id);
		$resv_info = "Please take note your reservation id is " . $resv_id . " for future inquiry to the shop.";
		
		
		$sender_email = trim($shop->sender_email);
		$sender_name  = $shop->name;
		$to = $user_email;
		$subject = 'Reservation';
		
		$html = "<p>Hi ".$user_name.",</p>".
				"<p>Your order has been sent to the restaurant for the following dish at below : </p><br/><br/>".
				"Date : " . $resv_date . " (DD/MM/YYYY)<br>".
				"Time : " . $resv_time . " (HH-MM)<br>".
				"Additional Note : " . $note . " <br>".
				$resv_info.
				"<p>Best Regards,<br/>".$sender_name."</p>";
					
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
	
	
	function send_email_to_shop($user_id, $user_email, $user_name, $user_phone, $shop_id, $resv_id, $resv_date, $resv_time, $note) 
	{
		$shop = $this->shop->get_info($shop_id);
		$resv_info = "Please take note your reservation id is " . $resv_id . " for future inquiry to the shop.";
		
		$cust_info  = "Here is customer information.<br/>";
		$cust_info .= "User Name : " . $user_name . "<br>";
		$cust_info .= "Email     : " . $user_email . "<br>";
		$cust_info .= "Phone     : " . $user_phone . "<br>";		
		
		
		$sender_email = $shop->sender_email;
		$sender_name = $shop->name;
		$to = $shop->email;
		$subject = 'Reservation';
		$html = "<p>Hi ".$shop->name.",</p>".
					"<p>You have been received the reservation at below : </p><br/><br/>".
					"Date : " . $resv_date . " (DD/MM/YYYY)<br>".
					"Time : " . $resv_time . " (HH-MM)<br>".
					"Additional Note : " . $note . " <br>".
					$resv_info. "<br/><br/>" .
					$cust_info."<br/><br/>". 
					"<p>Best Regards,<br/>".$sender_name."</p>";
					
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
	
	function get_reservation_status_by_id_get() 
	{
		$resv_id = $this->get('resv_id');
		if (!$resv_id) {
			$this->response(array('error' => array('message' => 'require_resv_id')));
		}
		
		$this->response(array('reserve_status'=>$this->reservation_status->get_info($this->reservation->get_info($resv_id)->status_id)->title));
	}
	
	
}
?>