<?php
class ControllerProductCategory extends Controller {
	public function index() {
		$this->load->language('product/category');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');


		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}


		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
			// $limit = 1;
		} else {
			$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
			// $limit = 1;
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => 'Home',
			'href' => $this->url->link('common/home')
		);


		if (isset($this->request->get['path'])) {
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path . $url)
					);
				}
			}
		} else {
			$category_id = 0;
		}

		$category_info = $this->model_catalog_category->getCategory($category_id);
// print_r($category_info);exit;

		$url = '';

		if ($category_info) {
			$this->document->setTitle($category_info['meta_title']);
			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);

			$data['heading_title'] = $category_info['name'];

			$data['text_refine'] = $this->language->get('text_refine');
			$data['text_empty'] = $this->language->get('text_empty');
			$data['text_quantity'] = $this->language->get('text_quantity');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_price'] = $this->language->get('text_price');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_points'] = $this->language->get('text_points');

			$data['sort_sort_order'] = $this->url->link('product/category', 'token='  . '&sort=p.price' . $url, true);
			$data['sort_sort_order_d'] = $this->url->link('product/category', 'token='  . '&sort=p.price&order=DESC' . $url, true);
			$data['sort_sort_add'] = $this->url->link('product/category', 'token='  . '&sort=p.date_added' . $url, true);
			$data['sort_sort_rating'] = $this->url->link('product/category', 'token='  . '&sort=rating' . $url, true);
			//产品对比按钮
			//$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$data['text_sort'] = $this->language->get('text_sort');
			$data['text_limit'] = $this->language->get('text_limit');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['button_list'] = $this->language->get('button_list');
			$data['button_grid'] = $this->language->get('button_grid');


			if ($this->request->server['HTTPS']) {
			$data['image1']=HTTPS_SERVER.'image/'.$category_info['image1'];
			$data['ydimage1']=HTTPS_SERVER.'image/'.$category_info['ydimage1'];
			$data['image2']=HTTPS_SERVER.'image/'.$category_info['image2'];
			$data['ydimage2']=HTTPS_SERVER.'image/'.$category_info['ydimage2'];
			$data['video']=HTTPS_SERVER.'image/video/home/'.$category_info['video'];
			$data['video1']=HTTPS_SERVER.'image/video/home/'.$category_info['video1'];
			$data['video2']=HTTPS_SERVER.'image/video/home/'.$category_info['video2'];

			$data['banner1']=HTTPS_SERVER.'image/'.$category_info['banner1'];
			$data['ydbanner1']=HTTPS_SERVER.'image/'.$category_info['ydbanner1'];
			$data['banner2']=HTTPS_SERVER.'image/'.$category_info['banner2'];
			$data['ydbanner2']=HTTPS_SERVER.'image/'.$category_info['ydbanner2'];
			$data['banner3']=HTTPS_SERVER.'image/'.$category_info['banner3'];
			$data['ydbanner3']=HTTPS_SERVER.'image/'.$category_info['ydbanner3'];
		}else{
			$data['image1']=HTTP_SERVER.'image/'.$category_info['image1'];
			$data['ydimage1']=HTTP_SERVER.'image/'.$category_info['ydimage1'];
			$data['image2']=HTTP_SERVER.'image/'.$category_info['image2'];
			$data['ydimage2']=HTTP_SERVER.'image/'.$category_info['ydimage2'];
			$data['video']=HTTP_SERVER.'image/video/home/'.$category_info['video'];
			$data['video1']=HTTP_SERVER.'image/video/home/'.$category_info['video1'];
			$data['video2']=HTTP_SERVER.'image/video/home/'.$category_info['video2'];

			$data['banner1']=HTTP_SERVER.'image/'.$category_info['banner1'];
			$data['ydbanner1']=HTTP_SERVER.'image/'.$category_info['ydbanner1'];
			$data['banner2']=HTTP_SERVER.'image/'.$category_info['banner2'];
			$data['ydbanner2']=HTTP_SERVER.'image/'.$category_info['ydbanner2'];
			$data['banner3']=HTTP_SERVER.'image/'.$category_info['banner3'];
			$data['ydbanner3']=HTTP_SERVER.'image/'.$category_info['ydbanner3'];

		}

			$data['wishlist'] = $this->url->link('account/wishlist/add', '', true);
			$data['delewishlist'] = $this->url->link('account/wishlist/delete', '', true);



 if (isset($this->request->get['path'])) {

			// Set the last category breadcrumb
			$data['breadcrumbs'][] = array(
				'text' => $category_info['name'],
				'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'])
			);
		}else{
				$data['breadcrumbs'][] = array(
				'text' => $category_info['name'],
				'href' => $this->url->link('product/category')
			);
		}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}


			$data['products'] = array();

			$filter_data = array(
				'filter_category_id' => $category_info['category_id'],
				'filter_sub_category' => true,       //dyl add
				'filter_filter'      => $filter,
				// 'hot'      => $category_info['hot'],
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);

			$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

			$results = $this->model_catalog_product->getProducts($filter_data);
			// basic 三个子分类
			$filter_datas = array(
				'filter_category_id' => $category_info['category_id'],
				'filter_sub_category' => true,       //dyl add
				'filter_filter'      => $filter,
				// 'hot'      => $category_info['hot'],
				'sort'               => $sort,
				'order'              => $order
			);

			$basicresults1 = $this->model_catalog_product->getBasicProducts($filter_datas);
			$basicresults2 = $this->model_catalog_product->getBasicProductss($filter_datas);
			$basicresults3 = $this->model_catalog_product->getBasiccProductss($filter_datas);
			// $basicresults1 = $this->model_catalog_product->getBasicProducts($filter_data);
