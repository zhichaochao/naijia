<?php
class ControllerSaleCustomertell extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('sale/order');

		$this->document->setTitle('客户手机号');

		$this->load->model('sale/order');

		$this->getList();
	}


	public function edit() {
		$this->load->language('sale/order');

		$this->document->setTitle('客户手机号');

		$this->load->model('sale/order');

		$this->info();
	}
	
	// public function delete() {
	// 	$this->load->language('sale/order');

	// 	$this->document->setTitle($this->language->get('heading_title'));

	// 	$this->load->model('sale/order');

	// 	if (isset($this->request->post['selected']) && $this->validate()) {
	// 		foreach ($this->request->post['selected'] as $order_id) {
	// 			$this->model_sale_order->deleteOrder($order_id);
	// 		}

	// 		$this->session->data['success'] = $this->language->get('text_success');

	// 		$url = '';

	// 		if (isset($this->request->get['filter_order_id'])) {
	// 			$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
	// 		}
	
	// 		if (isset($this->request->get['filter_customer'])) {
	// 			$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
	// 		}
	
	// 		if (isset($this->request->get['filter_order_status'])) {
	// 			$url .= '&filter_order_status=' . $this->request->get['filter_order_status'];
	// 		}
	
	// 		if (isset($this->request->get['filter_total'])) {
	// 			$url .= '&filter_total=' . $this->request->get['filter_total'];
	// 		}
	
	// 		if (isset($this->request->get['filter_date_added'])) {
	// 			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
	// 		}
	
	// 		if (isset($this->request->get['filter_date_modified'])) {
	// 			$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
	// 		}

	// 		$this->response->redirect($this->url->link('sale/order', 'token=' . $this->session->data['token'] . $url, true));
	// 	}

	// 	$this->getList();
	// }
	
	protected function getList() {
		if (isset($this->request->get['mobile'])) {
			$mobile = $this->request->get['mobile'];
		} else {
			$mobile = null;
		}

	

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'o.date_added';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['mobile'])) {
			$url .= '&mobile=' . $this->request->get['mobile'];
		}


		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' =>'客户手机号',
			'href' => $this->url->link('sale/customertell', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['delete'] = $this->url->link('sale/customertell/delete', 'token=' . $this->session->data['token'], true);

		$data['customertell'] = array();

		$filter_data = array(
			'mobile'      => $mobile,
			'sort'                 => $sort,
			'order'                => $order,
			'start'                => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                => $this->config->get('config_limit_admin')
		);
		// print_r($filter_data);exit;
		$results = $this->model_sale_order->getCustomerTell($filter_data);

		$order_total = $this->model_sale_order->getTotalCustomerTell($filter_data);
// print_r($order_total);exit;
		foreach ($results as $result) {
			$data['customertells'][] = array(
				'mobile'      	=> $result['mobile'],
				'date_added'    => date($result['date_added']),
				'sumCount' 		=> $result['sumCount'],
				'edit'          => $this->url->link('sale/customertell/edit', 'token=' . $this->session->data['token'] . '&mobile=' . $result['mobile'] . $url, true)
			);
		}

		$data['heading_title'] = '客户手机号';

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_missing'] = $this->language->get('text_missing');
		$data['text_loading'] = $this->language->get('text_loading');

		$data['column_order_id'] = $this->language->get('column_order_id');
		$data['column_customer'] = $this->language->get('column_customer');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_total'] = $this->language->get('column_total');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_date_modified'] = $this->language->get('column_date_modified');
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_order_id'] = $this->language->get('entry_order_id');
		$data['entry_customer'] = $this->language->get('entry_customer');
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_total'] = $this->language->get('entry_total');
		$data['entry_date_added'] = $this->language->get('entry_date_added');
		$data['entry_date_modified'] = $this->language->get('entry_date_modified');

		$data['button_invoice_print'] = $this->language->get('button_invoice_print');
		$data['button_shipping_print'] = $this->language->get('button_shipping_print');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_view'] = $this->language->get('button_view');
		$data['button_ip_add'] = $this->language->get('button_ip_add');

		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['mobile'])) {
			$url .= '&mobile=' . $this->request->get['mobile'];
		}

		// 

		if ($order == 'ASC') {
			$url .= '&order=ASC';
		} else {
			$url .= '&order=DESC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$url = '';

		if (isset($this->request->get['mobile'])) {
			$url .= '&mobile=' . $this->request->get['mobile'];
		}

		

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
// print_r($page);exit();
		$pagination = new Pagination();
		$pagination->total = $order_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('sale/customertell', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($order_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($order_total - $this->config->get('config_limit_admin'))) ? $order_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $order_total, ceil($order_total / $this->config->get('config_limit_admin')));

		$data['mobile'] = $mobile;

		$data['sort'] = $sort;
		$data['order'] = $order;
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('sale/customertell_list', $data));
	}


	public function info() {
		$this->load->model('sale/order');
		$this->load->model('catalog/product');

		if (isset($this->request->get['mobile'])) {
			$mobile = $this->request->get['mobile'];
		} else {
			$mobile = 0;
		}

		$mobile_info = $this->model_sale_order->getmobile($mobile);
		// print_r($mobile_info);exit;
		if ($mobile_info) {
			$this->load->language('sale/order');

			$this->document->setTitle('客户手机号');

			$data['heading_title'] = '客户手机号';

			$data['column_product'] = $this->language->get('column_product');
			$data['column_model'] = $this->language->get('column_model');
			$data['column_quantity'] = $this->language->get('column_quantity');
			$data['column_price'] = $this->language->get('column_price');
			$data['column_total'] = $this->language->get('column_total');

			$url='';
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' =>'客户手机号',
			'href' => $this->url->link('sale/customertell', 'token=' . $this->session->data['token'] . $url, true)
		);
		$data['cancel'] = $this->url->link('sale/customertell', 'token=' . $this->session->data['token'] . $url, true);
	// Uploaded files
			$this->load->model('tool/upload');
			$this->load->model('customer/customer');
// print_r($mobile_info);exit;
			$data['products'] = array();
			$data['customer'] = array();
			foreach ($mobile_info as $mobileinfo) {

				$this->load->model('catalog/url_alias');
				$keyword = $this->model_catalog_url_alias->getKeyword($mobileinfo['product_id']);

				if($mobileinfo['customer_id']!=0){
					$customer_info = $this->model_customer_customer->getCustomer($mobileinfo['customer_id']);
						$data['customer'][] = array(
						'firstname'       	=> $customer_info['firstname'],
						'email'       	=> $customer_info['email']
					);
				}
				$product_info = $this->model_catalog_product->getProduct($mobileinfo['product_id']);
				$productoption = $this->model_sale_order->getmobileoption($mobileinfo['product_select_id']);
				$productoptionprice = $this->model_sale_order->getmobileoptionprice($mobileinfo['product_select_id']);

					$data['products'][] = array(
					'product_id'       	=> $mobileinfo['product_id'],
					'quantity'       	=> $mobileinfo['quantity'],
					'date_added'       	=> $mobileinfo['date_added'],
					'name'    	 	   	=> $product_info['name'],
					'price'    	 	   	=> $productoptionprice,
					'zongprice'   		=> $productoptionprice*$mobileinfo['quantity'],
					'model'    		  	=> $product_info['model'],
					'option_name'   	=> $productoption,
					'href'       		=> HTTP_CATALOG . $keyword,
					'customer'   		=> $data['customer']
				);
			}		
			// print_r($data['products']);exit;
			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');

			$this->response->setOutput($this->load->view('sale/customertell_info', $data));
		} else {
			return new Action('error/not_found');
		}
	}
	
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'sale/order')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}



	

	


	

	
}
