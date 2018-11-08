<?php
class ModelExtensionExtension extends Model {
	function getExtensions($type) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "extension WHERE `type` = '" . $this->db->escape($type) . "'");

		return $query->rows;
	}
	function getSearch($ip) {
		// print_r("SELECT * FROM " . DB_PREFIX . "keywords k WHERE customer_id = '" . (int)$this->customer->getId() . "'AND ip = '" .$ip. "'ORDER BY k.id DESC ");exit;
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "keywords k WHERE customer_id = '" . (int)$this->customer->getId() . "'AND ip = '" .$ip. "'ORDER BY k.id DESC LIMIT 6");
// print_r($query);exit;
		return $query->rows;
	}
	public function deleteSearch($id,$ip) {
		$query=$this->db->query("DELETE FROM `" . DB_PREFIX . "keywords` WHERE customer_id = '" . $id. "' AND ip = '" .$ip. "'");	
		return $query;
	}
	function getHotsearch() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "keywords k ORDER BY k.count DESC  LIMIT 6");
// print_r($query);exit;
		return $query->rows;
	}
}