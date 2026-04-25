<?php 
require_once(APPPATH.'/libraries/REST_Controller.php');

class Coupons extends REST_Controller
{
	function __construct()
	{
		parent::__construct();	
	}
	
	function search_post()
	{
		$data = $this->post();
		
		if ($data == null) {
			$this->response(array('error' => array('message' => 'invalid_json')));
		}
			
		if (!array_key_exists('shop_id', $data)) {
			$this->response(array('error' => array('message' => 'require_shop_id')));
		}
		
		if (!array_key_exists('coupon_code', $data)) {
			$this->response(array('error' => array('message' => 'require_coupon_code')));
		}
		
		if ($coupon = $this->coupon->search_by_code($data['shop_id'],$data['coupon_code'])) {
			$this->response($coupon);
		} else {
			$this->response(array('error' => array('message' => 'Your coupon is not in the system.')));
		}
	}
	
	
}
?>