// print_r($basicresults1);exit;
			foreach ($basicresults1 as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					//$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$price = $this->currency->format($result['price'], $this->session->data['currency']);
				} else {
					$price = false;
				}

			

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special']>0 ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

		
			    $wishlist= $this->model_catalog_product->wishlistornot($result['product_id']);
			    $res = $this->model_catalog_product->getProductImages($result['product_id']); 

 
			    if(!empty($result['special'])){
			    	$specials=$result['special']['special'];
			    	if ($result['special']['percent']>0) {
			    		$percents=$result['special']['percent'];
			    	}else{
			    		$percents=round($result['special']['special']/$result['special']['old_price'],2)*100;
			    	}
			    	
			    	$date_ends=strtotime($result['special']['date_end'])-time();
			    }else{
			    	$specials='';
			    	$percents='';
			    	$date_ends='';
			    }
			    if (isset($res[0]['image'])){
			    	$tmp=$this->model_tool_image->resize($res[0]['image'],380,380);
			    }else{
			    	$tmp=$this->model_tool_image->resize('no_image.png', 380, 380);
			    }
				$data['basicproducts1'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'thumbs'       =>$tmp,
					'hot'	  => $category_info['hot'],
					'date_end'	  => $date_ends,
					'max_name'	  => $result['name'],
					'hotsort'	  => $result['hot'],
					'reviews'	  => $result['reviews'],
					'percent'    => $percents,
					'name'        => utf8_substr(strip_tags($result['name']),0,25).'...',
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $this->currency->format($result['price'],$this->session->data['currency']),
					'special'     => $specials>0? $this->currency->format($specials,$this->session->data['currency']) : '',
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'wishlist'	  =>$wishlist
				);
			}
			// print_r($data['basicproducts1']);exit;
			foreach ($basicresults2 as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					//$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$price = $this->currency->format($result['price'], $this->session->data['currency']);
				} else {
					$price = false;
				}

			

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special']>0 ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

		
			    $wishlist= $this->model_catalog_product->wishlistornot($result['product_id']);
			    $res = $this->model_catalog_product->getProductImages($result['product_id']); 

 
			    if(!empty($result['special'])){
			    	$specials=$result['special']['special'];
			    	if ($result['special']['percent']>0) {
			    		$percents=$result['special']['percent'];
			    	}else{
			    		$percents=round($result['special']['special']/$result['special']['old_price'],2)*100;
			    	}
			    	
			    	$date_ends=strtotime($result['special']['date_end'])-time();
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
				$data['basicproducts2'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'thumbs'       =>$tmp,
					'hot'	  => $category_info['hot'],
					'date_end'	  => $date_ends,
					'max_name'	  => $result['name'],
					'reviews'	  => $result['reviews'],
					'hotsort'	  => $result['hot'],
					'percent'    => $percents,
					'name'        => utf8_substr(strip_tags($result['name']),0,25).'...',
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $this->currency->format($result['price'],$this->session->data['currency']),
					'special'     => $specials>0? $this->currency->format($specials,$this->session->data['currency']) : '',
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'wishlist'	  =>$wishlist
				);
			}

			foreach ($basicresults3 as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					//$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$price = $this->currency->format($result['price'], $this->session->data['currency']);
				} else {
					$price = false;
				}

			

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special']>0 ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

		
			    $wishlist= $this->model_catalog_product->wishlistornot($result['product_id']);
			    $res = $this->model_catalog_product->getProductImages($result['product_id']); 

 
			    if(!empty($result['special'])){
			    	$specials=$result['special']['special'];
			    	if ($result['special']['percent']>0) {
			    		$percents=$result['special']['percent'];
			    	}else{
			    		$percents=round($result['special']['special']/$result['special']['old_price'],2)*100;
			    	}
			    	
			    	$date_ends=strtotime($result['special']['date_end'])-time();
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
				$data['basicproducts3'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'thumbs'       =>$tmp,
					'hot'	  => $category_info['hot'],
					'date_end'	  => $date_ends,
					'hotsort'	  => $result['hot'],
					'max_name'	  => $result['name'],
					'reviews'	  => $result['reviews'],
					'percent'    => $percents,
					'name'        => utf8_substr(strip_tags($result['name']),0,25).'...',
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $this->currency->format($result['price'],$this->session->data['currency']),
					'special'     => $specials>0? $this->currency->format($specials,$this->session->data['currency']) : '',
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'wishlist'	  =>$wishlist
				);
			}

