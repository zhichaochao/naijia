<?php
class ControllerCommonCoupon extends Controller {
	private $error = array();

	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/address', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->language('account/vip');

		$this->document->setTitle('Coupon');

		$this->load->model('account/address');

		$this->getList();
	}
	protected function getList() {
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/address', '', true)
		);

		$data['heading_title'] ='Coupon';

			$this->load->model('catalog/review');
		$resultcoupon = $this->model_catalog_review->getcoupon(0);

		// print_r($resultcoupon);exit;
		if($resultcoupon){
		foreach ($resultcoupon as $key => $value) {

			 $coupon= $this->model_catalog_review->couponornot($value['coupon_id']);

			 $data['resultcoupons'][] = array(
			 	'coupon_id' 	 => $value['coupon_id'],
			 	'name'  		=> $value['name'],
			 	'code' 			=> $value['code'],
			 	'discountp' 			=>floatval($value['discount']),
			 	'discount' 		=>$this->currency->format(floatval($value['discount']),$this->session->data['currency']), 
			 	'type' 			=> $value['type'],
			 	'coupon' 			=> $coupon,
			 	'total' 	=> $this->currency->format($value['total'],$this->session->data['currency']),
				'date_end' => date($this->language->get('date_format_short'), strtotime($value['date_end']))
			 	);
		}
		}

        $data['addcoupon'] = $this->url->link('common/coupon/add', '', true);
		// print_r($data['resultcoupons']);exit;
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['account_left'] = $this->load->controller('account/left');      
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/coupon', $data));
	}

	public function add() {

        $json = array();

        if (isset($this->request->post['coupon_id'])) {
            $coupon_id = $this->request->post['coupon_id'];
        } else {
            $coupon_id = 0;
        }

        $this->load->model('catalog/review');

        $coupon_info = $this->model_catalog_review->getcoupons($coupon_id);
// print_r($coupon_info);exit;
        if ($coupon_info) {
            if ($this->customer->isLogged()) {
                // Edit customers cart
                $this->load->model('catalog/review');

                $this->model_catalog_review->addcoupon($this->request->post['coupon_id']);

                $json['success'] = sprintf($this->language->get('text_success'),  $this->url->link('common/coupon'));

                // $json['total'] =  $this->model_catalog_review->getTotalsThumbs($this->request->post['review_id']);
                // print_r($json['total']);
            } else {

                $json['error'] =  $this->url->link('account/login', '', true);
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

}
