<?php
class ModelCatalogReview extends Model {
	public function addReview($product_id, $data,$path, $firstname) {
		// print_r($path);exit;
		// if(empty($path){
			$this->db->query("INSERT INTO " . DB_PREFIX . "review SET author = '" . $firstname . "', customer_id = '" . (int)$this->customer->getId() . "', product_id = '" . (int)$product_id . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "', date_added = NOW()");
			$review_id = $this->db->getLastId();

			if(!empty($path)){
				foreach($path as $key => $paths) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "review_image SET review_id = '" . (int)$review_id . "', images = '" .$paths. "'");	
				}
			}

		


		

		// if (in_array('review', (array)$this->config->get('config_mail_alert'))) {
		// 	$this->load->language('mail/review');
		// 	$this->load->model('catalog/product');
			
		// 	$product_info = $this->model_catalog_product->getProduct($product_id);

		// 	$subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

		// 	$message  = $this->language->get('text_waiting') . "\n";
		// 	$message .= sprintf($this->language->get('text_product'), html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8')) . "\n";
		// 	$message .= sprintf($this->language->get('text_reviewer'), html_entity_decode($data['name'], ENT_QUOTES, 'UTF-8')) . "\n";
		// 	$message .= sprintf($this->language->get('text_rating'), $data['rating']) . "\n";
		// 	$message .= $this->language->get('text_review') . "\n";
		// 	$message .= html_entity_decode($data['text'], ENT_QUOTES, 'UTF-8') . "\n\n";

		// 	$mail = new Mail();
		// 	$mail->protocol = $this->config->get('config_mail_protocol');
		// 	$mail->parameter = $this->config->get('config_mail_parameter');
		// 	$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		// 	$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		// 	$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		// 	$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		// 	$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		// 	$mail->setTo($this->config->get('config_email'));
		// 	$mail->setFrom($this->config->get('config_email'));
		// 	$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
		// 	$mail->setSubject($subject);
		// 	$mail->setText($message);
		// 	$mail->send();

		// 	// Send to additional alert emails
		// 	$emails = explode(',', $this->config->get('config_alert_email'));

		// 	foreach ($emails as $email) {
		// 		if ($email && filter_var($email, FILTER_VALIDATE_EMAIL)) {
		// 			$mail->setTo($email);
		// 			$mail->send();
		// 		}
		// 	}
		// }
	}

	public function getReviewsByProductId($product_id) {
		// if ($start < 0) {
		// 	$start = 0;
		// }

		// if ($limit < 1) {
		// 	$limit = 20;
		// }

		$query = $this->db->query("SELECT r.review_id, r.author, r.thumbs, r.rating, r.text, p.product_id, pd.name, p.price, p.image, r.date_added FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY r.date_added DESC  ");

		return $query->rows;
	}
	public function getReviewsByProductIdone($product_id,$start = 0, $limit = 1) {
		if ($start = 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 1;
		}

		$query = $this->db->query("SELECT r.review_id, r.author, r.rating, r.text, p.product_id, pd.name, p.price, p.image, r.date_added FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY r.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

		public function getReviewImg($review_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "review_image WHERE review_id = '" . (int)$review_id . "'");

		return $query->rows;
	}

	public function getTotalReviewsByProductId($product_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row['total'];
	}

	public function getReview($review_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "review WHERE review_id = '" . (int)$review_id . "'");

		return $query->rows;
	}
	public function addThumbs($review_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_review WHERE customer_id = '" . (int)$this->customer->getId() . "' AND review_id = '" . (int)$review_id . "'");

		$this->db->query("INSERT INTO " . DB_PREFIX . "customer_review SET customer_id = '" . (int)$this->customer->getId() . "', review_id = '" . (int)$review_id . "'");
	}
	public function deleteThumbs($review_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_review WHERE customer_id = '" . (int)$this->customer->getId() . "' AND review_id = '" . (int)$review_id . "'");
	}
	public function getTotalsThumbs($review_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_review WHERE review_id = '" . (int)$review_id . "' ");

		return $query->row['total'];
	}
	public function getTotalThumbs() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_review WHERE customer_id = '" . (int)$this->customer->getId() . "'");

		return $query->row['total'];
	}

	public function thumbsornot($review_id){
           $customer_id = $this->customer->isLogged() ? $this->customer->getId() : 0;
            if( empty($review_id)|| $customer_id==0){
                return false;
            }
           
            $sql ="select * from ".DB_PREFIX."customer_review   where review_id = '".$review_id."' AND customer_id =". $customer_id;
            // print_r($sql);exit;
            $query = $this->db->query($sql);
            // print_r($query->row)
           if (empty($query->row)) {
           	return  false;
           }else {
           		return  true;
           }
          
            
          
	}
	public function getProductorder($order_id) {
        $query = $this->db->query("SELECT product_id FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");
// print_r($query->rows);exit;
		return $query->rows;
	}
}