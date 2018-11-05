<?php
class ModelCustomerManageservice extends Model {
	public function addCustomerGroup($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "customer_group SET approval = '" . (int)$data['approval'] . "', sort_order = '" . (int)$data['sort_order'] . "'");

		$customer_group_id = $this->db->getLastId();

		foreach ($data['customer_group_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_group_description SET customer_group_id = '" . (int)$customer_group_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		return $customer_group_id;
	}

	public function editManageservice($id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "storelagos SET servers = '" . $data['servers'] . "', image = '" . $data['image'] . "' WHERE id = '" . (int)$id . "'");

		// $this->db->query("DELETE FROM " . DB_PREFIX . "customer_group_description WHERE customer_group_id = '" . (int)$customer_group_id . "'");

		// foreach ($data['customer_group_description'] as $language_id => $value) {
		// 	$this->db->query("INSERT INTO " . DB_PREFIX . "customer_group_description SET customer_group_id = '" . (int)$customer_group_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
		// }
	}

	public function deleteCustomerGroup($id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "storelagos WHERE id = '" . (int)$id . "'");
		// $this->db->query("DELETE FROM " . DB_PREFIX . "customer_group_description WHERE customer_group_id = '" . (int)$customer_group_id . "'");
		// $this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE customer_group_id = '" . (int)$customer_group_id . "'");
		// $this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE customer_group_id = '" . (int)$customer_group_id . "'");
		// $this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE customer_group_id = '" . (int)$customer_group_id . "'");
		// $this->db->query("DELETE FROM " . DB_PREFIX . "tax_rate_to_customer_group WHERE customer_group_id = '" . (int)$customer_group_id . "'");
	}

	public function getCustomerGroup($id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "storelagos WHERE id = '" . (int)$id . "'");

		return $query->row;
	}

	public function getManageservices($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "storelagos r";
		$sort_data = array(
			'r.image',
			'r.servers'
		);
		// if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
		// 	$sql .= " ORDER BY " . $data['sort'];
		// } else {
		// 	$sql .= " ORDER BY r.email";
		// }

		// if (isset($data['order']) && ($data['order'] == 'DESC')) {
		// 	$sql .= " DESC";
		// } else {
		// 	$sql .= " ASC";
		// }
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

	public function getCustomerGroupDescriptions($customer_group_id) {
		$customer_group_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_group_description WHERE customer_group_id = '" . (int)$customer_group_id . "'");

		foreach ($query->rows as $result) {
			$customer_group_data[$result['language_id']] = array(
				'name'        => $result['name'],
				'description' => $result['description']
			);
		}

		return $customer_group_data;
	}

	public function getTotalManageservice() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "storelagos");

		return $query->row['total'];
	}
}