// 三个子分类结束
			// print_r($results );exit();
			foreach ($results as $result) {
				if ($category_info['hot']==3) {

					if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'],800,480);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

					
				}else{
					if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}
				}

				

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					//$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$price = $this->currency->format($result['price'], $this->session->data['currency']);
				} else {
					$price = false;
				}

			

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special']>0 ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

		
			    $wishlist= $this->model_catalog_product->wishlistornot($result['product_id']);
			    $res = $this->model_catalog_product->getProductImages($result['product_id']); 

 
			    if(!empty($result['special'])){
			    	$specials=$result['special']['special'];
			    	if ($result['special']['percent']>0) {
			    		$percents=$result['special']['percent'];
			    	}else{
			    		$percents=round($result['special']['special']/$result['special']['old_price'],2)*100;
			    	}
			    	
			    	$date_ends=strtotime($result['special']['date_end'])-time();
			    }else{
			    	$specials='';
			    	$percents='';
			    	$date_ends='';
			    }
			    if ($category_info['hot']==3) {
			    	if (isset($res[0]['image'])){
			    	$tmp=$this->model_tool_image->resize($res[0]['image'],800,480);
			    }else{
			    	$tmp=$this->model_tool_image->resize('no_image.png', 800, 480);
			    }
			    }else{
			    	if (isset($res[0]['image'])){
			    	$tmp=$this->model_tool_image->resize($res[0]['image'],380,380);
			    }else{
			    	$tmp=$this->model_tool_image->resize('no_image.png', 380, 380);
			    }
			    }
			    
				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'thumbs'       =>$tmp,
					'hot'	  => $category_info['hot'],
					'date_end'	  => $date_ends,
					'max_name'	  => $result['name'],
					'hotsort'	  => $result['hot'],
					'reviews'	  => $result['reviews'],
					'percent'    => $percents,
					'name'        => $result['name'],
					'meta_description'        =>utf8_substr(strip_tags($result['meta_description']),0,125).'...',
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $this->currency->format($result['price'],$this->session->data['currency']),
					'special'     => $specials>0? $this->currency->format($specials,$this->session->data['currency']) : '',
					'tax'         => $tax,
					'specials'	  => $specials,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'wishlist'	  =>$wishlist
				);
			}
			// print_r($data['products']);exit;
			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();
	 if (isset($this->request->get['path'])) {
				$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			);

			if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
				);
			}

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
			);

			}else{

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/category','sort=p.sort_order&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/category', 'sort=pd.name&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/category', 'sort=pd.name&order=DESC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/category', 'sort=p.price&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/category', 'sort=p.price&order=DESC' . $url)
			);

			if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/category', 'sort=rating&order=DESC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/category', 'sort=rating&order=ASC' . $url)
				);
			}

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/category', 'sort=p.model&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/category', 'sort=p.model&order=DESC' . $url)
			);

}
			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

			sort($limits);

	 if (isset($this->request->get['path'])) {
			foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)
				);
			}
		}else{
				foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/category', '1'  . $url . '&limit=' . $value)
				);
			}
		}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('product/category','path=' . $category_info['category_id'] . '&page={page}');

			$data['pagination'] = $pagination->render();
			
			$data['product_total']=$product_total;
			// $data['page']=$page;
			// print_r($data['pagination']);exit;
			// $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));
			$data['allpage']=ceil($product_total / $limit);		
			if ($page == 1) {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], true), 'canonical');
			} elseif ($page == 2) {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], true), 'prev');
			} else {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page='. ($page - 1), true), 'prev');
			}

			if ($limit && ceil($product_total / $limit) > $page) {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page='. ($page + 1), true), 'next');
			}

			$data['sort'] = $sort;
			$data['order'] = $order;
			$data['limit'] = $limit;
			$data['category_id'] = $category_info['category_id'];
