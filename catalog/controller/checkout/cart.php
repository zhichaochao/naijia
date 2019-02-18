<?php
class ControllerCheckoutCart extends Controller {
	public function index() {
		$this->load->language('checkout/cart');
		if (!isset($this->session->data['cart_ids'])||!$this->session->data['cart_ids']) {
			$this->session->data['cart_ids']=$this->cart->getCartids();
			// print_r(1);exit();
		}
		// print_r($this->session->data['cart_ids']);exit();
		$this->load->model('catalog/product');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('common/home'),
			'text' => $this->language->get('text_home')
		);

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('checkout/cart'),
			'text' => $this->language->get('heading_title')
		);
		// print_r($this->cart->hasProducts(1));exit();

		if ($this->cart->hasProducts(1) || !empty($this->session->data['vouchers'])) {
			$data['heading_title'] = $this->language->get('heading_title');

			$data['text_recurring_item'] = $this->language->get('text_recurring_item');
			$data['text_next'] = $this->language->get('text_next');
			$data['text_next_choice'] = $this->language->get('text_next_choice');

			$data['column_image'] = $this->language->get('column_image');
			$data['column_name'] = $this->language->get('column_name');
			$data['column_model'] = $this->language->get('column_model');
			$data['column_quantity'] = $this->language->get('column_quantity');
			$data['column_price'] = $this->language->get('column_price');
			$data['column_total'] = $this->language->get('column_total');

			$data['button_update'] = $this->language->get('button_update');
			$data['button_remove'] = $this->language->get('button_remove');
			$data['button_shopping'] = $this->language->get('button_shopping');
			$data['button_checkout'] = $this->language->get('button_checkout');

			if (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) {
				$data['error_warning'] = $this->language->get('error_stock');
			} elseif (isset($this->session->data['error'])) {
				$data['error_warning'] = $this->session->data['error'];

				unset($this->session->data['error']);
			} else {
				$data['error_warning'] = '';
			}

			if ($this->config->get('config_customer_price') && !$this->customer->isLogged()) {
				$data['attention'] = sprintf($this->language->get('text_login'), $this->url->link('account/login'), $this->url->link('account/register'));
			} else {
				$data['attention'] = '';
			}

			if (isset($this->session->data['success'])) {
				$data['success'] = $this->session->data['success'];

				unset($this->session->data['success']);
			} else {
				$data['success'] = '';
			}

			$data['action'] = $this->url->link('checkout/cart/edit', '', true);

			if ($this->config->get('config_cart_weight')) {
				$data['weight'] = $this->weight->format($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point'));
			} else {
				$data['weight'] = '';
			}

			$this->load->model('tool/image');
			$this->load->model('tool/upload');

			$data['products'] = array();

			$products = $this->cart->getProducts(1);
			// print_r($products );exit();
			 $cart_total=0;
			foreach ($products as $product) {
				$product_total = 0;
				$cart_total+= $product['total'];

				foreach ($products as $product_2) {
					if ($product_2['product_id'] == $product['product_id']) {
						$product_total += $product_2['quantity'];
					}
				}

				if ($product['minimum'] > $product_total) {
					$data['error_warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
				}

				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
				} else {
					$image = '';
				}

				$option_data = $product['option'];
				

				// foreach ($product['option'] as $option) {
				// 	if ($option['type'] != 'file') {
				// 		$value = $option['value'];
				// 	} else {
				// 		$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

				// 		if ($upload_info) {
				// 			$value = $upload_info['name'];
				// 		} else {
				// 			$value = '';
				// 		}
				// 	}

				// 	$option_data[] = array(
				// 		'name'  => $option['name'],
				// 		'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
				// 	);
				// }

				// Display prices
				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$unit_price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));
					if ($product['old_price']>0) {
						$old_unit_price = $this->tax->calculate($product['old_price'], $product['tax_class_id'], $this->config->get('config_tax'));
						$old_price = $this->currency->format($old_unit_price, $this->session->data['currency']);
					}else{
						$old_price = false;
					}
					
					$price = $this->currency->format($unit_price, $this->session->data['currency']);
					$total = $this->currency->format($unit_price * $product['quantity'], $this->session->data['currency']);
				} else {
					$old_price = false;
					$price = false;
					$total = false;
				}

				$recurring = '';

				if ($product['recurring']) {
					$frequencies = array(
						'day'        => $this->language->get('text_day'),
						'week'       => $this->language->get('text_week'),
						'semi_month' => $this->language->get('text_semi_month'),
						'month'      => $this->language->get('text_month'),
						'year'       => $this->language->get('text_year'),
					);

					if ($product['recurring']['trial']) {
						$recurring = sprintf($this->language->get('text_trial_description'), $this->currency->format($this->tax->calculate($product['recurring']['trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['trial_cycle'], $frequencies[$product['recurring']['trial_frequency']], $product['recurring']['trial_duration']) . ' ';
					}

					if ($product['recurring']['duration']) {
						$recurring .= sprintf($this->language->get('text_payment_description'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
					} else {
						$recurring .= sprintf($this->language->get('text_payment_cancel'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
					}
				}

				$data['products'][] = array(
					'product_id'   => $product['product_id'],
					'cart_id'   => $product['cart_id'],
					'thumb'     => $image,
					'name'      => $product['name'],
					'color'      => $product['color'],
					'model'     => $product['model'],
					'date_end'     => $product['date_end'],
					'old_price'     => $old_price,
					'option'    => $option_data,
					'recurring' => $recurring,
					'quantity'  => $product['quantity'],
					'stock_quantity'  => $product['stock_quantity'],
					'stock'     => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
					'reward'    => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
					'price'     => $price,
					'total'     => $total,
					'wish'			=>$this->model_catalog_product->wishlistornot($product['product_id']),
					'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id'])
				);
			}
            $this->session->data['cart_total']=$cart_total;
			// print_r( $this->session->data['cart_total']);exit();

			// Gift Voucher
			$data['vouchers'] = array();

			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $key => $voucher) {
					$data['vouchers'][] = array(
						'key'         => $key,
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount'], $this->session->data['currency']),
						'remove'      => $this->url->link('checkout/cart', 'remove=' . $key)
					);
				}
			}

	
			$data['thumbs'] = $this->model_tool_image->resize($this->config->get('config_gift_images'), 800, 800);
// print_r($data['totals']);exit();
			$data['continue'] = $this->url->link('common/home');

			if(isset($_SERVER['HTTP_REFERER'])){
			$data['home'] =$_SERVER['HTTP_REFERER'];
			}else{
				$data['home'] =$this->url->link('common/home');
			}

			$data['checkout'] = $this->url->link('checkout/checkout', '', true);

			$this->load->model('extension/extension');

			$data['modules'] = array();
			
			$files = glob(DIR_APPLICATION . '/controller/extension/total/*.php');

			if ($files) {
				foreach ($files as $file) {
					$result = $this->load->controller('extension/total/' . basename($file, '.php'));
					
					if ($result) {
						$data['modules'][] = $result;
					}
				}
			}
			$data['text_select'] = $this->language->get('text_select');
					$data['text_none'] = $this->language->get('text_none');
			$this->load->model('localisation/country');

			$data['countries'] = $this->model_localisation_country->getCountries();
			$data['shippingorpick']=isset($this->session->data['shippingorpick'])?$this->session->data['shippingorpick']:'shipping';



			if ($this->customer->isLogged()) {
				$data['country_id']=isset($this->session->data['shipping_address']['country_id'])?$this->session->data['shipping_address']['country_id']:'';
			}else{
				$data['country_id']='156';
			}

			

			// print_r($data['country_id']);exit;
			$data['zone_id']=isset($this->session->data['shipping_address']['zone_id'])?$this->session->data['shipping_address']['zone_id']:'';

			$data['cart_ids'] = explode(',',$this->session->data['cart_ids']);
			 $data['message_submit'] = $this->url->link('checkout/cart/message', '', true);
			 $data['cart_total_href'] = $this->url->link('checkout/cart/total', '', true);
			 $data['address_cost'] = $this->url->link('checkout/cart/cost', '', true);
			 $data['cart_remove'] = $this->url->link('checkout/cart/remove', '', true);
			 $data['cart_editnum'] = $this->url->link('checkout/cart/editnum', '', true);
 			$data['wishlist_add'] = $this->url->link('account/wishlist/add', '', true);
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			// print_r($this->session->data['message']);exit();
			$data['message'] =isset($this->session->data['comment'])?$this->session->data['comment']:'';

			$this->response->setOutput($this->load->view('checkout/cart', $data));
		} else {
			$data['heading_title'] = $this->language->get('heading_title');

			$data['text_error'] = $this->language->get('text_empty');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			if(isset($_SERVER['HTTP_REFERER'])){
			$data['home'] =$_SERVER['HTTP_REFERER'];
			}else{
				$data['home'] =$this->url->link('common/home');
			}
			$data['shopping'] =$this->url->link('product/hotcategory', '', true);

			unset($this->session->data['success']);
			$data['products']='';
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('checkout/cart', $data));
		}
	}

	public function total() {
			$this->session->data['cart_ids']=$this->request->post['ids'];
			$totals=$this->load->controller('checkout/total');

			$data['totals'] =$totals;

		

// print_r($data['totals']);exit();
			$data['continue'] = $this->url->link('common/home');

			$data['checkout'] = $this->url->link('checkout/checkout', '', true);

			$this->load->model('extension/extension');

			$data['modules'] = array();
			
			$files = glob(DIR_APPLICATION . '/controller/extension/total/*.php');

			if ($files) {
				foreach ($files as $file) {
					$result = $this->load->controller('extension/total/' . basename($file, '.php'));
					
					if ($result) {
						$data['modules'][] = $result;
					}
				}
			}
			$this->load->model('catalog/review');
			$cart_total=$this->session->data['cart_total'];
			// print_r($cart_total);exit;
			$resultcoupon = $this->model_catalog_review->getCustomerUseCoupon();
		// print_r($resultcoupon);exit;
			if(!empty($resultcoupon)){
				foreach ($resultcoupon as $results) {
				$data['coupons'][] = array(
					'coupon_id'=>$results['coupon_id'],
					'name'=>$results['name'],
					'type'=>$results['type'],
					'code'=>$results['code'],
					'cart_total'=>$results['total']<$cart_total?'0':'1',
					'discountp'=>floatval($results['discount']),
					'discount'=>$this->currency->format(floatval($results['discount']),$this->session->data['currency'])
					);

				}
			}
			// print_r($data['coupons']);exit;
			$data['checkout'] = $this->url->link('checkout/checkout', '', true);
			$data['coupon_url'] = $this->url->link('checkout/cart/couponuse', '', true);
			$data['delcoupon_url'] = $this->url->link('checkout/cart/delcouponuse', '', true);

		$this->response->setOutput($this->load->view('checkout/total', $data));
	}
	 	public function delcouponuse()
	{
			$json = array();
			$this->session->data['coupon']=$this->request->post['coupon'];
			 unset($this->session->data['coupon']);
			 $totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;

			// Because __call can not keep var references so we put them into an array.
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);

			$this->load->model('extension/extension');

			$sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');
			// print_r($results );exit();

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/total/' . $result['code']);

					// We have to put the totals in an array so that they pass by reference.
					$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
				}
			}
			// print_r($this->session->data['reward']);

			$sort_order = array();

			foreach ($totals as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $totals);

				foreach ($totals as $total) {
				$json[$total['code']] = array(
					'title' => $total['title'],
					'value'=> $total['value'],
					'text'  => $this->currency->format($total['value'], $this->session->data['currency'])
				);
			}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
		public function couponuse()
	{

		$json = array();
		$this->session->data['coupon']=$this->request->post['coupon'];

		$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;

			// Because __call can not keep var references so we put them into an array.
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);

			$this->load->model('extension/extension');

			$sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');
			// print_r($results );exit();

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/total/' . $result['code']);

					// We have to put the totals in an array so that they pass by reference.
					$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
				}
			}
			// print_r($this->session->data['reward']);

			$sort_order = array();

			foreach ($totals as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $totals);

				foreach ($totals as $total) {
				$json[$total['code']] = array(
					'title' => $total['title'],
					'value'=> $total['value'],
					'text'  => $this->currency->format($total['value'], $this->session->data['currency'])
				);
			}
