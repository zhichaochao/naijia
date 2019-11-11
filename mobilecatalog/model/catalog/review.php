<?php
class ModelCatalogReview extends Model {
	public function addReview($product_id, $data,$path, $firstname,$arr) {
		// print_r($arr);exit;
// print_r("INSERT INTO " . DB_PREFIX . "review SET author = '" . $firstname . "', customer_id = '" . (int)$this->customer->getId() . "', product_id = '" . (int)$product_id . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "',attribute = '" . $arr[0]. "',length = '" . $arr[1]. "',style = '" . $arr[2]. "', date_added = NOW()");exit;
			if(isset($arr[2])){	
			$this->db->query("INSERT INTO " . DB_PREFIX . "review SET author = '" . $firstname . "', customer_id = '" . (int)$this->customer->getId() . "', product_id = '" . (int)$product_id . "', text = '" . $this->db->escape($data['text']) . "', order_id = '" . $this->db->escape($data['order_id']) . "', rating = '" . (int)$data['rating'] . "',attribute = '" . $arr[1]. "',length = '" . $arr[0]. "',style = '" . $arr[2]. "', date_added = NOW()");
				}else{
					$this->db->query("INSERT INTO " . DB_PREFIX . "review SET author = '" . $firstname . "', customer_id = '" . (int)$this->customer->getId() . "', product_id = '" . (int)$product_id . "', order_id = '" . $this->db->escape($data['order_id']) . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "',attribute = '',length = '" . $arr[0]. "',style = '" . $arr[1]. "', date_added = NOW()");

				}
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

	public function getReviewsByProductId($product_id,$filter_data) {

		$limit='';
		$limit.=' limit '.$filter_data['start'].','.$filter_data['limit'];

		$query = $this->db->query("SELECT r.review_id, r.author, r.length, r.style, r.rating, r.text, p.product_id, pd.name, p.price, p.image, r.date_added FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY r.date_added DESC  ".$limit);

		return $query->rows;
	}
	public function getReviewsByProductIdone($product_id,$start = 0, $limit = 1) {
		if ($start = 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 1;
		}

		$query = $this->db->query("SELECT r.review_id, r.author, r.length, r.style, r.rating, r.text, p.product_id, pd.name, p.price, p.image, r.date_added FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY r.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

		public function getReviewImg($review_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "review_image WHERE review_id = '" . (int)$review_id . "'");

		return $query->rows;
	}
	public function getReviewImgs($review_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "review_image WHERE review_id = '" . (int)$review_id . "'limit 3");

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
// print_r($query->row['total']);exit;
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

	public function getAllreviews() {

        $query = $this->db->query("SELECT * FROM   " . DB_PREFIX . "review WHERE order_id != '0' group by  order_id ");
		return $query->rows;
	}
	public function getAllreviewsed() {

        $query = $this->db->query("SELECT * FROM   " . DB_PREFIX . "review WHERE order_id = '0'");
		return $query->rows;
	}

	public function getreviews() {

        $query = $this->db->query("SELECT * FROM   " . DB_PREFIX . "review WHERE order_id = '0' limit 1");
		return $query->rows;
	}
	public function getAllserver() {

        $query = $this->db->query("SELECT * FROM   " . DB_PREFIX . "storelagos  limit 3");
		return $query->rows;
	}
	public function getServer() {
		$query = $this->db->query("SELECT servers FROM " . DB_PREFIX . "storelagos ");

		return $query->rows;
	}
	public function getcoupon($limit) {
		if ($limit==3) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "coupon o WHERE status='1' AND o.uses_total != 0 AND o.coupon_id != 14  AND o.date_end >= NOW() ORDER BY o.coupon_id desc  limit $limit ");
		}else{
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "coupon o WHERE status='1' AND o.uses_total != 0  AND o.date_end >= NOW() ORDER BY o.coupon_id desc   ");
		}
		

