<?php
require_once('main.php');
class Shops extends Main
{
	function __construct()
	{
		parent::__construct('shops');
		$this->load->library('uploader');
	}
	
	function index() 
	{
		$this->session->unset_userdata('shop_id');
	
		$shops = array();
		if ($this->input->server('REQUEST_METHOD')=='POST') {
			$searchterm = $this->input->post('searchterm');
			$shops = $this->shop->get_all_by(array('searchterm' => $searchterm))->result();
			$data['searchterm'] = $searchterm;
		} else {
			$shops = $this->shop->get_all()->result();
		}
		
		$temp_shops_arr = array();
		foreach ($shops as $shop) {
			$img = $this->image->get_all_by_type($shop->id, 'shop')->result();
			$shop->image = $img[0]->path;
			$temp_shops_arr[] = $shop;
		}
		$data['shops'] = $temp_shops_arr;
	
		$this->load->view('shops/list', $data);
	}
	
	function create()
	{
		if(!$this->session->userdata('is_shop_admin')) {
		      $this->check_access('add');
		}
		if ($this->input->server('REQUEST_METHOD')=='POST') {			
			$upload_data = $this->uploader->upload($_FILES);
			
			if (!isset($upload_data['error'])) {
				$shop_data = $this->input->post();
				
				$img_desc = $shop_data['image_desc'];
				unset($shop_data['image_desc']);
				unset($shop_data['images']);
				
				if ($this->shop->save($shop_data)) {
					foreach ($upload_data as $upload) {
						$image = array(
							'parent_id'=>$shop_data['id'],
							'type' => 'shop',
							'description' => $img_desc,
							'path' => $upload['file_name'],
							'width'=>$upload['image_width'],
							'height'=>$upload['image_height']
						);
						$this->image->save($image);
					}
								
					$this->session->set_flashdata('success','Shop is successfully added.');
				} else {
					$this->session->set_flashdata('error','Database error occured.Please contact your system administrator.');
				}
				redirect(site_url('shops/create'));
			} else {
				$data['error'] = $upload_data['error'];
			}
		}
		
		$content['content'] = $this->load->view('shops/create',array(),true);
		$this->load_template($content,false);
		
	}
	
	function edit($shop_id = 0)
	{
		if(!$this->session->userdata('is_shop_admin')) {
			$this->check_access('edit');
		}
		
		$this->session->set_userdata('shop_id', $shop_id);
		$this->session->set_userdata('action', 'shop_edit');
		
		if ($this->input->server('REQUEST_METHOD')=='POST') {
			if ($this->input->post('status')!= 1) {
				$_POST['status'] = 0;
			}
			
			$shop_data = $this->input->post();
			
			if ($this->shop->save($shop_data, $shop_id)) {
				$this->session->set_flashdata('success','Shop Information is successfully updated.');
			} else {
				$this->session->set_flashdata('error','Database error occured.Please contact your system administrator.');
			}
			redirect(site_url('shops/edit/' . $shop_id));
		}
		
		$data['shop'] = $this->shop->get_info($shop_id);
		
		$content['content'] = $this->load->view('shops/edit',$data,true);
		$this->load_template($content,false,true);
	}
	
	function upload($shop_id=0)
	{
		if(!$this->session->userdata('is_shop_admin')) {
		    $this->check_access('edit');
		}
		
		$upload_data = $this->uploader->upload($_FILES);
		
		if (!isset($upload_data['error'])) {
			unlink('./uploads/'.$this->image->get_info_parent_type($shop_id,'shop')->path);
			unlink('./uploads/thumbnail/'.$this->image->get_info_parent_type($shop_id,'shop')->path);
			$this->image->delete_by_parent($shop_id,'shop');
			
			foreach ($upload_data as $upload) {
				$image = array(
					'parent_id'=> $shop_id,
					'type' => 'shop',
					'description' => $this->input->post('image_desc'),
					'path' => $upload['file_name'],
					'width'=>$upload['image_width'],
					'height'=>$upload['image_height']
				);
				$this->image->save($image);
				redirect(site_url('shops/edit/' . $shop_id));
			}
			
		} else {
			$data['error'] = $upload_data['error'];
		}
		
		$data['shop'] = $this->shop->get_info($shop_id);
		
		$content['content'] = $this->load->view('shops/edit',$data,true);
		$this->load_template($content);
	}
	
	
	function edit_image($shop_id, $image_id)
	{
		if(!$this->session->userdata('is_shop_admin')) {
		    $this->check_access('edit');
		}
		
		$image = array(
			'description' => $this->input->post('image_desc')
		);
			
		if ($this->image->save($image, $image_id)) {
			$this->session->set_flashdata('success','Shop cover photo description is successfully updated.');
		} else {
			$this->session->set_flashdata('error','Database error occured.Please contact your system administrator.');
		}
		redirect(site_url('shops/edit/' . $shop_id));
	}

	function delete_image($shop_id,$image_id,$image_name)
	{
		if(!$this->session->userdata('is_shop_admin')) {
		    $this->check_access('edit');
		}
		
		if ($this->image->delete($image_id)) {
			unlink('./uploads/'.$image_name);
			unlink('./uploads/thumbnail/'.$image_name);
			$this->session->set_flashdata('success','Shop cover photo is successfully deleted.');
		} else {
			$this->session->set_flashdata('error','Database error occured.Please contact your system administrator.');
		}
		redirect(site_url('shops/edit/' . $shop_id));
	}	
	
	
	function delete_shop($shop_id)
	{
		if(!$this->session->userdata('is_shop_admin')) {
		     $this->check_access('delete');
		}
		
		$shop_images = $this->image->get_item_images_by_shop(2);
		foreach($shop_images->result() as $img):	
			if ($this->image->delete($img->id)) {
				unlink('./uploads/'.$img->path);		
			}	
		endforeach;
		
		
		$this->category->delete_by_shop($shop_id);
		$this->discount_type->delete_by_shop($shop_id);
		$this->favourite->delete_by_shop($shop_id);
		$this->feed->delete_by_shop($shop_id);
		
		
		$this->image->delete_shop_image_by_parent($shop_id); //still need to delete physical images
		
		
		$this->like->delete_by_shop($shop_id);
		$this->review->delete_by_shop($shop_id);
		$this->shop->delete_by_shop($shop_id);
		$this->follow->delete_by_shop($shop_id);
		$this->sub_category->delete_by_shop($shop_id);
		$this->touch->delete_by_shop($shop_id);
		$this->transaction_detail->delete_by_shop($shop_id);
		$this->transaction_header->delete_by_shop($shop_id);
		
		$this->item->delete_by_shop($shop_id);
		$this->attribute_header->delete_by_shop($shop_id);
		$this->attribute_detail->delete_by_shop($shop_id);
		$this->coupon->delete_by_shop($shop_id);
		
		$this->reservation->delete_by_shop($shop_id);
		
		$this->contact->delete_by_shop($shop_id);
		$this->inquiry->delete_by_shop($shop_id);
		$this->rating->delete_by_shop($shop_id);
		$this->user->delete_by_shop($shop_id);
		
		$this->session->set_flashdata('success','Shop is successfully deleted.');
		redirect(site_url('shops'));
		
		
	}	
	
}
?>