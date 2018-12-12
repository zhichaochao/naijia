<?php
class ControllerCommonEmail extends Controller {



     public function index() {
          $domain="https://www.naijabeautyhair.com/index.php?route=common/email/";  

          if (isset($this->session->data['email_action'])) {
            
            // 调用的邮件模板
               $url= $domain.$this->session->data['email_action'];  
                // unset($this->session->data['email_action']);//每次邮件只能发送一次
               $ch = curl_init();
               curl_setopt($ch,CURLOPT_URL,$url);
               curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
               curl_setopt($ch,CURLOPT_TIMEOUT,1);
               $result = curl_exec($ch);
               curl_close($ch);
          }

      
          // print_r( $result );exit();
     }
     public function register() {
               ignore_user_abort();
               set_time_limit(0);
               //发送邮件
               $this->load->language('mail/customer');
               $this->load->model('account/customer');
               if (isset($this->session->data['email_user_id'])) {
                   $this->model_tool_image
               


		       $data['user_name'] = '志超';
		       $data['email'] ='928583371@qq.com';
		       $data['telephone'] = '312123123';
             
                 //邮箱头部信息
               $message  = $this->language->get('text_website') . ' ' . html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8') . "\n\n";
		       $message = 'Full Name: ' . $data['user_name'] . "\n\n";
		       $message .= 'Telephone: ' . $data['telephone'] . "\n\n";
		       $message .= $this->language->get('text_email') . ' '  .  $data['email']  . "\n\n";
		       $message .= 'Inquiry Content: '  .  '测试' . "\n\n";

               $mail = new Mail();
               $mail->protocol = $this->config->get('config_mail_protocol');
               $mail->parameter = $this->config->get('config_mail_parameter');
               $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
               $mail->smtp_username = $this->config->get('config_mail_smtp_username');
               $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
               $mail->smtp_port = $this->config->get('config_mail_smtp_port');
               $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

               $mail->setTo($data['email']);                     //发给系统管理员的邮箱(接收人邮箱)
               $mail->setFrom($this->config->get('config_mail_parameter'));      //发送人
               $mail->setSender(html_entity_decode($data['user_name'], ENT_QUOTES, 'UTF-8'));    //发送者名字
               $mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'),'志超'), ENT_QUOTES, 'UTF-8'));
               $mail->setSubject('Naijia Ask for help');  
                                                          //邮件标题
               // 邮件模板
               $mail->setHtml($this->load->view('mail/contact_us_email',$data));

               $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));

                $json = array();

                //1分钟只能发送一次
              
               if (isset($this->session->data['sendemail_time'])&&isset($this->session->data['sendemail_email'])&&($this->session->data['sendemail_email']==$data['email'])&&($this->session->data['sendemail_time']+2>time())) {
                   $json['error']="Send only once a minute";
               }else{
                    $this->session->data['sendemail_time']=time();
                    $this->session->data['sendemail_email']=$data['email'];
                    $json=$mail->send();
               }
           $this->response->addHeader('Content-Type: application/json');
           $this->response->setOutput(json_encode($json));
      }
              
		
    }

}
