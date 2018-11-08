<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// print_r($this->url->link('product/hotcategory'));exit();
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');
		$data['facebook'] = $this->config->get('config_facebook');
		$data['instagram'] = $this->config->get('config_instagram');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '/catalog/view/theme/default/img/png/logo.png';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] =  $this->model_account_wishlist->getTotalWishlist();
		} else {
			$data['text_wishlist'] =  (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0);
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['search_url'] = $this->url->link('product/search');
		$data['searchdel'] = $this->url->link('common/header/delete');

		$data['category'] = $this->url->link('product/category');
		$data['hotcategory'] = $this->url->link('product/hotcategory');
		$data['boxcategory'] = $this->url->link('product/boxcategory');

		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');
		$data['login_li'] = $this->url->link('account/order', '', true);

		$facebook= $this->config->get('config_facebook');
		$instagram = $this->config->get('config_instagram');
		$whatsapp = $this->config->get('config_telephone');

		$data['facebook']=$facebook;
		$data['instagram']=$instagram;
		$data['whatsapp']=$whatsapp;

		// $data['informations'] = array(
		// 	0 =>array(
		// 		'title'=>'COMPANY',
		// 		'image'=>'/catalog/view/theme/default/img/png/icon_11.png',
		// 		'child'=>array(
		// 				0=>array(
		// 					'title'=>'About Us',
		// 					'url'=>$this->url->link('information/company'),
		// 					),
		// 				1=>array(
		// 					'title'=>'Instagram',
		// 					'url'=>('http://www.instagram.com/'.$instagram),
		// 					),
		// 				2=>array(
		// 					'title'=>'Facebook',
		// 					'url'=>('http://www.facebook.com/'.$facebook),

		// 					),
		// 				3=>array(
		// 					'title'=>'What App',
		// 					'url'=>('http://api.whatsapp.com/send?phone='.$whatsapp),
		// 					),
		// 			),
		// 		),
		// 	1=>array(
		// 		'title'=>'POLOCIES',
		// 		'image'=>'/catalog/view/theme/default/img/png/icon_11.png',
		// 		'child'=>array(
		// 				0=>array(
		// 					'title'=>'Return Policy',
		// 				'url'=>$this->url->link('information/returnpolicy'),
		// 					),
		// 				1=>array(
		// 					'title'=>'Shipping & Handling',
		// 					'url'=>$this->url->link('information/shipping'),
		// 					),
		// 				2=>array(
		// 					'title'=>'Terms & Conditions',
		// 					'url'=>$this->url->link('information/trems'),

		// 					),
		// 				3=>array(
		// 					'title'=>'VIP Policy',
		// 					'url'=>$this->url->link('information/information'),
		// 					),
		// 			),
		// 		),
		// 	2=>array(
		// 		'title'=>'POLOCIES',
		// 		'image'=>'/catalog/view/theme/default/img/png/icon_11.png',
		// 		'child'=>array(
		// 				0=>array(
		// 					'title'=>'FAQs',
		// 					'url'=>$this->url->link('information/faqs'),
		// 					),
		// 				1=>array(
		// 					'title'=>'Tutorials',
		// 					'url'=>$this->url->link('information/profile'),
		// 					),
		// 				2=>array(
		// 					'title'=>'Feedback',
		// 					'url'=>$this->url->link('information/help'),

		// 					),
		// 			),
		// 		),
		//  );
		//购物车数量
		$data['text_cart_items'] = $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0);
		// Menu
		$this->load->model('catalog/category');
		

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);
		// print_r($categories);exit();

		foreach ($categories as $category) {
			if ($category['top']&&$category['category_id']!=67) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
					
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
						'category_id'=>$category['category_id'],
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}
		// print_r(	$this->request->get['path']);;exit();
		// 搜索历史
		// if($this->customer->isLogged()){
		$ip=$this->request->server['REMOTE_ADDR'];
		// print_r($ip);exit;
		$searchres = $this->model_extension_extension->getSearch($ip);
		// print_r($searchres);exit;
		if(!empty($searchres)){
			foreach ($searchres as $searres) {
			$data['searchhistory'][] = array(
						'id'=>$searres['id'],
						'keywords'=>$searres['keywords']
				);
			}
		}
		$data['customer_id']=$this->customer->getId();
	// }

		// print_r($data['customer_id']);exit();
		// 热门搜索
			$str=$this->config->get('config_meta_keywords');

			$data['hotsearched'] =explode(",",$str);
			$data['slogan']=$this->config->get('config_meta_slogan');
// print_r($slogan);exit;

		$this->load->model('account/customer');
$data['action'] = $this->url->link('common/home');
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
		// $data['user_name'] = $this->customer->getFirstName().' '.$this->customer->getLastName();
  //       if($data['user_name'] == ' ') $data['user_name'] = $this->customer->getEmail();

		





		$data['hothref'] = $this->url->link('product/hotcategory');
		$data['acchref'] = $this->url->link('product/acccategory');
		$data['blog'] = $this->url->link('information/profile');
		$data['aboutus'] = $this->url->link('information/company');
		$data['lagosstore'] = $this->url->link('information/lagosstore');
		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['mcurrency'] = $this->load->controller('common/mcurrency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}
// print_r($this->request->get['route']);exit();

		return $this->load->view('common/header', $data);
	}
	public function delete() {
		$id=$this->request->post['id'];
		$ip=$this->request->server['REMOTE_ADDR'];
		$json = array();
		// $this->load->model('extension/extension');
		// $product_info = $this->model_extension_extension->getOrder($order_id);
		// if ($product_info) {
			// if ($this->customer->isLogged()) {
				$this->load->model('extension/extension');
				$this->model_extension_extension->deleteSearch($id,$ip);
			// }
		// }
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	// public function helpbok()
	// {
	
	// }
}
