<?php
class ControllerInformationProfile extends Controller {

	public function index() {
		$this->load->language('information/information');

		$this->load->model('catalog/information');

		$this->load->model('tool/image');


		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}

		$information_info = $this->model_catalog_information->getInformations();
// print_r($information_info);exit;
		if ($information_info) {

			foreach ($information_info as $result) {

			$data['informations'][] = array(
					'information_id'  => $result['information_id'],
					'image'       => $this->model_tool_image->resize($result['image'],506,303),
					'ydimage'       => $this->model_tool_image->resize($result['image'],710,426),
					'video'       =>$result['video']=='' ?'0':'1',
					'addtime'	  => date('m/d/Y', strtotime($result['addtime'])),
					'title'	  	  => $result['title'],
					'description'	  =>utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'href'        => $this->url->link('information/profile/infocare', 'information_id=' . $result['information_id']),
				);
		}
		// print_r($data['informations']);exit;


			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('information/profile_indexs', $data));
		// } else {
		// 	$data['breadcrumbs'][] = array(
		// 		'text' => $this->language->get('text_error'),
		// 		'href' => $this->url->link('information/information', 'information_id=' . $information_id)
		// 	);

		// 	$this->document->setTitle($this->language->get('text_error'));

		// 	$data['heading_title'] = $this->language->get('text_error');

		// 	$data['text_error'] = $this->language->get('text_error');

		// 	$data['button_continue'] = $this->language->get('button_continue');

		// 	$data['continue'] = $this->url->link('common/home');

		// 	$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

		// 	$data['continue'] = $this->url->link('common/home');

		// 	$data['column_left'] = $this->load->controller('common/column_left');
		// 	$data['column_right'] = $this->load->controller('common/column_right');
		// 	$data['content_top'] = $this->load->controller('common/content_top');
		// 	$data['content_bottom'] = $this->load->controller('common/content_bottom');
		// 	$data['footer'] = $this->load->controller('common/footer');
		// 	$data['header'] = $this->load->controller('common/header');


		// 	$this->response->setOutput($this->load->view('error/not_found', $data));
		// }
	}
}
		public function infocare()
		{

		$this->load->language('information/information');

		$this->load->model('catalog/information');
		$this->load->model('tool/image');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}

		$information_info = $this->model_catalog_information->getInformation($information_id);
		$information_fu = $this->model_catalog_information->getInformationfu($information_id);

		$data['information_fu']=$information_fu;
		if ($information_info) {
			if(!empty($information_info['video'])){
			if ($this->request->server['HTTPS']) {
				$data['video']=HTTPS_SERVER.'image/video/home/'.$information_info['video'];
			}else{
				$data['video']=HTTP_SERVER.'image/video/home/'.$information_info['video'];
			}
			}else{
				$data['video']='';
			}

			if(!empty($information_info['images'])){
			$data['images']=$this->model_tool_image->resize($information_info['images'],980,490);
			$data['simages']=$this->model_tool_image->resize($information_info['images'],450,270);
		}else{
			$data['images']='';
			$data['simages']='';

		}
			$data['addtime']=$information_info['addtime'];
			$data['title']=$information_info['title'];
			$data['meta_title']=$information_info['meta_title'];
			$data['description']=html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');
			$data['meta_description']=html_entity_decode($information_info['meta_description'], ENT_QUOTES, 'UTF-8');
			// print_r($data);exit;
			// $this->document->setTitle($information_info['meta_title']);
			// $this->document->setDescription($information_info['meta_description']);
			// $this->document->setKeywords($information_info['meta_keyword']);

			// $data['breadcrumbs'][] = array(
			// 	'text' => $information_info['title'],
			// 	'href' => $this->url->link('information/information', 'information_id=' .  $information_id)
			// );


			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

	
			$this->response->setOutput($this->load->view('information/profile_index', $data));
		}
	}

		public function loadpage()
		{
				$this->load->language('information/profile');
				$this->document->setTitle($this->language->get('heading_titles'));
				$this->load->model('catalog/profile');
					$this->load->model('tool/image');
			$http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) ? 'https://' : 'http://';
			  $url = '';
			   if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}
			if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
			} else {
				$limit = 9;
			}
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			$product_total = $this->model_catalog_profile->getVideoCount();
			//print_r($product_total);exit();
			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('information/profile/hairclub',  $url . '&page={page}');
			//print_r($pagination->limit);exit();
			$data['pagination'] = $pagination->render();
			$filter_data = array(
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);
				$videos=$this->model_catalog_profile->getVideos($filter_data);
				//var_dump($videos);exit;
				if ($videos) {
				
						foreach ($videos as $key => $value) {
							$videos[$key]['video']=$http_type . $_SERVER['HTTP_HOST'].'/image/video/hairclub/'. $value['video'];
							$videos[$key]['title']=$value['title'];
							$videos[$key]['image']=$this->model_tool_image->resize($value['image'],380,215);
						}
				}
			// $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));
			// print_r($data['results']);exit();
			if ($page == 1) {
			    $this->document->addLink($this->url->link('information/profile/hairclub', '', true), 'canonical');
			} elseif ($page == 2) {
			    $this->document->addLink($this->url->link('information/profile/hairclub', '', true), 'prev');
			} else {
			    $this->document->addLink($this->url->link('information/profile/hairclub', $url . '&page='. ($page - 1), true), 'prev');
			}

			if ($limit && ceil($product_total / $limit) > $page) {
			    $this->document->addLink($this->url->link('information/profile/hairclub', $url . '&page='. ($page + 1), true), 'next');
			}

 			 $profile_video['videos']=$videos;
			   $data['profile_video']=$profile_video;

			
	
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($data));
		}
}