// print_r($data['allpage']);exit;
			$data['continue'] = $this->url->link('common/home');


			$data['slogans']=$this->config->get('config_meta_slogans');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');


			if($category_info['hot']==1){

				$this->response->setOutput($this->load->view('product/category', $data));
			}elseif($category_info['hot']==2){

				$this->response->setOutput($this->load->view('product/hotcategory', $data));
			}elseif($category_info['hot']==3){

				$this->response->setOutput($this->load->view('product/boxcategory', $data));
			}elseif($category_info['hot']==4){

				$this->response->setOutput($this->load->view('product/basiccategory', $data));				
			}elseif($category_info['hot']==5){

				$this->response->setOutput($this->load->view('product/lacecategory', $data));		
			}else{

				$this->response->setOutput($this->load->view('product/accecategory', $data));
			}


			
			// $this->response->setOutput($this->load->view('product/hiotcategory', $data));
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/category', $url)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			//$data['column_right'] = $this->load->controller('common/column_right');
			$data['account_left'] = $this->load->controller('account/left');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}	


	public function loadpage() {
		$this->load->language('product/category');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');


		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}


		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
			// $limit = 1;
		} else {
			$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
			// $limit = 1;
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => 'Home',
			'href' => $this->url->link('common/home')
		);


		if (isset($this->request->get['path'])) {
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path . $url)
					);
				}
			}
		} else {
			$category_id = 0;
		}

		$category_info = $this->model_catalog_category->getCategory($category_id);
// print_r($category_info);exit;

		$url = '';

		if ($category_info) {
			$this->document->setTitle($category_info['meta_title']);
			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);

			$data['heading_title'] = $category_info['name'];

			$data['text_refine'] = $this->language->get('text_refine');
			$data['text_empty'] = $this->language->get('text_empty');
			$data['text_quantity'] = $this->language->get('text_quantity');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_price'] = $this->language->get('text_price');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_points'] = $this->language->get('text_points');

			$data['sort_sort_order'] = $this->url->link('product/category', 'token='  . '&sort=p.price' . $url, true);
			$data['sort_sort_order_d'] = $this->url->link('product/category', 'token='  . '&sort=p.price&order=DESC' . $url, true);
			$data['sort_sort_add'] = $this->url->link('product/category', 'token='  . '&sort=p.date_added' . $url, true);
			$data['sort_sort_rating'] = $this->url->link('product/category', 'token='  . '&sort=rating' . $url, true);
			//产品对比按钮
			//$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$data['text_sort'] = $this->language->get('text_sort');
			$data['text_limit'] = $this->language->get('text_limit');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['button_list'] = $this->language->get('button_list');
			$data['button_grid'] = $this->language->get('button_grid');


			$data['image1']=HTTP_SERVER.'image/'.$category_info['image1'];
			$data['ydimage1']=HTTP_SERVER.'image/'.$category_info['ydimage1'];
			$data['image2']=HTTP_SERVER.'image/'.$category_info['image2'];
			$data['ydimage2']=HTTP_SERVER.'image/'.$category_info['ydimage2'];
			$data['video']=HTTP_SERVER.'image/video/home/'.$category_info['video'];
			$data['video1']=HTTP_SERVER.'image/video/home/'.$category_info['video1'];
			$data['video2']=HTTP_SERVER.'image/video/home/'.$category_info['video2'];

			$data['banner1']=HTTP_SERVER.'image/'.$category_info['banner1'];
			$data['ydbanner1']=HTTP_SERVER.'image/'.$category_info['ydbanner1'];
			$data['banner2']=HTTP_SERVER.'image/'.$category_info['banner2'];
			$data['ydbanner2']=HTTP_SERVER.'image/'.$category_info['ydbanner2'];
			$data['banner3']=HTTP_SERVER.'image/'.$category_info['banner3'];
			$data['ydbanner3']=HTTP_SERVER.'image/'.$category_info['ydbanner3'];

			$data['wishlist'] = $this->url->link('account/wishlist/add', '', true);
			$data['delewishlist'] = $this->url->link('account/wishlist/delete', '', true);



 if (isset($this->request->get['path'])) {

			// Set the last category breadcrumb
			$data['breadcrumbs'][] = array(
				'text' => $category_info['name'],
				'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'])
			);
		}else{
				$data['breadcrumbs'][] = array(
				'text' => $category_info['name'],
				'href' => $this->url->link('product/category')
			);
		}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}


			$data['products'] = array();

			$filter_data = array(
				'filter_category_id' => $category_info['category_id'],
				'filter_sub_category' => true,       //dyl add
				'filter_filter'      => $filter,
				// 'hot'      => $category_info['hot'],
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);

			$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

			$results = $this->model_catalog_product->getProducts($filter_data);
			// basic 三个子分类

			$basicresults1 = $this->model_catalog_product->getBasicProducts($filter_data);
			$basicresults2 = $this->model_catalog_product->getBasicProductss($filter_data);
			$basicresults3 = $this->model_catalog_product->getBasiccProductss($filter_data);
			// $basicresults1 = $this->model_catalog_product->getBasicProducts($filter_data);
