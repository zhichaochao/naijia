<?php

/**
 * Company Profile信息页控制器
 * @author  dyl 783973660@qq.com 2016.10.6
 */
class ControllerInformationHottoorder extends Controller {
	private $error = array();


	public function index()
	{
		// if (!$this->customer->isLogged()) {
		// 	$this->session->data['redirect'] = $this->url->link('information/vip', '', true);
		// 	$this->response->redirect($this->url->link('account/login', '', true));
		// }
		$this->load->language('information/contact');
		$this->document->setTitle('Hot To Order');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
		$data['register'] = $this->url->link('account/login/register_save', '', true);
		// $str=$this->config->get('config_video');
		// // 
		// 	$data['video1']=HTTP_SERVER.'image/video/home/'.$str;

			$data['continue'] = $this->url->link('common/home');
			$data['back'] = $this->url->link('product/category');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');


		
				$this->response->setOutput($this->load->view('information/hottoorder', $data));
			
		

	}

   
}
