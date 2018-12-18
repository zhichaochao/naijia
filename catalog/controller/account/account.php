<?php
class ControllerAccountAccount extends Controller {
	private $error = array();

	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/account', '', true);
			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->language('account/address');

		$this->document->setTitle($this->language->get('heading_title'));

		

		$this->load->model('account/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			//$this->model_account_customer->editCustomer($this->request->post);
			$this->model_account_customer->editCustomerUK($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			// Add to activity log
			if ($this->config->get('config_customer_activity')) {
				$this->load->model('account/activity');

				$activity_data = array(
					'customer_id' => $this->customer->getId(),
					'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
				);

				$this->model_account_activity->addActivity('edit', $activity_data);
			}
			$this->response->redirect($this->url->link('account/account', '', true));
		}

		$data['heading_title'] = 'UPDATE ACCOUNT INFORMATION';

		//$data['text_your_details'] = $this->language->get('text_your_details');

		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_fax'] = $this->language->get('entry_fax');
		if(isset($_SERVER['HTTP_REFERER'])){
			$data['home'] =$_SERVER['HTTP_REFERER'];
		}else{
			$data['home'] =$this->url->link('common/home');
		}
        //密码
		$data['entry_oldpassword'] = 'Current Password';
		$data['entry_password'] = 'New Password';
		$data['entry_confirm'] = 'Confirm Password';

		$data['button_continue'] = 'UPDATE';

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

        if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['firstname'])) {
			$data['error_firstname'] = $this->error['firstname'];
		} else {
			$data['error_firstname'] = '';
		}

		if (isset($this->error['lastname'])) {
			$data['error_lastname'] = $this->error['lastname'];
		} else {
			$data['error_lastname'] = '';
		}

		if (isset($this->error['telephone'])) {
			$data['error_telephone'] = $this->error['telephone'];
		} else {
			$data['error_telephone'] = '';
		}
		//密码的错误提示
	
