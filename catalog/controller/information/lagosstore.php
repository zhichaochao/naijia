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
		// print_r($results);exit;
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

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');


		
				$this->response->setOutput($this->load->view('information/lagosstore', $data));
			
		

	}

   
}