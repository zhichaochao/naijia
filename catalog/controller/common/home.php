<?php
class ControllerCommonHome extends Controller {
	public function index() {

		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}
			$this->load->model('tool/image');

		$this->load->model('design/banner');
		$banners= $this->model_design_banner->getBanner(7);
		foreach ($banners as $key => $result) {
		$banners[$key]['image'] = $this->model_tool_image->resize($result['image'], 1920,800);
		$banners[$key]['m_image'] = $this->model_tool_image->resize($result['m_image'], 750,500);
		}
		// print_r($banners);exit();
		$data['banners']=$banners;
		$banners= $this->model_design_banner->getBanner(6);
		foreach ($banners as $key => $result) {
		$banners[$key]['image'] = $this->model_tool_image->resize($result['image'], 800,800);
		$banners[$key]['m_image'] = $this->model_tool_image->resize($result['m_image'], 800,800);
		}
		// print_r($banners);exit();
		$data['fours']=$banners;
		$banners= $this->model_design_banner->getBanner(8);
		foreach ($banners as $key => $result) {
		$banners[$key]['image'] = $this->model_tool_image->resize($result['image'], 770,460);

		}
		// print_r($banners);exit();

		$data['store']=isset($banners[0])?$banners[0]:array();
	$this->load->model('catalog/hotproduct');
	$this->load->model('catalog/product');
		$sort = 'p.sort_order';
			$filter_data = array(
				'filter_category_id' => 67,
				'filter_sub_category' => true,       //dyl add
				'filter_filter'      => array(),
				'sort'               => $sort,
				'order'              => 'ASC',
				'start'              => '0',
				'limit'              => 16
			);

		

			$results = $this->model_catalog_hotproduct->getHotproducts($filter_data);
			$hots=array();
			foreach ($results as $key => $result) {
			  $res = $this->model_catalog_product->getProductImages($result['product_id']); 
			  	if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}
					if(!empty($result['special'])){
			    	$specials=$result['special']['special'];
			    	if ($result['special']['percent']>0) {
			    		$perce=$result['special']['percent'];
			    		$percents=100-$perce;
			    	}else{
			    		$perce=round($result['special']['special']/$result['special']['old_price'],2)*100;
			    		$percents=100-$perce;
			    	}
			    	
			    	$date_ends=$result['special']['date_end'];
			    }else{
			    	$specials='';
			    	$percents='';
			    	$date_ends='';
			    }
			        if (isset($res[0]['image'])){
			    	$tmp=$this->model_tool_image->resize($res[0]['image'],380,380);
			    }else{
			    	$tmp=$image;
			    }
			  $hots[] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'thumbs'       =>$tmp,
					'hot'	  => $result['hot'],
					'date_end'	  => $date_ends,
					'max_name'	  => $result['name'],
					'reviews'	  => $result['reviews'],
					'specials'	  => $specials,
					'percent'    => $percents,
					'name'        => utf8_substr(strip_tags($result['name']),0,30).'...',
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $this->currency->format($result['price'],$this->session->data['currency']),
					'special'     => $specials>0? $this->currency->format($specials,$this->session->data['currency']) : '',
				
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				
				);

			}
			// print_r($hots);exit();
			$data['hots']=$hots;

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');

		
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
