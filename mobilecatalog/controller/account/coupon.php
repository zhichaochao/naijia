<?php
class ControllerAccountCoupon extends Controller {
	private $error = array();

	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/address', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->language('account/vip');

		$this->document->setTitle($this->language->get('heading_titles'));

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

		$data['heading_title'] = $this->language->get('heading_title');
		$this->load->model('account/customer');
		$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

		if (isset($this->request->post['firstname'])) {
			$data['firstname'] = $this->request->post['firstname'];
		} elseif (!empty($customer_info)) {
			$data['firstname'] = $customer_info['firstname'];
		} else {
			$data['firstname'] = '';
		}

		if (isset($this->request->post['telephone'])) {
			$data['telephone'] = $this->request->post['telephone'];
		} elseif (!empty($customer_info)) {
			$data['telephone'] = $customer_info['telephone'];
		} else {
			$data['telephone'] = '';
		}
		if(isset($_SERVER['HTTP_REFERER'])){
			$data['home'] =$_SERVER['HTTP_REFERER'];
		}else{
			$data['home'] =$this->url->link('account/account');
		}
	 	$url = '';
				  if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}
			if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
			} else {
				$limit = 6;
			}
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
		$filter_data = array(
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);
		$this->load->model('catalog/review');
		$resultcoupon = $this->model_catalog_review->getCustomerCoupon($filter_data);
		if($resultcoupon){
			foreach ($resultcoupon as $result) {
				$time=time();
				$data['coupons'][] = array(
					'coupon_id'=>$result['coupon_id'],
					'name'=>$result['name'],
					'type'=>$result['type'],
					'usecoupon'=>$result['usecoupon'],
			 		'discountp' 			=>floatval($result['discount']),
			 		'discount' 		=>$this->currency->format(floatval($result['discount']),$this->session->data['currency']),
			 		'total' 	=> $this->currency->format(floatval($result['total']),$this->session->data['currency']),
					'status' =>  strtotime($result['date_end'])>$time ? 0:1,
					'date_end' => date($this->language->get('date_format_short'), strtotime($result['date_end']))
					);

			}
		}

		$data['balance'] = $this->model_account_customer->getRewardTotal($this->customer->getId());
			$coupon_total = $this->model_catalog_review->getTotalCustomerCoupon();
		// print_r($coupon_total);exit();
		$pagination = new Pagination();
			$pagination->total = $coupon_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('account/coupon',  $url . '&page={page}');
			//print_r($pagination->limit);exit();
			$data['pagination'] = $pagination->render();
			
				if ($page == 1) {
			    $this->document->addLink($this->url->link('account/coupon', '', true), 'canonical');
			} elseif ($page == 2) {
			    $this->document->addLink($this->url->link('account/coupon', '', true), 'prev');
			} else {
			    $this->document->addLink($this->url->link('account/coupon', $url . '&page='. ($page - 1), true), 'prev');
			}

			if ($limit && ceil($coupon_total / $limit) > $page) {
			    $this->document->addLink($this->url->link('account/coupon', $url . '&page='. ($page + 1), true), 'next');
			}

		$data['add'] = $this->url->link('account/address/add', '', true);
		$data['back'] = $this->url->link('account/account', '', true);
		$data['coupon'] = $this->url->link('common/coupon', '', true);

		$data['action'] = $this->url->link('account/address/edit', true);

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['account_left'] = $this->load->controller('account/left');      
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/coupon', $data));
	}

}