// print_r($basicresults3);exit;
			foreach ($basicresults1 as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					//$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$price = $this->currency->format($result['price'], $this->session->data['currency']);
				} else {
					$price = false;
				}

			

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special']>0 ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

		
			    $wishlist= $this->model_catalog_product->wishlistornot($result['product_id']);
			    $res = $this->model_catalog_product->getProductImages($result['product_id']); 

 
			    if(!empty($result['special'])){
			    	$specials=$result['special']['special'];
			    	if ($result['special']['percent']>0) {
			    		$percents=$result['special']['percent'];
			    	}else{
			    		$percents=round($result['special']['special']/$result['special']['old_price'],2)*100;
			    	}
			    	
			    	$date_ends=strtotime($result['special']['date_end'])-time();
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
				$data['basicproducts1'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'thumbs'       =>$tmp,
					'hot'	  => $category_info['hot'],
					'date_end'	  => $date_ends,
					'max_name'	  => $result['name'],
					'reviews'	  => $result['reviews'],
					'percent'    => $percents,
					'name'        => utf8_substr(strip_tags($result['name']),0,25).'...',
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $this->currency->format($result['price'],$this->session->data['currency']),
					'special'     => $specials>0? $this->currency->format($specials,$this->session->data['currency']) : '',
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'wishlist'	  =>$wishlist
				);
			}
			foreach ($basicresults2 as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					//$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$price = $this->currency->format($result['price'], $this->session->data['currency']);
				} else {
					$price = false;
				}

			

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special']>0 ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

		
			    $wishlist= $this->model_catalog_product->wishlistornot($result['product_id']);
			    $res = $this->model_catalog_product->getProductImages($result['product_id']); 

 
			    if(!empty($result['special'])){
			    	$specials=$result['special']['special'];
			    	if ($result['special']['percent']>0) {
			    		$percents=$result['special']['percent'];
			    	}else{
			    		$percents=round($result['special']['special']/$result['special']['old_price'],2)*100;
			    	}
			    	
			    	$date_ends=strtotime($result['special']['date_end'])-time();
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
				$data['basicproducts2'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'thumbs'       =>$tmp,
					'hot'	  => $category_info['hot'],
					'date_end'	  => $date_ends,
					'max_name'	  => $result['name'],
					'reviews'	  => $result['reviews'],
					'percent'    => $percents,
					'name'        => utf8_substr(strip_tags($result['name']),0,25).'...',
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $this->currency->format($result['price'],$this->session->data['currency']),
					'special'     => $specials>0? $this->currency->format($specials,$this->session->data['currency']) : '',
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'wishlist'	  =>$wishlist
				);
			}

			foreach ($basicresults3 as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					//$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$price = $this->currency->format($result['price'], $this->session->data['currency']);
				} else {
					$price = false;
				}

			

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special']>0 ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

		
			    $wishlist= $this->model_catalog_product->wishlistornot($result['product_id']);
			    $res = $this->model_catalog_product->getProductImages($result['product_id']); 

 
			    if(!empty($result['special'])){
			    	$specials=$result['special']['special'];
			    	if ($result['special']['percent']>0) {
			    		$percents=$result['special']['percent'];
			    	}else{
			    		$percents=round($result['special']['special']/$result['special']['old_price'],2)*100;
			    	}
			    	
			    	$date_ends=strtotime($result['special']['date_end'])-time();
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
				$data['basicproducts3'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'thumbs'       =>$tmp,
					'hot'	  => $category_info['hot'],
					'date_end'	  => $date_ends,
					'max_name'	  => $result['name'],
					'reviews'	  => $result['reviews'],
					'percent'    => $percents,
					'name'        => utf8_substr(strip_tags($result['name']),0,25).'...',
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $this->currency->format($result['price'],$this->session->data['currency']),
					'special'     => $specials>0? $this->currency->format($specials,$this->session->data['currency']) : '',
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'wishlist'	  =>$wishlist
				);
			}

