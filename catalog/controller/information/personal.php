<?php

/**
 * Company Profile信息页控制器
 * @author  dyl 783973660@qq.com 2016.10.6
 */
class ControllerInformationPersonal extends Controller {
	private $error = array();


	public function index()
	{
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('information/personal', '', true);
			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->model('account/customer');

		$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
		// print_r($customer_info);exit;
		if (!empty($customer_info)) {
			$data['telephone'] = $customer_info['telephone'];
		} else {
			$data['telephone'] = '';
		}
		if (!empty($customer_info)) {
			$data['firstname'] = $customer_info['firstname'];
		} else {
			$data['firstname'] = '';
		}

		$this->load->language('information/contact');
		$this->document->setTitle('ME');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
			$data['continue'] = $this->url->link('common/home');
			$data['order'] = $this->url->link('account/order', '', true);
			$data['wishlist'] = $this->url->link('account/wishlist', '', true);

			$data['address'] = $this->url->link('account/address', '', true);
			$data['profile'] = $this->url->link('account/account', '', true);
			$data['message'] = $this->url->link('account/message', '', true);
			$data['coupon'] = $this->url->link('account/coupon', '', true);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');


		
				$this->response->setOutput($this->load->view('information/personal', $data));
			
		

	}

   
}