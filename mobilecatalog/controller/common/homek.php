<?php
class ControllerCommonHomek extends Controller {
	public function index() {
	   $mail = new Mail();
               $mail->protocol = $this->config->get('config_mail_protocol');
               $mail->parameter = $this->config->get('config_mail_parameter');
               $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
               $mail->smtp_username = $this->config->get('config_mail_smtp_username');
               $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
               $mail->smtp_port = $this->config->get('config_mail_smtp_port');
               $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

               $mail->setTo('928583371@qq.com');                     //发给系统管理员的邮箱(接收人邮箱)
               $mail->setFrom($this->config->get('config_mail_parameter'));      //发送人
               $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));    //发送者名字
               $mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'),'test'), ENT_QUOTES, 'UTF-8'));
               $mail->setSubject('test');  
                                                          //邮件标题
               // 邮件模板
               $mail->setHtml( 'ceshi' );

               $mail->setText(html_entity_decode('ceshi', ENT_QUOTES, 'UTF-8'));
              $k= $mail->send();
              print_r($k);exit();
	}
   
}
