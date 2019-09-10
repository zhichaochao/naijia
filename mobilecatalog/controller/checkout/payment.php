<?php
class ControllerCheckoutPayment extends Controller {
	public function index() {
		// print_r($this->session->data['payment_method']);exit();
		// Validate cart has products and has stock.
		// print_r($this->cart->hasStock());exit();
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))||(!isset($this->session->data['cart_ids'])||!$this->session->data['cart_ids'])||!isset($this->session->data['wait_href'])||!isset($this->session->data['payment_method'])||!isset($this->session->data['payment_address']) ) {
			$this->response->redirect($this->url->link('checkout/cart'));
		}

		
		$data['continue']=$this->session->data['wait_href'];
		$data['jump']=$this->url->link('checkout/checkout');
		

		$data['header'] = $this->load->controller('common/header');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('checkout/payment', $data));
	}
	public function success() {

		$this->load->model('checkout/order');
		// print_r($_FILES);exit();
		

		if($_FILES){
                $path = array();
                foreach($_FILES['bank_receipt']['name'] as $key=>$row){
                    // if($_FILES['bank_receipt']['error'][$key]==4){
                    //     continue;
                    // }
                    if($_FILES['bank_receipt']['error'][$key]==0){
                        if(($_FILES['bank_receipt']['type'][$key]=='image/gif' || $_FILES['bank_receipt']['type'][$key]=='image/jpeg' || $_FILES['bank_receipt']['type'][$key]=='image/pjpeg' || $_FILES['bank_receipt']['type'][$key]=='image/png')){

                            $extend = pathinfo($row); //获取文件名数组

                            $extend = strtolower($extend["extension"]);                //获取文件的扩展名
								// 
                            $filename = date("YmdHis").substr(md5(mt_rand(0,1000)),0,2).".".$extend;              //文件的新名称
                           
                            $directory = DIR_IMAGE . 'receipt/';
                             
                            // $path[] = '../image/receipt/' . $filename;
                            $path[] = '/receipt/' . $filename;
							// 
                           $moveRes=move_uploaded_file($_FILES['bank_receipt']['tmp_name'][$key],$directory.$filename);
                        }
                    }
                }
            }
            // print_r($path);exit;
            if ($moveRes) {
			$this->load->model('account/order');
			$this->model_checkout_order->UploadReceipt($this->request->post['order_id'],$path);
			
		}
		// if(!empty($_FILES['img']['name'])){

		// 	$img = date("YmdHis").substr(md5(mt_rand(0,1000)),0,2).strtolower(strrchr($_FILES['img']['name'],"."));
		// 	$souceName = DIR_IMAGE.'/receipt/'.$img;
		// 	$moveRes=move_uploaded_file($_FILES['img']['tmp_name'],$souceName);
		// 	if (isset($this->request->post['order_id'])&&$this->request->post['order_id']>0) {
		// 		$this->model_checkout_order->UploadReceipt($this->request->post['order_id'],'/receipt/'.$img);
		// 	}

		// }
		$this->load->model('account/order');
		$order_info=$this->model_account_order->getOrder($this->session->data['order_id']);
		$order_status=$this->model_account_order->getOrderStatus($order_info['order_status_id'],$order_info['language_id']);
		$data['whatsapp']=$this->config->get('config_telephone');
		$data['order_number']=$order_info['order_number'];
		$data['order_status']=$order_status;
		$data['continue']=$this->url->link('common/home');
		$data['view_order']=$this->url->link('account/order/info','&order_id='.$this->session->data['order_id']);
		$this->load->model('tool/image');
		// 活动宣传1
		$data['promotion']=$this->config->get('config_meta_promotion');
		$data['promotionimg'] = $this->model_tool_image->resize($this->config->get('config_meta_proimg'), 800, 800);
		//活动宣传2
		$data['promotions']=$this->config->get('config_meta_promotiontwo');
		$data['promotionimgs'] = $this->model_tool_image->resize($this->config->get('config_meta_proimgtwo'), 800, 800);
		// unset($this->session->data['order_id']);
		// print_r($this->session->data['order_id']);exit;
		$data['header'] = $this->load->controller('common/header');
		$data['footer'] = $this->load->controller('common/footer');
	$this->load->model('catalog/hotproduct');
	$this->load->model('catalog/product');
	$this->load->model('tool/image');
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
// print_r($data['hots']);exit();


		$this->response->setOutput($this->load->view('checkout/payment_success', $data));
	}

	
}
