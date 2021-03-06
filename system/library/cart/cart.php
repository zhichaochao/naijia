<?php
namespace Cart;
class Cart {
	private $data = array();

	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->customer = $registry->get('customer');
		$this->session = $registry->get('session');
		$this->db = $registry->get('db');
		$this->tax = $registry->get('tax');
		$this->weight = $registry->get('weight');

		// Remove all the expired carts with no customer ID
		$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE (api_id > '0' OR customer_id = '0') AND date_added < DATE_SUB(NOW(), INTERVAL 1 HOUR)");

		if ($this->customer->getId()) {
			// We want to change the session ID on all the old items in the customers cart
			$this->db->query("UPDATE " . DB_PREFIX . "cart SET session_id = '" . $this->db->escape($this->session->getId()) . "' WHERE api_id = '0' AND customer_id = '" . (int)$this->customer->getId() . "'");

			// Once the customer is logged in we want to update the customers cart
			$cart_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cart WHERE api_id = '0' AND customer_id = '0' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");

			foreach ($cart_query->rows as $cart) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE cart_id = '" . (int)$cart['cart_id'] . "'");

				// The advantage of using $this->add is that it will check if the products already exist and increaser the quantity if necessary.
				$this->add($cart['product_id'], $cart['quantity'], $cart['product_select_id'], $cart['recurring_id']);
			}
		}
	}
	public function getCartids() {
	
		$cart_query = $this->db->query("SELECT cart_id FROM " . DB_PREFIX . "cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");
		$cart_ids=array();
		foreach ($cart_query->rows as $key => $value) {
			$cart_ids[]=$value['cart_id'];
		}
		return implode(',', $cart_ids);
		
	}

	public function getProducts($all='') {
		$product_data = array();
	

		if (!$all&&isset($this->session->data['cart_ids'])&&$this->session->data['cart_ids']) {
			  $cart_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND cart_id IN (".$this->session->data['cart_ids'].")");
			  // print_r(1);exit();
		}else{
			$cart_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' ");
		}
	

		// print_r( "SELECT * FROM " . DB_PREFIX . "cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' ");exit();

		foreach ($cart_query->rows as $cart) {
			$stock = true;

			$product_query = $this->db->query("SELECT * ,(select sum(quantity) from  " . DB_PREFIX . "product_select WHERE product_id=p.product_id )as read_quantity FROM " . DB_PREFIX . "product_to_store p2s LEFT JOIN " . DB_PREFIX . "product p ON (p2s.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND p2s.product_id = '" . (int)$cart['product_id'] . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p.status = '1'");

			if ($product_query->num_rows && ($cart['quantity'] > 0)) {
				$option_price = 0;
				$option_points = 0;
				$option_weight = 0;

				$option_data = array();
				   // $option_data[] = array(
       //                              'product_option_id'       => $product_option_id,
       //                              'product_option_value_id' => $value,
       //                              'option_id'               => $option_query->row['option_id'],
       //                              'option_value_id'         => $option_value_query->row['option_value_id'],
       //                              'name'                    => $option_query->row['name'],
       //                              'value'                   => $option_value_query->row['name'],
       //                              'type'                    => $option_query->row['type'],
       //                              'quantity'                => $option_value_query->row['quantity'],
       //                              'subtract'                => $option_value_query->row['subtract'],
       //                              'price'                   => $option_value_query->row['price'],
       //                              'price_prefix'            => $option_value_query->row['price_prefix'],
       //                              'points'                  => $option_value_query->row['points'],
       //                              'points_prefix'           => $option_value_query->row['points_prefix'],
       //                              'weight'                  => $option_value_query->row['weight'],
       //                              'weight_prefix'           => $option_value_query->row['weight_prefix']
       //                          );


				$select_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_select WHERE product_select_id ='".(int)$cart['product_select_id']."'");
				if (isset($select_query->row['product_select_id'])) {
					$price = $select_query->row['price'];
					$option_data=$select_query->row;
					$selects_query = $this->db->query("SELECT psv.*,od.name as option_value_name, d.name as option_name FROM " . DB_PREFIX . "product_select_value psv LEFT JOIN " . DB_PREFIX . "option_value_description od on(od.option_id=psv.option_id AND od.option_value_id =psv.option_value_id AND od.language_id = '" . (int)$this->config->get('config_language_id') . "' ) LEFT JOIN " . DB_PREFIX . "option_description d on(d.option_id=psv.option_id AND d.language_id = '" . (int)$this->config->get('config_language_id') . "' )  WHERE product_select_id ='".(int)$cart['product_select_id']."'");
					$option_data['selects']=$selects_query->rows;

				}else{
					$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE cart_id ='".(int)$cart['cart_id']."'");
					$price =0;
				}
				// print_r($option_data);



				

				// Product Discounts
				$discount_quantity = 0;

				foreach ($cart_query->rows as $cart_2) {
					if ($cart_2['product_id'] == $cart['product_id']) {
						$discount_quantity += $cart_2['quantity'];
					}
				}

				// $product_discount_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$cart['product_id'] . "' AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND quantity <= '" . (int)$discount_quantity . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity DESC, priority ASC, price ASC LIMIT 1");

				// if ($product_discount_query->num_rows) {
				// 	$price = $product_discount_query->row['price'];
				// }

				// Product Specials
				$product_special_query = $this->db->query("SELECT price,percent,date_end FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$cart['product_id'] . "' AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");


				if ($product_special_query->num_rows) {
					$old_price=$price;
						// print_r($price);
					if ($product_special_query->row['percent']>0) {
						$price=$price*$product_special_query->row['percent']/100;
					}else{
						$price=$price-$product_special_query->row['price'];
					}
					// $price = $product_special_query->row['price'];
					$date_end= $product_special_query->row['date_end'];
				}else{
					$date_end='';
					$old_price='';
				}
				if($cart['marking']==1){
					$price+=10000;
				}else{
					$price=$price;
				}
				// print_r($price);

				// Reward Points
				$product_reward_query = $this->db->query("SELECT points FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$cart['product_id'] . "' AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "'");

				if ($product_reward_query->num_rows) {
					$reward = $product_reward_query->row['points'];
				} else {
					$reward = 0;
				}

				// Downloads
				$download_data = array();

				$download_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_download p2d LEFT JOIN " . DB_PREFIX . "download d ON (p2d.download_id = d.download_id) LEFT JOIN " . DB_PREFIX . "download_description dd ON (d.download_id = dd.download_id) WHERE p2d.product_id = '" . (int)$cart['product_id'] . "' AND dd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

				foreach ($download_query->rows as $download) {
					$download_data[] = array(
						'download_id' => $download['download_id'],
						'name'        => $download['name'],
						'filename'    => $download['filename'],
						'mask'        => $download['mask']
					);
				}

				// Stock
				if (!$product_query->row['read_quantity'] || ($product_query->row['read_quantity'] < $cart['quantity'])) {
					$stock = false;
				}

				$recurring_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring r LEFT JOIN " . DB_PREFIX . "product_recurring pr ON (r.recurring_id = pr.recurring_id) LEFT JOIN " . DB_PREFIX . "recurring_description rd ON (r.recurring_id = rd.recurring_id) WHERE r.recurring_id = '" . (int)$cart['recurring_id'] . "' AND pr.product_id = '" . (int)$cart['product_id'] . "' AND rd.language_id = " . (int)$this->config->get('config_language_id') . " AND r.status = 1 AND pr.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "'");

				if ($recurring_query->num_rows) {
					$recurring = array(
						'recurring_id'    => $cart['recurring_id'],
						'name'            => $recurring_query->row['name'],
						'frequency'       => $recurring_query->row['frequency'],
						'price'           => $recurring_query->row['price'],
						'cycle'           => $recurring_query->row['cycle'],
						'duration'        => $recurring_query->row['duration'],
						'trial'           => $recurring_query->row['trial_status'],
						'trial_frequency' => $recurring_query->row['trial_frequency'],
						'trial_price'     => $recurring_query->row['trial_price'],
						'trial_cycle'     => $recurring_query->row['trial_cycle'],
						'trial_duration'  => $recurring_query->row['trial_duration']
					);
				} else {
					$recurring = false;
				}

				$product_data[] = array(
					'cart_id'         => $cart['cart_id'],
					'product_id'      => $product_query->row['product_id'],
					'name'            => $product_query->row['name'],
					'color'            => $product_query->row['color'],
					'model'           => $product_query->row['model'],
					'shipping'        => $product_query->row['shipping'],
					'image'           => $product_query->row['image'],
					'option'          => $option_data,
					'download'        => $download_data,
					'quantity'        => $cart['quantity'],
					'minimum'         => $product_query->row['minimum'],
					'subtract'        => $product_query->row['subtract'],
					'stock'           => $stock,
					'stock_quantity'=>$product_query->row['read_quantity'],
					'old_price'           => $old_price,
					'price'           => $price,
					'total'           => $price * $cart['quantity'],
					'reward'          => $reward * $cart['quantity'],
					'points'          => ($product_query->row['points'] ? ($product_query->row['points'] + $option_points) * $cart['quantity'] : 0),
					'tax_class_id'    => $product_query->row['tax_class_id'],
					'weight'          => ($product_query->row['weight'] + $option_weight) * $cart['quantity'],
					'weight_class_id' => $product_query->row['weight_class_id'],
					'length'          => $product_query->row['length'],
					'width'           => $product_query->row['width'],
					'height'          => $product_query->row['height'],
					'length_class_id' => $product_query->row['length_class_id'],
					'recurring'       => $recurring,
					'date_end'        =>$date_end,
                    'free_postage'    => $product_query->row['free_postage'] //是否免邮
				);
			} else {
				$this->remove($cart['cart_id']);
			}
		}
		// print_r($product_data);exit();

		return $product_data;
	}

	public function addsmark($product_id, $quantity = 1, $product_select_id = 0, $recurring_id = 0,$marking,$bynow,$numberdeails) {
		unset($this->session->data['cart_ids']);
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id = '" . (int)$product_id . "' AND recurring_id = '" . (int)$recurring_id . "' AND `product_select_id` = '" .  (int)$product_select_id . "'AND `bynow` = '" .  (int)$bynow . "'AND `marking` = '" .  (int)$marking . "'");

		if (!$query->row['total']) {
			$querys = $this->db->query("SELECT customer_id,mobile FROM " . DB_PREFIX . "record WHERE customer_id = '" . (int)$this->customer->getId() . "' AND product_id = '" . (int)$product_id . "' AND `product_select_id` = '" .  (int)$product_select_id . "'");

			if(empty($this->customer->getId())){

				$a=$this->db->query("INSERT " . DB_PREFIX . "record SET  customer_id = '" . (int)$this->customer->getId() . "', product_id = '" . (int)$product_id . "', product_select_id = '" . (int)$product_select_id . "', quantity = '" . (int)$quantity . "', mobile = '" .trim($numberdeails,'+') . "', date_added = NOW()");

			}else{
				if(empty($querys->row)){
				$a=$this->db->query("INSERT " . DB_PREFIX . "record SET  customer_id = '" . (int)$this->customer->getId() . "', product_id = '" . (int)$product_id . "', product_select_id = '" . (int)$product_select_id . "', quantity = '" . (int)$quantity . "', mobile = '" .trim($numberdeails,'+'). "', date_added = NOW()");
				$queryd = $this->db->query("SELECT telephone FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$this->customer->getId() . "'");
					if(empty($queryd->row['telephone'])){
						$bas=$this->db->query("UPDATE " . DB_PREFIX . "customer SET telephone = '" .trim($numberdeails,'+') . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");	
					}
				// print_r($queryd);exit;
				}else{
					$a=$this->db->query("UPDATE " . DB_PREFIX . "record SET quantity = (quantity + " . (int)$quantity . ") WHERE customer_id = '" . (int)$this->customer->getId() . "' AND product_id = '" . (int)$product_id . "' AND `product_select_id` = '" .  (int)$product_select_id . "'");	
				}
			}

			$this->db->query("INSERT " . DB_PREFIX . "cart SET api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "', customer_id = '" . (int)$this->customer->getId() . "', session_id = '" . $this->db->escape($this->session->getId()) . "', product_id = '" . (int)$product_id . "', recurring_id = '" . (int)$recurring_id . "', product_select_id = '" . (int)$product_select_id . "', quantity = '" . (int)$quantity . "', marking = '" . (int)$marking . "', bynow = '" . (int)$bynow . "', date_added = NOW()");
		} else {

			$a=$this->db->query("UPDATE " . DB_PREFIX . "record SET quantity = (quantity + " . (int)$quantity . ") WHERE customer_id = '" . (int)$this->customer->getId() . "' AND product_id = '" . (int)$product_id . "' AND `product_select_id` = '" .  (int)$product_select_id . "'");

			$this->db->query("UPDATE " . DB_PREFIX . "cart SET quantity = (quantity + " . (int)$quantity . ") WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id = '" . (int)$product_id . "' AND recurring_id = '" . (int)$recurring_id . "'  AND `product_select_id` = '" .  (int)$product_select_id . "'");
		}
		$cart_id = $this->db->getLastId();
		 return $cart_id ;
	}

	public function add($product_id, $quantity = 1, $product_select_id = 0, $recurring_id = 0) {
		unset($this->session->data['cart_ids']);
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id = '" . (int)$product_id . "' AND recurring_id = '" . (int)$recurring_id . "' AND `product_select_id` = '" .  (int)$product_select_id . "'");

		if (!$query->row['total']) {
			$this->db->query("INSERT " . DB_PREFIX . "cart SET api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "', customer_id = '" . (int)$this->customer->getId() . "', session_id = '" . $this->db->escape($this->session->getId()) . "', product_id = '" . (int)$product_id . "', recurring_id = '" . (int)$recurring_id . "', product_select_id = '" . (int)$product_select_id . "', quantity = '" . (int)$quantity . "', date_added = NOW()");
		} else {
			$this->db->query("UPDATE " . DB_PREFIX . "cart SET quantity = (quantity + " . (int)$quantity . ") WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id = '" . (int)$product_id . "' AND recurring_id = '" . (int)$recurring_id . "'  AND `product_select_id` = '" .  (int)$product_select_id . "'");
		}
	}

	public function update($cart_id, $quantity) {
		$this->db->query("UPDATE " . DB_PREFIX . "cart SET quantity = '" . (int)$quantity . "' WHERE cart_id = '" . (int)$cart_id . "' AND api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");
	}

	public function remove($cart_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE cart_id = '" . (int)$cart_id . "' AND api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");
	}

	public function clear() {

		if (isset($this->session->data['cart_ids'])&&$this->session->data['cart_ids']) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND cart_id in(" . $this->session->data['cart_ids']. ")");
		}else{
			$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");
		}
	}


	public function getRecurringProducts() {
		$product_data = array();

		foreach ($this->getProducts() as $value) {
			if ($value['recurring']) {
				$product_data[] = $value;
			}
		}

		return $product_data;
	}

	public function getWeight() {
		$weight = 0;

		foreach ($this->getProducts() as $product) {
			// print_r($product);exit;
			if(!$product['free_postage']){
				
			if ($product['shipping']) {
				$weight += $this->weight->convert($product['weight'], $product['weight_class_id'], $this->config->get('config_weight_class_id'));
			}
			// print_r(11);
			}
		}
		// print_r(22);exit;

		return $weight;
	}

	public function getSubTotal() {
		$total = 0;

		foreach ($this->getProducts() as $product) {
			$total += $product['total'];
		}

		return $total;
	}

	public function getTaxes() {
		$tax_data = array();

		foreach ($this->getProducts() as $product) {
			if ($product['tax_class_id']) {
				$tax_rates = $this->tax->getRates($product['price'], $product['tax_class_id']);

				foreach ($tax_rates as $tax_rate) {
					if (!isset($tax_data[$tax_rate['tax_rate_id']])) {
						$tax_data[$tax_rate['tax_rate_id']] = ($tax_rate['amount'] * $product['quantity']);
					} else {
						$tax_data[$tax_rate['tax_rate_id']] += ($tax_rate['amount'] * $product['quantity']);
					}
				}
			}
		}

		return $tax_data;
	}

	public function getTotal() {
		$total = 0;

		foreach ($this->getProducts() as $product) {
			$total += $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'];
		}

		return $total;
	}

	public function countProducts() {
		$product_total = 0;

		$products = $this->getProducts();

		foreach ($products as $product) {
			$product_total += $product['quantity'];
		}

		return $product_total;
	}

	public function hasProducts() {
		return count($this->getProducts());
	}

	public function hasRecurringProducts() {
		return count($this->getRecurringProducts());
	}

	public function hasStock($all='') {
		foreach ($this->getProducts($all) as $product) {
			if (!$product['stock']) {
				return false;
			}
		}

		return true;
	}

	public function hasShipping() {
		foreach ($this->getProducts() as $product) {
			if(!$product['free_postage']){
			if ($product['shipping']) {
				return true;
			}
		}
	}

		return false;
	}

	public function hasDownload() {
		foreach ($this->getProducts() as $product) {
			if ($product['download']) {
				return true;
			}
		}

		return false;
	}
}
