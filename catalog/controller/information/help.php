<?php
class ControllerInformationHelp extends Controller {

	private $error = array();

	public function index() {
		
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('information/help', '', true);
			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->document->setTitle('Feedback');


		$data['heading_title'] = 'Feedback';

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
		if (!empty($customer_info)) {
			$data['email'] = $customer_info['email'];
		} else {
			$data['email'] = '';
		}
		if(isset($_SERVER['HTTP_REFERER'])){
			$data['home'] =$_SERVER['HTTP_REFERER'];
		}else{
			$data['home'] =$this->url->link('common/home');
		}
        //用户名
        $data['user_name'] = $this->customer->getFirstName().' '.$this->customer->getLastName();
        if($data['user_name'] == ' ') $data['user_name'] = $this->customer->getEmail();
		//feedback提交
		$data['action'] = $this->url->link('information/help');

		// $data['email'] = $this->config->get('config_email');
		// $data['telephone'] = $this->config->get('config_telephone');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
            $this->load->model('setting/feedback');

            $customerResult = $this->model_setting_feedback->getCustomerData($this->customer->getId());
// 
            // $data['name'] = $data['user_name'];
            // $data['email'] = $this->customer->getEmail();
            // // 
            // $data['fixed_line'] = $this->customer->getTelephone();
            $data['country_id'] = (!empty($customerResult['country_id'])) ? $customerResult['country_id'] : 0;
            // $data['telephone'] = $this->customer->getTelephone();
            $data['firstname'] = $customer_info['firstname'];
            $data['email'] = $customer_info['email'];
            $data['telephone'] = (!empty($customerResult['country_id'])) ? $customerResult['country_id'] : '';
            $data['enquiry'] = $this->request->post['enquiry'];
		// print_r($data);exit;
            $result = $this->model_setting_feedback->addFeedback($data);
            if($result){
               $this->session->data['success'] = 'We have received your message, thank you for your advice';

               //发送邮件
               $this->load->language('mail/customer');

               //获取url的网址参数
	           $QUERY_STRING = explode('=',$_SERVER['QUERY_STRING']);

               //logo
               if ($this->request->server['HTTPS']) {
				   $server = $this->config->get('config_ssl');
			   } else {
				   $server = $this->config->get('config_url');
			   }
               if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			       $html_data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		       } else {
			       $html_data['logo'] = '';
		       }

		       $this->load->model('localisation/country');
		       $country_result = $this->model_localisation_country->getCountry($customerResult['country_id']);

               $html_data['from_name'] = $data['user_name'];
               $html_data['email'] = $this->customer->getEmail();
               $html_data['tel_number'] = $this->customer->getTelephone();
               $html_data['country_name'] = !empty($country_result['name']) ? $country_result['name'] : 'United States';
               $html_data['business_name'] = $data['user_name'];
               $html_data['ip_address'] = $this->request->server['REMOTE_ADDR'];
               $html_data['send_page'] = $QUERY_STRING[1];
               $html_data['content'] = trim($this->request->post['enquiry']);
               $html_data['factime'] = '';
               $html_data['whatsapp'] = '';

               /*$message  = $this->language->get('text_website') . ' ' . html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8') . "\n\n";
		       $message .= 'Full Name: ' . $data['user_name'] . "\n\n";
		       $message .= $this->language->get('text_email') . ' '  .  $this->customer->getEmail() . "\n\n";
		       $message .= 'Inquiry Content: '  .  $this->request->post['enquiry'] . "\n\n";*/

               $mail = new Mail();
               $mail->protocol = $this->config->get('config_mail_protocol');
               $mail->parameter = $this->config->get('config_mail_parameter');
               $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
               $mail->smtp_username = $this->config->get('config_mail_smtp_username');
               $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
               $mail->smtp_port = $this->config->get('config_mail_smtp_port');
               $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

               $mail->setTo($this->config->get('config_email'));                     //发给系统管理员的邮箱(接收人邮箱)
               $mail->setFrom($this->config->get('config_mail_parameter'));      //发送人
               $mail->setSender(html_entity_decode($data['user_name'], ENT_QUOTES, 'UTF-8'));    //发送者名字
               //$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
               $mail->setSubject('Hot Beauty Hair Contact Us Inquiry');                                                //邮件标题
               $mail->setHtml($this->load->view('mail/contact_us_email',$html_data));
               //$mail->setText($message);
               $mail->send();

            }else{
               $this->session->data['error'] = 'Submit your proposal to failure.';
            }
		}

		//feedback内容的错误提示
		if (isset($this->error['enquiry'])) {
			$data['error_enquiry'] = $this->error['enquiry'];
		} else {
			$data['error_enquiry'] = '';
		}

        //成功提示
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		//失败提示
		if (isset($this->session->data['error'])) {
			$data['error_warning'] = $this->session->data['error'];
			unset($this->session->data['error']);
		} else {
			$data['error_warning'] = '';
		}



			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');


		$this->response->setOutput($this->load->view('information/feedback', $data));
	}


	/**
	 * 验证form表单
	 * @author  dyl 783973660@qq.com 2016.9.26
	 */
	protected function validate() {

		if ((utf8_strlen(trim($this->request->post['enquiry'])) < 10) || (utf8_strlen(trim($this->request->post['enquiry'])) > 3000)) {
			//$this->error['enquiry'] = $this->language->get('error_enquiry');
			$this->error['enquiry'] = 'Comment must be between 10 and 3000 characters!';
		}

		return !$this->error;
	}

}