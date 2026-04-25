<?php
require_once('main.php');

class Coupons extends Main
{
	function __construct()
	{
		parent::__construct('coupons');
	}
	
	function index()
	{
		$this->session->unset_userdata('searchterm');
	
		$pag = $this->config->item('pagination');
		$pag['base_url'] = site_url('coupons/index');
		$pag['total_rows'] = $this->coupon->count_all($this->get_current_shop()->id);
		
		$data['coupons'] = $this->coupon->get_all(
												$this->get_current_shop()->id, $pcoupon_amountag['per_page'], 
												$this->uri->segment(3)
											);
		$data['pag'] = $pag;
		
		$content['content'] = $this->load->view('coupons/list',$data,true);		
		
		$this->load_template($content);
	}
	
	function add()
	{
		if(!$this->session->userdata('is_shop_admin')) {
		      $this->check_access('add');
		}
	
		if ($this->input->server('REQUEST_METHOD') == 'POST') {	
			$coupon_data = array(
				'coupon_name'  => $this->input->post('coupon_name'),
				'coupon_code'  => $this->input->post('coupon_code'),
				'coupon_amount'  => $this->input->post('coupon_amount'),
				'shop_id'      => $this->get_current_shop()->id,
				'is_published' => 1
			);
			
			if ($this->coupon->save($coupon_data)) {
				$this->session->set_flashdata('success','Coupon is successfully added.');
			} else {
				$this->session->set_flashdata('error','Database error occured.Please contact your system administrator.');
			}
			
			redirect(site_url('coupons'));
		}
		
		$content['content'] = $this->load->view('coupons/add',array(),true);
		$this->load_template($content);
	}
	
	function search()
	{
		$search_term = $this->searchterm_handler($this->input->post('searchterm'));
		
		$pag = $this->config->item('pagination');
		
		$pag['base_url'] = site_url('discount_types/search');
		$pag['total_rows'] = $this->discount_type->count_all_by(
												$this->get_current_shop()->id, 
												array('searchterm'=>$search_term)
									);
		
		$data['searchterm'] = $search_term;
		$data['discount_types'] = $this->discount_type->get_all_by(
											$this->get_current_shop()->id, 
											array('searchterm'=>$search_term),
											$pag['per_page'],
											$this->uri->segment(3)
										);
		$data['pag'] = $pag;
		
		$content['content'] = $this->load->view('discount_types/search',$data,true);		
		
		$this->load_template($content);	
	}
	
	function searchterm_handler($searchterm)
	{
	    if ($searchterm) {
	        $this->session->set_userdata('searchterm', $searchterm);
	        return $searchterm;
	    } elseif ($this->session->userdata('searchterm')) {
	        $searchterm = $this->session->userdata('searchterm');
	        return $searchterm;
	    } else {
	        $searchterm ="";
	        return $searchterm;
	    }
	}
	
	function edit($coupon_id = 0)
	{
		if(!$this->session->userdata('is_shop_admin')) {
		    $this->check_access('edit');
		}
	
		if ($this->input->server('REQUEST_METHOD') == 'POST') {
			
			$coupon_data = array(
				'coupon_name'  => $this->input->post('coupon_name'),
				'coupon_code'  => $this->input->post('coupon_code'),
				'coupon_amount'  => $this->input->post('coupon_amount'),
				'shop_id'      => $this->get_current_shop()->id,
				'is_published' => 1
			);	
					
			if($this->coupon->save($coupon_data, $coupon_id)) {
				$this->session->set_flashdata('success','Coupon is successfully updated.');
			} else {
				$this->session->set_flashdata('error','Database error occured.Please contact your system administrator.');
			}
			
			redirect(site_url('coupons'));
		}
		
		$data['coupon'] = $this->coupon->get_info($coupon_id);
		$content['content'] = $this->load->view('coupons/edit',$data,true);		
		$this->load_template($content);
	}
	
	function publish($id = 0)
	{
		if(!$this->session->userdata('is_shop_admin')) {
			$this->check_access('publish');
		}
		
		$coupon_data = array(
			'is_published'=> 1
		);
			
		if ($this->coupon->save($coupon_data, $id)) {
			echo 'true';
		} else {
			echo 'false';
		}
	}
	
	function unpublish($id = 0)
	{
		if(!$this->session->userdata('is_shop_admin')) {
			$this->check_access('publish');
		}
		
		$coupon_data = array(
			'is_published'=> 0
		);
			
		if ($this->coupon->save($coupon_data, $id)) {
			echo 'true';
		} else {
			echo 'false';
		}
	}
	
	
	function delete($coupon_id = 0)
	{
		if(!$this->session->userdata('is_shop_admin')) {
		     $this->check_access('delete');
		}
		
		if($this->coupon->delete($coupon_id)) {
			$this->session->set_flashdata('success','Coupon is successfully deleted.');
		} else {
			$this->session->set_flashdata('error','Database error occured.Please contact your system administrator.');
		}
		
		redirect(site_url('coupons'));
	}
	
	
}
?>