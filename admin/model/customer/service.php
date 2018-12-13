<?php
class ModelCustomerService extends Model {

	public function deleteService($store_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "bespoke WHERE store_id = '" . (int)$store_id . "'");

		$this->cache->delete('product');
	}

	public function getService($store_id) {
		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "bespoke r  WHERE r.store_id = '" . (int)$store_id . "'");

		return $query->row;
	}

	public function getServices($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "bespoke r";
		$sort_data = array(
			'r.store_id',
			'r.email',
			'r.telephone',
			'r.subtime'
		);
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY r.email";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalServicesAwaitingApproval() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "bespoke");

		return $query->row['total'];
	}
	public function updServices($store_id) {
		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "bespoke r  WHERE r.store_id = '" . (int)$store_id . "'");
		if($query->row['status']==1){
			$querys = $this->db->query("UPDATE " . DB_PREFIX . "bespoke SET status = 0 WHERE store_id = '" . (int)$store_id . "'");
		}else{
			$querys = $this->db->query("UPDATE " . DB_PREFIX . "bespoke SET status = 1 WHERE store_id = '" . (int)$store_id . "'");	
		}
		return $querys;
	}



}