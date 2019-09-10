<?php

/**
 * Company Profile信息页控制器
 * @author  dyl 783973660@qq.com 2016.10.6
 */
class ControllerInformationLagosstore extends Controller {
	private $error = array();


	public function index()
	{
		$this->load->language('information/contact');
		$this->document->setTitle('Lagos Store');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if(isset($_SERVER['HTTP_REFERER'])){
			$data['home'] =$_SERVER['HTTP_REFERER'];
		}else{
			$data['home'] =$this->url->link('common/home');
		}

		$this->load->model('catalog/review');
            $this->load->model('tool/image');
		$results = $this->model_catalog_review->getAllserver();

		 $this->load->model('account/customer');
		 $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
		 if (!empty($customer_info)) {
			$data['email'] = $customer_info['email'];
		} else {
			$data['email'] = '';
		}
		if (!empty($customer_info)) {
			$data['telephone'] = $customer_info['telephone'];
		} else {
			$data['telephone'] = '';
		}
		//用户名
        $data['user_name'] = $this->customer->getFirstName().' '.$this->customer->getLastName();
        if($data['user_name'] == ' ') $data['user_name'] = $this->customer->getEmail();

		// print_r($data['user_name']);exit;
		foreach ($results as $key=>$row) {
                    $server_img[$key]['img'] = $this->model_tool_image->resize( $row['image'], 780, 480);
                    $server_img[$key]['min_img'] = $this->model_tool_image->resize($row['image'], 720, 400);
                    foreach($results as $key=>$rows){
                    	$servers[$key]['servers']=$rows['servers'];
                    }	
                 $data['servers'][2] = array(
                 	'images'        => $server_img
                 	);
                 $data['serverser'][2] = array(
                 	'servers'        => $servers
                 	);
		}
			$data['continue'] = $this->url->link('common/home');
			if(!$this->customer->isLogged()){
                if ($_SERVER['HTTPS']) {
                $this->session->data['redirect']=$this->url->link('information/lagosstore', '', true);
            	}else{
                $this->session->data['redirect']=$this->url->link('information/lagosstore', '', true);
           		 }
         		}else{
                $data['logins']=1;               
            	}
             $data['login'] = $this->url->link('account/login', '', true);

			$data['action'] = $this->url->link('information/lagosstore', '', true);
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
					$ap="";
				  $temp_x=$this->request->post['posTypeSelect'];
				  for($i=0;$i<count($temp_x);$i++){
				  $ap=$ap.$temp_x[$i].",";
				  }
				  $data['content']=substr($ap,0,-1);//去除末尾单引号职位分类
				  // print_r($data['content']);exit;
				  $data['time']=$this->request->post['time'];
				  $data['url']=$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'];
				   $this->load->model('setting/feedback');
				  $result = $this->model_setting_feedback->addStore($data);
				  // 发送邮件

				  if($result){
               $this->session->data['success'] = 'The appointment has been sent to your e-mail. Please check or cancel by the e-mail. Thanks!';

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

               $html_data['from_name'] = $data['user_name'];
               $html_data['email'] = $this->customer->getEmail();
               $html_data['tel_number'] = $this->customer->getTelephone();
               $html_data['business_name'] = $data['user_name'];
               $html_data['ip_address'] = $this->request->server['REMOTE_ADDR'];
               $html_data['send_page'] = $QUERY_STRING[1];

               $message  = $this->language->get('text_website') . ' ' . html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8') . "\n\n";
		       $message .= 'Full Name: ' . $data['user_name'] . "\n\n";
		       $message .= $this->language->get('text_email') . ' '  .  $this->customer->getEmail() . "\n\n";
		       $message .= 'Reservations: '  .  $data['email'] . "\n\n";
		       $message .= 'Reservation content: '  .  $data['content'] . "\n\n";
		       $message .= 'Time of appointmentt: '  .  $data['time'] . "\n\n";
		       $message .= 'source: '  . $data['url']. "\n\n";
		       $message .= 'Timely Handling Of Staff'  . "\n\n";

               $mail = new Mail();
               $mail->protocol = $this->config->get('config_mail_protocol');
               $mail->parameter = $this->config->get('config_mail_parameter');
               $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
               $mail->smtp_username = $this->config->get('config_mail_smtp_username');
               $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
               $mail->smtp_port = $this->config->get('config_mail_smtp_port');
               $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

               // $mail->setTo($this->config->get('config_serviceemail'));   
               $mail->setTo($data['email']);                     //发给系统管理员的邮箱(接收人邮箱)
               $mail->setFrom($this->config->get('config_mail_parameter'));      //发送人
               $mail->setSender(html_entity_decode($data['user_name'], ENT_QUOTES, 'UTF-8'));    //发送者名字
               //$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
               $mail->setSubject('Lagos Shop Reservation');                                                //邮件标题
               $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
               $mail->send();

				$this->load->model('localisation/country');

               $html_data['from_name'] = $data['user_name'];
               $html_data['email'] = $this->customer->getEmail();
               $html_data['tel_number'] = $this->customer->getTelephone();
               $html_data['business_name'] = $data['user_name'];
               $html_data['ip_address'] = $this->request->server['REMOTE_ADDR'];
               $html_data['send_page'] = $QUERY_STRING[1];

               $message  = $this->language->get('text_website') . ' ' . html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8') . "\n\n";
		       $message .= 'Full Name: ' . $data['user_name'] . "\n\n";
		       $message .= $this->language->get('text_email') . ' '  .  $this->customer->getEmail() . "\n\n";
		       $message .= 'Reservations: '  .  $data['email'] . "\n\n";
		       $message .= 'Reservation content: '  .  $data['content'] . "\n\n";
		       $message .= 'Time of appointmentt: '  .  $data['time'] . "\n\n";
		       $message .= 'source: '  . $data['url']. "\n\n";
		       $message .= 'Timely Handling Of Staff'  . "\n\n";

               $mail = new Mail();
               $mail->protocol = $this->config->get('config_mail_protocol');
               $mail->parameter = $this->config->get('config_mail_parameter');
               $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
               $mail->smtp_username = $this->config->get('config_mail_smtp_username');
               $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
               $mail->smtp_port = $this->config->get('config_mail_smtp_port');
               $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

               // $mail->setTo($this->config->get('config_serviceemail'));   
               $mail->setTo($this->config->get('config_serviceemail'));                     //发给系统管理员的邮箱(接收人邮箱)
               $mail->setFrom($this->config->get('config_mail_parameter'));      //发送人
               $mail->setSender(html_entity_decode($data['user_name'], ENT_QUOTES, 'UTF-8'));    //发送者名字
               //$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
               $mail->setSubject('Lagos Shop Reservation');                                                //邮件标题
               $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
               $mail->send();



            }else{
               $this->session->data['error'] = 'Reservation failure';
            }
				 
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


		
				$this->response->setOutput($this->load->view('information/lagosstore', $data));
			
		

	}
	protected function validate() {

		if ((utf8_strlen(trim($this->request->post['time'])) < 1) || (utf8_strlen(trim($this->request->post['time'])) > 3000)) {
			//$this->error['enquiry'] = $this->language->get('error_enquiry');
			$this->error['time'] = 'Time error';
		}


		return !$this->error;
	}

   
}