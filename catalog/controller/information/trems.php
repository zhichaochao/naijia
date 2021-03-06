<?php

/**
 * Company Profile信息页控制器
 * @author  dyl 783973660@qq.com 2016.10.6
 */
class ControllerInformationTrems extends Controller {
	private $error = array();


	public function index()
	{
		$this->load->language('information/contact');
		$this->document->setTitle('TERMS AND CONDITIONS');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');


		
				$this->response->setOutput($this->load->view('information/trems', $data));
			
		

	}

   
}