// 三个子分类结束
			// print_r($results );exit();
			foreach ($results as $result) {
				if ($category_info['hot']==3) {

					if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'],800,480);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

					
				}else{
					if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}
				}

				

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					//$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$price = $this->currency->format($result['price'], $this->session->data['currency']);
				} else {
					$price = false;
				}

			

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special']>0 ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

		
			    $wishlist= $this->model_catalog_product->wishlistornot($result['product_id']);
			    $res = $this->model_catalog_product->getProductImages($result['product_id']); 

 
			    if(!empty($result['special'])){
			    	$specials=$result['special']['special'];
			    	if ($result['special']['percent']>0) {
			    		$percents=$result['special']['percent'];
			    	}else{
			    		$percents=round($result['special']['special']/$result['special']['old_price'],2)*100;
			    	}
			    	
			    	$date_ends=strtotime($result['special']['date_end'])-time();
			    }else{
			    	$specials='';
			    	$percents='';
			    	$date_ends='';
			    }
			    if ($category_info['hot']==3) {
			    	if (isset($res[0]['image'])){
			    	$tmp=$this->model_tool_image->resize($res[0]['image'],800,480);
			    }else{
			    	$tmp=$image;
			    }
			    }else{
			    	if (isset($res[0]['image'])){
			    	$tmp=$this->model_tool_image->resize($res[0]['image'],380,380);
			    }else{
			    	$tmp=$image;
			    }
			    }
			    
				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'thumbs'       =>$tmp,
					'hot'	  => $category_info['hot'],
					'date_end'	  => $date_ends,
					'max_name'	  => $result['name'],
					'reviews'	  => $result['reviews'],
					'percent'    => $percents,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $this->currency->format($result['price'],$this->session->data['currency']),
					'specials'	  => $specials,
					'special'     => $specials>0? $this->currency->format($specials,$this->session->data['currency']) : '',
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'wishlist'	  =>$wishlist
				);
			}
			// print_r($data['products']);exit;
			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();
	 if (isset($this->request->get['path'])) {
				$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			);

			if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
				);
			}

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
			);

			}else{

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/category','sort=p.sort_order&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/category', 'sort=pd.name&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/category', 'sort=pd.name&order=DESC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/category', 'sort=p.price&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/category', 'sort=p.price&order=DESC' . $url)
			);

			if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/category', 'sort=rating&order=DESC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/category', 'sort=rating&order=ASC' . $url)
				);
			}

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/category', 'sort=p.model&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/category', 'sort=p.model&order=DESC' . $url)
			);

}
			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

			sort($limits);

	 if (isset($this->request->get['path'])) {
			foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)
				);
			}
		}else{
				foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/category', '1'  . $url . '&limit=' . $value)
				);
			}
		}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('product/category','path=' . $category_info['category_id'] . '&page={page}');

			$data['pagination'] = $pagination->render();
			
			$data['product_total']=$product_total;
			// $data['page']=$page;
			// print_r($data['pagination']);exit;
			// $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));
			$data['allpage']=ceil($product_total / $limit);		
			if ($page == 1) {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], true), 'canonical');
			} elseif ($page == 2) {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], true), 'prev');
			} else {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page='. ($page - 1), true), 'prev');
			}

			if ($limit && ceil($product_total / $limit) > $page) {
			    $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page='. ($page + 1), true), 'next');
			}

			$data['sort'] = $sort;
			$data['order'] = $order;
			$data['limit'] = $limit;
			$data['category_id'] = $category_info['category_id'];
// print_r($data['category_id']);exit;
			$data['continue'] = $this->url->link('common/home');


			$data['slogans']=$this->config->get('config_meta_slogans');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');


			if($category_info['hot']==1){

				$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($data));
			}elseif($category_info['hot']==2){

				$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($data));
			}elseif($category_info['hot']==3){

				$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($data));
			}elseif($category_info['hot']==4){

				$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($data));				
			}elseif($category_info['hot']==5){

				$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($data));	
			}else{

				$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($data));
			}
		
		}
	}
}
