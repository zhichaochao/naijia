<?php

/**
 * 联系我们控制器
 * @author  dyl  783973660@qq.com  2016.9.26
 */
class ModelSettingFeedback extends Model {

	public function addFeedback($data = array()) {
        $sql = "insert into " . DB_PREFIX . "feedback SET
        		name = '" . $this->db->escape($data['user_name']) . "',
                email = '" . $this->db->escape($data['email']) . "',
                phone = '" . $this->db->escape($data['telephone']) . "',
                comment = '" . $this->db->escape($data['enquiry']) . "',
                submitTime = NOW()";

		$result = $this->db->query($sql);

		return $result;
	}


	/**
	 * 根据用户的ID获取用户的相关信息
	 * @author  dyl  783973660@qq.com  2016.10.13
	 * @param   Int  $customerId  用户ID
	 */
	public function getCustomerData($customerId){

		$sql = "select a.country_id from " . DB_PREFIX . "customer c
				left join " . DB_PREFIX . "address a on c.address_id = a.address_id
			    where c.customer_id = ".(int)$customerId ." limit 1";

		$result = $this->db->query($sql);

		return $result->row;

	}

	public function addStore($data = array()) {
		// print_r($data);exit;
        $sql = "insert into " . DB_PREFIX . "bespoke SET
                telephone = '" . $this->db->escape($data['phone']) . "',
                email = '" . $this->db->escape($data['email']) . "',
                url = '" . $this->db->escape($data['url']) . "',
                time = '" . $this->db->escape($data['time']) . "',
                enquiry = '" . $this->db->escape($data['enquiry']) . "',
                content = '" . $this->db->escape($data['content']) . "'";

		$result = $this->db->query($sql);

		return $result;
	}

}