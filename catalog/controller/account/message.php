<?php
class ControllerAccountMessage extends Controller {
	private $error = array();

	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/message', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->language('account/vip');

		$this->document->setTitle('My Message');

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

	   $data['balance'] = $this->model_account_customer->getRewardTotal($this->customer->getId());
       $results = $this->model_account_address->getCustomerMessage();
       $data['messages'] = array();
       foreach ($results as $result) {
                $data['messages'][] = array(
                
                    'message' =>$result['message'],
                  
                    'date_added'=> date('m/d/Y', strtotime($result['date_added']))
                );
            }
		$data['add'] = $this->url->link('account/address/add', '', true);
		$data['back'] = $this->url->link('account/account', '', true);

		$data['action'] = $this->url->link('account/address/edit', true);

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['account_left'] = $this->load->controller('account/left');      
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/message', $data));
	}

}