// unset($this->session->data['coupon']);





		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
		# code...
	}
	public function cost()
	{

		$json = array();
		$this->session->data['shipping_address']['country_id']=$this->request->post['country_id'];
		$this->session->data['shipping_address']['zone_id']=$this->request->post['zone_id'];
		$method_data = array();

			$this->load->model('extension/extension');

			$results = $this->model_extension_extension->getExtensions('shipping');


			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/shipping/' . $result['code']);

					$quote = $this->{'model_extension_shipping_' . $result['code']}->getQuote($this->session->data['shipping_address']);

					if ($quote) {
						
						foreach ($quote['quote']as $key => $value) {
							if ($value['text']) {
								$json['cost']= $value['text'];
								break;
							}
						}
					
					}
				}
			}
			// $json['method_data']=$method_data;

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

    

	public function add() {
		$this->load->language('checkout/cart');

		$json = array();

		if (isset($this->request->post['product_id'])) {
			$product_id = (int)$this->request->post['product_id'];
		} else {
			$product_id = 0;
		}
// print_r($this->request->post);exit;
		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			if (isset($this->request->post['quantity']) && ((int)$this->request->post['quantity'] >= $product_info['minimum'])) {
				$quantity = (int)$this->request->post['quantity'];
			} else {
				$quantity = $product_info['minimum'] ? $product_info['minimum'] : 1;
			}

			if (isset($this->request->post['option'])) {
				$option = array_filter($this->request->post['option']);
			} else {
				$option = array();
			}

			$product_select_id= $this->model_catalog_product->getProductSelectId($this->request->post['product_id'],$option);
			if (!$product_select_id>0) {
				$json['error']='stockout';
			}
			// print_r($product_select_id);exit();

			// $product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);

			// foreach ($product_options as $product_option) {
			// 	if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
			// 		$json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
			// 	}
			// }


			if (isset($this->request->post['recurring_id'])) {
				$recurring_id = $this->request->post['recurring_id'];
			} else {
				$recurring_id = 0;
			}

			$recurrings = $this->model_catalog_product->getProfiles($product_info['product_id']);

			if ($recurrings) {
				$recurring_ids = array();

				foreach ($recurrings as $recurring) {
					$recurring_ids[] = $recurring['recurring_id'];
				}

				if (!in_array($recurring_id, $recurring_ids)) {
					$json['error']['recurring'] = $this->language->get('error_recurring_required');
				}
			}

			if (!$json) {
				$this->cart->add($this->request->post['product_id'], $quantity, $product_select_id, $recurring_id);

				$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('checkout/cart'));

				// Unset all shipping and payment methods
				unset($this->session->data['shipping_method']);
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['payment_method']);
				unset($this->session->data['payment_methods']);

				$json['total'] = $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0);
			} else {
				$json['redirect'] = str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']));
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function edit() {
		$this->load->language('checkout/cart');

		$json = array();

		// Update
		if (!empty($this->request->post['quantity'])) {
			foreach ($this->request->post['quantity'] as $key => $value) {
				$this->cart->update($key, $value);
			}

			$this->session->data['success'] = $this->language->get('text_remove');

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['reward']);

			$this->response->redirect($this->url->link('checkout/cart'));
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	public function message() {
		$this->session->data['comment']=$this->request->post['content'];
		$this->session->data['shippingorpick']=$this->request->post['shippingorpick'];
		if ($this->session->data['shippingorpick']=='pick') {
			$this->session->data['shipping_address']['country_id']=156;
			$this->session->data['shipping_address']['zone_id']=2412;
		}else{
			$this->session->data['shipping_address']['country_id']=$this->request->post['country_id'];
			$this->session->data['shipping_address']['zone_id']=$this->request->post['zone_id'];
		}
		$json=array();
		$json['href']=$this->url->link('checkout/checkout', '', true);
		if (!$this->request->post['ids']) {
			$json['error']='at least one product';
		}else{
			$this->session->data['cart_ids']=$this->request->post['ids'];
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	public function editnum() {
		$this->load->language('checkout/cart');

		$json = array();

		// Update
		if (!empty($this->request->post['num'])) {
			
			$this->cart->update($this->request->post['id'],$this->request->post['num']);
			$this->session->data['success'] = $this->language->get('text_remove');
			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['reward']);
			$json['id']=$this->request->post['id'];
			$json['total']='';

			$products = $this->cart->getProducts();
			foreach ($products as $key => $value) {
				if ($value['cart_id']==$this->request->post['id']) {
					$tmp=$value['total'];
					if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
						$unit_price = $this->tax->calculate($tmp, $value['tax_class_id'], $this->config->get('config_tax'));
					
						$json['total'] = $this->currency->format($unit_price, $this->session->data['currency']);
						$json['totals'] = $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0);
					}
					
				}
			}

		
		}


		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function remove() {
		$this->load->language('checkout/cart');

		$json = array();
		// print_r($this->request->post);exit();

		// Remove
		if (isset($this->request->post['key'])) {
			$this->cart->remove($this->request->post['key']);

			unset($this->session->data['vouchers'][$this->request->post['key']]);

			$json['success'] = $this->language->get('text_remove');

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['reward']);
			$this->session->data['cart_ids']=$this->request->post['ids'];

			// Totals
			$this->load->model('extension/extension');

			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;

			// Because __call can not keep var references so we put them into an array. 			
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);

			// Display prices
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$sort_order = array();

				$results = $this->model_extension_extension->getExtensions('total');

				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}

				array_multisort($sort_order, SORT_ASC, $results);

				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('extension/total/' . $result['code']);

						// We have to put the totals in an array so that they pass by reference.
						$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
					}
				}

				$sort_order = array();

				foreach ($totals as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}

				array_multisort($sort_order, SORT_ASC, $totals);
			}

			$json['total'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $this->session->data['currency']));
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
}