// print_r($this->session);exit;
		if (isset($this->session->data['oldpassword'])) {
			$data['error_oldpassword'] = $this->session->data['oldpassword'];
			unset($this->session->data['oldpassword']);
		} else {
			$data['error_oldpassword'] = '';
		}

		if (isset($this->session->data['password'])) {
			$data['error_password'] = $this->session->data['password'];
			unset($this->session->data['password']);
		} else {
			$data['error_password'] = '';
		}

		if (isset($this->session->data['confirm'])) {
			$data['error_confirm'] = $this->session->data['confirm'];
			unset($this->session->data['confirm']);
		} else {
			$data['error_confirm'] = '';
		}
		//密码的错误提示,end

		$data['action'] = $this->url->link('account/account', '', true);
		//修改密码的链接  dyl add
		$data['changepwd_action'] = $this->url->link('account/account/changepwd', '', true);
		$data['balance'] = $this->model_account_customer->getRewardTotal($this->customer->getId());
		if ($this->request->server['REQUEST_METHOD'] != 'POST') {
			$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
		}

		if (isset($this->request->post['firstname'])) {
			$data['firstname'] = $this->request->post['firstname'];
		} elseif (!empty($customer_info)) {
			$data['firstname'] = $customer_info['firstname'];
		} else {
			$data['firstname'] = '';
		}

		if (isset($this->request->post['lastname'])) {
			$data['lastname'] = $this->request->post['lastname'];
		} elseif (!empty($customer_info)) {
			$data['lastname'] = $customer_info['lastname'];
		} else {
			$data['lastname'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} elseif (!empty($customer_info)) {
			$data['email'] = $customer_info['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['telephone'])) {
			$data['telephone'] = $this->request->post['telephone'];
		} elseif (!empty($customer_info)) {
			$data['telephone'] = $customer_info['telephone'];
		} else {
			$data['telephone'] = '';
		}


		if (isset($this->request->post['gender'])) {
			$data['gender'] = $this->request->post['gender'];
		} elseif (!empty($customer_info)) {
			$data['gender'] = $customer_info['gender'];
		} else {
			$data['gender'] = '';
		}

		if (isset($this->request->post['birthday'])) {
			$data['birthday'] = $this->request->post['birthday'];
		} elseif (!empty($customer_info)) {
			$data['birthday'] = $customer_info['birthday'];
		} else {
			$data['birthday'] = '';
		}

		if (isset($this->request->post['whatsapp'])) {
			$data['whatsapp'] = $this->request->post['whatsapp'];
		} elseif (!empty($customer_info)) {
			$data['whatsapp'] = $customer_info['whatsapp'];
		} else {
			$data['whatsapp'] = '';
		}

		if (isset($this->request->post['facebook'])) {
			$data['facebook'] = $this->request->post['facebook'];
		} elseif (!empty($customer_info)) {
			$data['facebook'] = $customer_info['facebook'];
		} else {
			$data['facebook'] = '';
		}
		
		if (isset($this->request->post['instagram'])) {
			$data['instagram'] = $this->request->post['instagram'];
		} elseif (!empty($customer_info)) {
			$data['instagram'] = $customer_info['instagram'];
		} else {
			$data['instagram'] = '';
		}

        //旧密码
		if (isset($this->request->post['oldpassword'])) {
			$data['oldpassword'] = $this->request->post['oldpassword'];
		} else {
			$data['oldpassword'] = '';
		}
        //新密码
		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

        //确认的新密码
		if (isset($this->request->post['confirm'])) {
			$data['confirm'] = $this->request->post['confirm'];
		} else {
			$data['confirm'] = '';
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		//$data['column_right'] = $this->load->controller('common/column_right');
		$data['account_left'] = $this->load->controller('account/left');      //新左侧栏
		$data['content_top'] = $this->load->controller('common/content_top');
		//$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');


		$data['edit'] = $this->url->link('account/account/edit', '', true);

		$data['editchange'] = $this->url->link('account/account/change', '', true);
		$data['logout'] = $this->url->link('account/logout');
//print_r($data);exit();
		$this->response->setOutput($this->load->view('account/account', $data));
	}
    public function edit()
    {
    	if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/account', '', true);
			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->language('account/address');

		$this->document->setTitle($this->language->get('heading_title'));

		

		$this->load->model('account/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			//$this->model_account_customer->editCustomer($this->request->post);
			$this->model_account_customer->editCustomerUK($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			// Add to activity log
			if ($this->config->get('config_customer_activity')) {
				$this->load->model('account/activity');

				$activity_data = array(
					'customer_id' => $this->customer->getId(),
					'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
				);

				$this->model_account_activity->addActivity('edit', $activity_data);
			}
			$this->response->redirect($this->url->link('account/account', '', true));
		}
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

        if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['firstname'])) {
			$data['error_firstname'] = $this->error['firstname'];
		} else {
			$data['error_firstname'] = '';
		}

		if (isset($this->error['lastname'])) {
			$data['error_lastname'] = $this->error['lastname'];
		} else {
			$data['error_lastname'] = '';
		}

		if (isset($this->error['telephone'])) {
			$data['error_telephone'] = $this->error['telephone'];
		} else {
			$data['error_telephone'] = '';
		}

		if (isset($this->error['whatsapp'])) {
			$data['error_whatsapp'] = $this->error['whatsapp'];
		} else {
			$data['error_whatsapp'] = '';
		}

		if (isset($this->error['facebook'])) {
			$data['error_facebook'] = $this->error['facebook'];
		} else {
			$data['error_facebook'] = '';
		}

		if (isset($this->error['instagram'])) {
			$data['error_instagram'] = $this->error['instagram'];
		} else {
			$data['error_instagram'] = '';
		}


		if ($this->request->server['REQUEST_METHOD'] != 'POST') {
			$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
		}

		if (isset($this->request->post['firstname'])) {
			$data['firstname'] = $this->request->post['firstname'];
		} elseif (!empty($customer_info)) {
			$data['firstname'] = $customer_info['firstname'];
		} else {
			$data['firstname'] = '';
		}

		if (isset($this->request->post['lastname'])) {
			$data['lastname'] = $this->request->post['lastname'];
		} elseif (!empty($customer_info)) {
			$data['lastname'] = $customer_info['lastname'];
		} else {
			$data['lastname'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} elseif (!empty($customer_info)) {
			$data['email'] = $customer_info['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['telephone'])) {
			$data['telephone'] = $this->request->post['telephone'];
		} elseif (!empty($customer_info)) {
			$data['telephone'] = $customer_info['telephone'];
		} else {
			$data['telephone'] = '';
		}


		if (isset($this->request->post['gender'])) {
			$data['gender'] = $this->request->post['gender'];
		} elseif (!empty($customer_info)) {
			$data['gender'] = $customer_info['gender'];
		} else {
			$data['gender'] = '';
		}

		if (isset($this->request->post['birthday'])) {
			$data['birthday'] = $this->request->post['birthday'];
		} elseif (!empty($customer_info)) {
			$data['birthday'] = $customer_info['birthday'];
		} else {
			$data['birthday'] = '';
		}

		if (isset($this->request->post['whatsapp'])) {
			$data['whatsapp'] = $this->request->post['whatsapp'];
		} elseif (!empty($customer_info)) {
			$data['whatsapp'] = $customer_info['whatsapp'];
		} else {
			$data['whatsapp'] = '';
		}

		if (isset($this->request->post['facebook'])) {
			$data['facebook'] = $this->request->post['facebook'];
		} elseif (!empty($customer_info)) {
			$data['facebook'] = $customer_info['facebook'];
		} else {
			$data['facebook'] = '';
		}
		
		if (isset($this->request->post['instagram'])) {
			$data['instagram'] = $this->request->post['instagram'];
		} elseif (!empty($customer_info)) {
			$data['instagram'] = $customer_info['instagram'];
		} else {
			$data['instagram'] = '';
		}
		$data['edit'] = $this->url->link('account/account/edit', '', true);
		if(isset($_SERVER['HTTP_REFERER'])){
			$data['home'] =$_SERVER['HTTP_REFERER'];
		}else{
			$data['home'] =$this->url->link('common/home');
		}

		$data['account_left'] = $this->load->controller('account/left');      //新左侧栏
		$data['content_top'] = $this->load->controller('common/content_top');
		//$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/account_from', $data));

    }

    public function change()
    {
    	$this->load->model('account/customer');

    	if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/account', '', true);
			$this->response->redirect($this->url->link('account/login', '', true));
		}

		if ($this->request->server['REQUEST_METHOD'] != 'POST') {
			$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
		}

		 $this->load->language('account/edit');
        $this->load->model('account/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validatepwd()) {
// print_r($this->request->post);exit;
		  $resuast= $this->model_account_customer->editCustomerUK($this->request->post);
		  if($resuast){
		  	 $this->session->data['success'] = 'success';
		  	 
		  	 // $this->session->data['success'] = $this->language->get('text_success');
		  }
		  

		   // Add to activity log
		   if($this->config->get('config_customer_activity')){
			  $this->load->model('account/activity');

			  $activity_data = array(
				 'customer_id' => $this->customer->getId(),
				 'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
			  );

			  $this->model_account_activity->addActivity('edit', $activity_data);
		   }
		   $this->response->redirect($this->url->link('account/logout'));

		}


		// $this->change();

		if (isset($this->error['code'])) {
			$data['error_code'] = $this->error['code'];
		} else {
			$data['error_code'] = '';
		}

		if (isset($this->error['yzm'])) {
			$data['error_yzm'] = $this->error['yzm'];
		} else {
			$data['error_yzm'] = '';
		}

		if (isset($this->error['password'])) {
			$data['error_password'] = $this->error['password'];
		} else {
			$data['error_password'] = '';
		}
		if (isset($this->error['confirm'])) {
			$data['error_confirm'] = $this->error['confirm'];
		} else {
			
			$data['error_confirm'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['emails'] = $this->request->post['email'];
		} else {
			$data['emails'] = $this->customer->getEmail();
		}

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
			$data['telephone'] = $this->customer->getTelephone();
		}
		if(isset($_SERVER['HTTP_REFERER'])){
			$data['home'] =$_SERVER['HTTP_REFERER'];
		}else{
			$data['home'] =$this->url->link('common/home');
		}



// print_r($this->session->data['yzm']);exit;

		$data['account_left'] = $this->load->controller('account/left');      //新左侧栏
		$data['content_top'] = $this->load->controller('common/content_top');
		//$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$data['action'] = $this->url->link('account/account/changemail', '', true);
		$data['actions'] = $this->url->link('account/account/change', '', true);

		// if ($data['success']) {
		// 	$this->response->redirect($this->url->link('account/account', '', true));
		// }else{
			$this->response->setOutput($this->load->view('account/change_from', $data));
		// }
		


    }
	protected function validate() {

		if ((utf8_strlen($this->request->post['email']) > 96) || !filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
			$this->error['firstname'] = 'First Name must be between 1 and 32 characters!';
		}

		if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
			$this->error['lastname'] = 'Last Name must be between 1 and 32 characters!';
		}

		if (($this->customer->getEmail() != $this->request->post['email']) && $this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
			$this->error['warning'] = $this->language->get('error_exists');
		}

		if ((utf8_strlen($this->request->post['telephone']) < 2) || (utf8_strlen($this->request->post['telephone']) > 32)) {
			$this->error['telephone'] = 'telephone must be between 2 and 128 characters!';
		}

		if ((utf8_strlen($this->request->post['whatsapp']) < 2) || (utf8_strlen($this->request->post['whatsapp']) > 32)) {
			$this->error['whatsapp'] = 'whatsapp must be between 2 and 128 characters!';
		}

		if ((utf8_strlen($this->request->post['facebook']) < 2) || (utf8_strlen($this->request->post['facebook']) > 32)) {
			$this->error['facebook'] = 'facebook must be between 2 and 128 characters!';
		}

		if ((utf8_strlen($this->request->post['instagram']) < 2) || (utf8_strlen($this->request->post['instagram']) > 32)) {
			$this->error['instagram'] = 'instagram must be between 2 and 128 characters!';
		}



        /*//密码的验证
		if(!empty($this->request->post['oldpassword'])){
			$this->load->model('account/customer');
			if (!$this->model_account_customer->chkOldPassword($this->request->post['oldpassword'])) {
				$this->error['oldpassword'] = 'Current Password is error!';
			}
		}

		if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
			if(!empty($this->request->post['password'])){
				$this->error['password'] = 'Password must be between 4 and 20 characters!';
			}
		}

		if ($this->request->post['confirm'] != $this->request->post['password']) {
			if(!empty($this->request->post['password'])){
				$this->error['confirm'] = 'Password confirmation does not match password!';
			}
		}
		//密码的验证,end */

		return !$this->error;
	}


    /**
     * 用户修改密码
     * @author  dyl 783973660@qq.com 2016.9.28
     */
	public function changepwd(){

        $this->load->language('account/edit');
        $this->load->model('account/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validatepwd()) {
// print_r($this->request->post);exit;
		  $resuast= $this->model_account_customer->editCustomerUK($this->request->post);
		  if($resuast){
		  	 $this->session->data['success'] = 'success';
		  	 $this->response->redirect($this->url->link('account/logout'));
		  	 // $this->session->data['success'] = $this->language->get('text_success');
		  }
		  

		   // Add to activity log
		   if($this->config->get('config_customer_activity')){
			  $this->load->model('account/activity');

			  $activity_data = array(
				 'customer_id' => $this->customer->getId(),
				 'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
			  );

			  $this->model_account_activity->addActivity('edit', $activity_data);
		   }

		}


		// $this->change();

		

	}


    /**
     * 验证用户的密码
     * @author   dyl  783973660@qq.com  2016.9.28
     */
	protected function validatepwd(){

		if(!isset($this->session->data['yzm'])){
           //$this->error['confirm'] = 'Confirm password cannot be empty!';
         $this->error['yzm'] = 'Please get the verification code first.';
           return false;
		}

		if($this->request->post['code'] != $this->session->data['yzm'] || $this->request->post['code']==''){
           //$this->error['confirm'] = 'Confirm password cannot be empty!';
         $this->error['code'] = 'The verification code is incorrect.';
           return false;
		}


		if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
			if(!empty($this->request->post['password'])){
				//$this->error['password'] = 'Password must be between 4 and 20 characters!';
				$this->error['password']= 'Password must be between 4 and 20 characters!';
				return false;
			}
		}

		if ($this->request->post['confirm'] != $this->request->post['password']) {
			if(!empty($this->request->post['password'])){
				//$this->error['confirm'] = 'Password confirmation does not match password!';
				$this->error['confirm']= 'It need to be same as new password!';
				return false;
			}
		}
		return true;

	}


	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$this->load->model('account/address');
		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);
		if (isset($this->request->get['address_id'])) {
			$address= $this->model_account_address->getAddress($this->request->get['address_id']);
		}
	
		// print_r($address);exit();

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status'],
				'zone_id'			=>isset($address['zone_id'])?$address['zone_id']:0,	
				'address_id'			=>isset($address['address_id'])?$address['address_id']:0,	
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function changemail() {
		// if ($this->customer->isLogged()) {
		// 	$this->response->redirect($this->url->link('account/account', '', true));
		// }
// print_r($this->request->post['email']);exit;
		$this->load->language('account/forgotten');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('account/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			$this->load->language('mail/forgotten');

			$code = token(40);
			$yzm=rand(100000,999999);
			$this->model_account_customer->editCode($this->request->post['email'], $code);

            //根据邮箱获取该用户 dyl add
			$customer_data = $this->model_account_customer->getCustomerByEmail($this->request->post['email']);

			$subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

			

            $message  = "Dear ". $customer_data['firstname'] ." ". $customer_data['lastname'] . ",\n\n";
			$message .= sprintf($this->language->get('text_greeting'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')) . "\n\n";
			$message .= "The 6 bit verification code is :".$yzm. "\n\n";
			// $message .= $this->url->link('account/reset', 'code=' . $code, true) . "\n\n";
			$message .= sprintf($this->language->get('text_ip'), $this->request->server['REMOTE_ADDR']) . "\n\n";

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->request->post['email']);
			//$mail->setFrom($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_mail_parameter'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
			$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
			$mail->send();
			$this->session->data['yzm']=$yzm;
			$json['successs'] = $this->language->get('text_success');
		}



		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}

}
