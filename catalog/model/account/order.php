<?php
class ModelAccountOrder extends Model {
	public function getOrder($order_id) {
		$order_query = $this->db->query("SELECT *,NOW() as now FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$order_id . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND order_status_id > '0'");

		if ($order_query->num_rows) {
			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$order_query->row['payment_country_id'] . "'");

			if ($country_query->num_rows) {
				$payment_iso_code_2 = $country_query->row['iso_code_2'];
				$payment_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$payment_iso_code_2 = '';
				$payment_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$order_query->row['payment_zone_id'] . "'");

			if ($zone_query->num_rows) {
				$payment_zone_code = $zone_query->row['code'];
			} else {
				$payment_zone_code = '';
			}

			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$order_query->row['shipping_country_id'] . "'");

			if ($country_query->num_rows) {
				$shipping_iso_code_2 = $country_query->row['iso_code_2'];
				$shipping_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$shipping_iso_code_2 = '';
				$shipping_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$order_query->row['shipping_zone_id'] . "'");

			if ($zone_query->num_rows) {
				$shipping_zone_code = $zone_query->row['code'];
			} else {
				$shipping_zone_code = '';
			}

			return array(
				'now'                => $order_query->row['now'],
				'order_id'                => $order_query->row['order_id'],
				'invoice_no'              => $order_query->row['invoice_no'],
				'invoice_prefix'          => $order_query->row['invoice_prefix'],
				'store_id'                => $order_query->row['store_id'],
				'store_name'              => $order_query->row['store_name'],
				'store_url'               => $order_query->row['store_url'],
				'customer_id'             => $order_query->row['customer_id'],
				'firstname'               => $order_query->row['firstname'],
				'lastname'                => $order_query->row['lastname'],
				'telephone'               => $order_query->row['telephone'],
				'fax'                     => $order_query->row['fax'],
				'email'                   => $order_query->row['email'],
				'payment_firstname'       => $order_query->row['payment_firstname'],
				'payment_lastname'        => $order_query->row['payment_lastname'],
				'payment_company'         => $order_query->row['payment_company'],
				'payment_address_1'       => $order_query->row['payment_address_1'],
				'payment_address_2'       => $order_query->row['payment_address_2'],
				'payment_postcode'        => $order_query->row['payment_postcode'],
				'payment_city'            => $order_query->row['payment_city'],
				'payment_zone_id'         => $order_query->row['payment_zone_id'],
				'payment_zone'            => $order_query->row['payment_zone'],
				'payment_zone_code'       => $payment_zone_code,
				'payment_country_id'      => $order_query->row['payment_country_id'],
				'payment_country'         => $order_query->row['payment_country'],
				'payment_iso_code_2'      => $payment_iso_code_2,
				'payment_iso_code_3'      => $payment_iso_code_3,
				'payment_address_format'  => $order_query->row['payment_address_format'],
				'payment_method'          => $order_query->row['payment_method'],
				'payment_code'            => $order_query->row['payment_code'],
				'shipping_firstname'      => $order_query->row['shipping_firstname'],
				'shipping_lastname'       => $order_query->row['shipping_lastname'],
				'shipping_company'        => $order_query->row['shipping_company'],
				'shipping_address_1'      => $order_query->row['shipping_address_1'],
				'shipping_address_2'      => $order_query->row['shipping_address_2'],
				'shipping_postcode'       => $order_query->row['shipping_postcode'],
				'shipping_city'           => $order_query->row['shipping_city'],
				'shipping_zone_id'        => $order_query->row['shipping_zone_id'],
				'shipping_zone'           => $order_query->row['shipping_zone'],
				'shipping_zone_code'      => $shipping_zone_code,
				'shipping_country_id'     => $order_query->row['shipping_country_id'],
				'shipping_country'        => $order_query->row['shipping_country'],
				'shipping_iso_code_2'     => $shipping_iso_code_2,
				'shipping_iso_code_3'     => $shipping_iso_code_3,
				'shipping_address_format' => $order_query->row['shipping_address_format'],
				'shipping_method'         => $order_query->row['shipping_method'],
				'comment'                 => $order_query->row['comment'],
				'total'                   => $order_query->row['total'],
				'order_status_id'         => $order_query->row['order_status_id'],
				'language_id'             => $order_query->row['language_id'],
				'currency_id'             => $order_query->row['currency_id'],
				'currency_code'           => $order_query->row['currency_code'],
				'currency_value'          => $order_query->row['currency_value'],
				'date_modified'           => $order_query->row['date_modified'],
				'date_added'              => $order_query->row['date_added'],
				'delivered_date'              => $order_query->row['delivered_date'],
				'confirm_date'              => $order_query->row['confirm_date'],
				'order_number'                => $order_query->row['order_number'], 
				'shippingorpick'                => $order_query->row['shippingorpick'], 
				'ip'                      => $order_query->row['ip'],
				'bank_receipt'            => $order_query->row['bank_receipt']
			);
		} else {
			return false;
		}
	}


	public function getOrders($start = 0, $limit = 30,$status) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 1;
		}
			if($status==16){
				$query = $this->db->query("SELECT NOW() as now,o.order_id,o.order_number, o.firstname, o.lastname, os.name as status, o.date_added,o.date_modified,o.bank_receipt, o.payment_code, o.total, o.currency_code, o.currency_value FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_status os ON (o.order_status_id = os.order_status_id) WHERE o.order_status_id ='" . (int)$status . "'  AND  o.customer_id = '" . (int)$this->customer->getId() . "' AND o.order_status_id > '0' AND o.del = '0'AND o.store_id = '" . (int)$this->config->get('config_store_id') . "' AND os.language_id = '" . (int)$this->config->get('config_language_id') . "' OR o.order_status_id ='7' AND  o.customer_id = '" . (int)$this->customer->getId() . "'  ORDER BY o.order_id DESC  ");
			}else{
				$query = $this->db->query("SELECT NOW() as now,o.order_id,o.order_number, o.firstname, o.lastname, os.name as status, o.date_added,o.date_modified,o.bank_receipt, o.payment_code, o.total, o.currency_code, o.currency_value FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_status os ON (o.order_status_id = os.order_status_id) WHERE o.order_status_id ='" . (int)$status . "' AND  o.customer_id = '" . (int)$this->customer->getId() . "' AND o.order_status_id > '0' AND o.del = '0'AND o.store_id = '" . (int)$this->config->get('config_store_id') . "' AND os.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY o.order_id DESC  ");
			}
		

		return $query->rows;
	}
	public function getOrderstotal($start = 0, $limit = 30,$status) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 1;
		}
			if($status==16){
				$query = $this->db->query("SELECT NOW() as now,o.order_id,o.order_number, o.firstname, o.lastname, os.name as status, o.date_added,o.date_modified,o.bank_receipt, o.payment_code, o.total, o.currency_code, o.currency_value FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_status os ON (o.order_status_id = os.order_status_id) WHERE o.order_status_id ='" . (int)$status . "'  AND  o.customer_id = '" . (int)$this->customer->getId() . "' AND o.order_status_id > '0' AND o.del = '0'AND o.store_id = '" . (int)$this->config->get('config_store_id') . "' AND os.language_id = '" . (int)$this->config->get('config_language_id') . "' OR o.order_status_id ='7' AND  o.customer_id = '" . (int)$this->customer->getId() . "'  ORDER BY o.order_id DESC  ");
			}else{
				$query = $this->db->query("SELECT NOW() as now,o.order_id,o.order_number, o.firstname, o.lastname, os.name as status, o.date_added,o.date_modified,o.bank_receipt, o.payment_code, o.total, o.currency_code, o.currency_value FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_status os ON (o.order_status_id = os.order_status_id) WHERE o.order_status_id ='" . (int)$status . "' AND  o.customer_id = '" . (int)$this->customer->getId() . "' AND o.order_status_id > '0' AND o.del = '0'AND o.store_id = '" . (int)$this->config->get('config_store_id') . "' AND os.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY o.order_id DESC  ");
			}
		

		return $query->num_rows;
	}
	public function deleteWishlist($order_id) {
		$this->db->query("UPDATE " . DB_PREFIX ."order SET del = '1' WHERE customer_id = '" . (int)$this->customer->getId() . "' AND order_id = '" . (int)$order_id . "'");		
	}
