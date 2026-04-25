<?php
class Reservation extends Base_Model
{
	protected $table_name;

	function __construct()
	{
		parent::__construct();
		$this->table_name = 'rt_reservation';
	}
	
	function exists($data)
	{
		$this->db->from($this->table_name);
		
		if (isset($data['id'])) {
			$this->db->where('id',$data['id']);
		}
		
		$query = $this->db->get();
		return ($query->num_rows()==1);
	}
	
	function save(&$data, $id=false)
	{
		//if there is no data with this id, create new
		if (!$id && !$this->exists(array('id'=>$id))) {
			if ($this->db->insert($this->table_name,$data)) {
				$data['id'] = $this->db->insert_id();
				return true;
			}
		} else {
			//else update the data
			$this->db->where('id',$id);
			return $this->db->update($this->table_name,$data);
		}
		
		return $false;
	}
	
	function get_all_by($shop_id)
	{
		$this->db->from($this->table_name);
		$this->db->where('shop_id', $shop_id);
		$this->db->order_by('id', 'desc');
		return $this->db->get();
	}
	
	
	function get_info($id)
	{
		$query = $this->db->get_where($this->table_name, array('id'=>$id));
		
		if ($query->num_rows() == 1) {
			return $query->row();
		} else {
			return $this->get_empty_object($this->table_name);
		}
	}
	
	function delete_by_shop($shop_id)
	{
		$this->db->where('shop_id', $shop_id);
		return $this->db->delete($this->table_name);
	}
	
	function count_all($shop_id)
	{
		$this->db->from($this->table_name);
		$this->db->where('shop_id', $shop_id);
		return $this->db->count_all_results();
	}
	
}
?>