		return $query->rows;
	}
		public function getalertcoupon() {
		
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "coupon o WHERE status='1' AND o.alertcode = '1'  AND o.date_end >= NOW() ORDER BY o.coupon_id desc limit 1   ");
	
		

		return $query->rows;
	}
	public function couponornot($coupon_id){
           $customer_id = $this->customer->isLogged() ? $this->customer->getId() : 0;
            if( empty($coupon_id)|| $customer_id==0){
                return false;
            }
           
            $sql ="select * from ".DB_PREFIX."customer_coupon   where coupon_id = '".$coupon_id."' AND customer_id =". $customer_id;
            $query = $this->db->query($sql);
            // print_r($query->row)
           if (empty($query->row)) {
           	return  false;
           }else {
           		return  true;
           }
          
            
          
	}
	public function getcoupons($coupon_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "coupon WHERE coupon_id = '" . (int)$coupon_id . "'  AND status='1'");
        $querys = $this->db->query ("SELECT * from " . DB_PREFIX . "coupon_history where coupon_id='" . (int)$coupon_id . "' AND customer_id = '" . (int)$this->customer->getId(). "'");
        if($querys->rows){
        	$usecoupon=1;
        }else{
        	$usecoupon=0;
        }
		if ($query->rows) {
			return array(
				'coupon_id'       => $query->row['coupon_id'],
				'name'       => $query->row['name'],
				'type'       => $query->row['type'],
				'code'       => $query->row['code'],
				'usecoupon'       => $usecoupon,
				'discount'       => $query->row['discount'],
				'date_end'       => $query->row['date_end'],
				'total'       => $query->row['total'],
				'name'       => $query->row['name'],
				);
		}else{
		return false;
		}
		// return $query->rows;
	}
	public function addcoupon($coupon_id) {

		$this->db->query("INSERT INTO " . DB_PREFIX . "customer_coupon SET customer_id = '" . (int)$this->customer->getId() . "', coupon_id = '" . (int)$coupon_id . "'");
		$querys = $this->db->query("SELECT * FROM " . DB_PREFIX . "coupon WHERE coupon_id = '" . (int)$coupon_id . "'");
		$row= $querys->row;
		$suc =$this->db->query("UPDATE " . DB_PREFIX . "coupon SET uses_total = ".($row['uses_total']-1)." WHERE coupon_id= '" .(int)$coupon_id. "' ");
		return $suc;
	}
	public function getCustomerCoupon($filter_data) {
		$limit='';
		if ($filter_data['limit']>0) {
			$limit.=' limit '.$filter_data['start'].','.$filter_data['limit'];
		}
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_coupon WHERE customer_id = '" . (int)$this->customer->getId(). "' order by coupon_id desc".$limit);
		// $query->rows;
		if(!empty($query->rows)){
			foreach ($query->rows as $result) {
			$coupon_data[$result['coupon_id']] = $this->getcoupons($result['coupon_id']);
		}
		return $coupon_data;
		}else{
		return false;
		}
		
		
	}
	public function getCustomerUseCoupon() {
		$query = $this->db->query("SELECT c.coupon_id,c.name,c.type,c.code,c.total,c.discount FROM " . DB_PREFIX . "coupon c where  c.coupon_id in ( SELECT coupon_id from " . DB_PREFIX . "customer_coupon cc WHERE cc.coupon_id not in (select coupon_id from " . DB_PREFIX . "coupon_history   where customer_id ='" . (int)$this->customer->getId(). "')AND cc.customer_id ='" . (int)$this->customer->getId(). "' ) AND c.date_end >= NOW() AND  c.status='1'");
		return $query->rows;	
	}
	public function getTotalCustomerCoupon() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_coupon WHERE customer_id = '" . (int)$this->customer->getId() . "' ");
// print_r($query->row['total']);exit;
		return $query->row['total'];
	}
	public function getfullCoupon($coupon_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "coupon o WHERE coupon_id = '" . (int)$coupon_id . "'  AND o.date_end >= NOW()  AND o.status='1'");

		return $query->row;
	}
	
}