//恢复订单
	public function recoverorder($order_id) {
		$this->db->query("UPDATE " . DB_PREFIX ."order SET order_status_id = '1',date_modified = NOW(),bank_receipt = '' WHERE customer_id = '" . (int)$this->customer->getId() . "' AND order_id = '" . (int)$order_id . "'");		
	}
	//确认收货
	public function confirmorder($order_id) {
		$this->db->query("UPDATE " . DB_PREFIX ."order SET order_status_id = '5',confirm_date = NOW() WHERE customer_id = '" . (int)$this->customer->getId() . "' AND order_id = '" . (int)$order_id . "'");		
	}
	//取消订单
	public function lnvalidorder($order_id) {
		$this->db->query("UPDATE " . DB_PREFIX ."order SET order_status_id = '16' WHERE customer_id = '" . (int)$this->customer->getId() . "' AND order_id = '" . (int)$order_id . "'");		
	}
	public function changeStatus($order_id,$order_status_id){
	    $sql = "update `".DB_PREFIX."order` set order_status_id = '".$order_status_id."' where order_id = '".$order_id."'";
	    $query = $this->db->query($sql);
	    $this->db->query("INSERT INTO " . DB_PREFIX . "order_history SET order_id = '" . (int)$order_id . "', order_status_id = '" . (int)$order_status_id . "', notify = '0', comment = 'customer cancel', date_added = NOW()");

        //根据订单ID,把
        //该订单对应的产品数量加回去
	    /*$product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");
		foreach($product_query->rows as $product) {
			$this->db->query("UPDATE `" . DB_PREFIX . "product` SET quantity = (quantity + " . (int)$product['quantity'] . ") WHERE product_id = '" . (int)$product['product_id'] . "' AND subtract = '1'");

			$option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$product['order_product_id'] . "'");
			foreach ($option_query->rows as $option) {
				$this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET quantity = (quantity + " . (int)$product['quantity'] . ") WHERE product_option_value_id = '" . (int)$option['product_option_value_id'] . "' AND subtract = '1'");
			}
		}*/
	}

	public function getOrderProduct($order_id, $order_product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$order_product_id . "'");

		return $query->row;
	}

	public function getOrderProducts($order_id) {
		// $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");
		$query = $this->db->query("SELECT op.*,p.image FROM " . DB_PREFIX . "order_product as op LEFT JOIN " . DB_PREFIX . "product as p on p.product_id=op.product_id WHERE order_id = '" . (int)$order_id . "'");

		return $query->rows;
	}

	public function getOrderOptions($order_id, $order_product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_select WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$order_product_id . "'");

		return $query->rows;
	}

	public function getOrderVouchers($order_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_voucher` WHERE order_id = '" . (int)$order_id . "'");

		return $query->rows;
	}

	public function getOrderTotals($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order");

		return $query->rows;
	}

	public function getOrderHistories($order_id) {
		$query = $this->db->query("SELECT date_added, os.name AS status, oh.comment, oh.notify FROM " . DB_PREFIX . "order_history oh LEFT JOIN " . DB_PREFIX . "order_status os ON oh.order_status_id = os.order_status_id WHERE oh.order_id = '" . (int)$order_id . "' AND os.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY oh.date_added");

		return $query->rows;
	}

	public function getTotalOrders() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` o WHERE customer_id = '" . (int)$this->customer->getId() . "' AND o.order_status_id > '0' AND o.store_id = '" . (int)$this->config->get('config_store_id') . "'");

		return $query->row['total'];
	}

	public function getTotalOrderProductsByOrderId($order_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");

		return $query->row['total'];
	}

	public function getTotalOrderVouchersByOrderId($order_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order_voucher` WHERE order_id = '" . (int)$order_id . "'");

		return $query->row['total'];
	}
	public function getOrderProductNumber($order_id){
		$query = $this->db->query("SELECT SUM(quantity) qty FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");

		return $query->row['qty'];
	}

	public function getOrderStatus($order_status_id,$language_id){

	$order_status_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int)$order_status_id . "' AND language_id = '" . (int)$language_id . "'");
	return $order_status_query->row['name'];
}
}