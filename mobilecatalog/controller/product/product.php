<?php
class ControllerProductProduct extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('product/product');
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => 'Home',
            'href' => $this->url->link('common/home')
        );

        $this->load->model('catalog/category');
        $this->load->model('catalog/review');

        $this->load->model('catalog/product');

        $this->model_catalog_product->delCustomcart();
        // $this->load->model('catalog/manufacturer');

        // if (isset($this->request->get['manufacturer_id'])) {
        //     $data['breadcrumbs'][] = array(
        //         'text' => $this->language->get('text_brand'),
        //         'href' => $this->url->link('product/manufacturer')
        //     );

        //     $url = '';

        //     if (isset($this->request->get['sort'])) {
        //         $url .= '&sort=' . $this->request->get['sort'];
        //     }

        //     if (isset($this->request->get['order'])) {
        //         $url .= '&order=' . $this->request->get['order'];
        //     }

        //     if (isset($this->request->get['page'])) {
        //         $url .= '&page=' . $this->request->get['page'];
        //     }

        //     if (isset($this->request->get['limit'])) {
        //         $url .= '&limit=' . $this->request->get['limit'];
        //     }

        //     $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

        //     if ($manufacturer_info) {
        //         $data['breadcrumbs'][] = array(
        //             'text' => $manufacturer_info['name'],
        //             'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
        //         );
        //     }
        // }

        if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
            $url = '';

            if (isset($this->request->get['search'])) {
                $url .= '&search=' . $this->request->get['search'];
            }

            if (isset($this->request->get['tag'])) {
                $url .= '&tag=' . $this->request->get['tag'];
            }

            if (isset($this->request->get['description'])) {
                $url .= '&description=' . $this->request->get['description'];
            }

            if (isset($this->request->get['category_id'])) {
                $url .= '&category_id=' . $this->request->get['category_id'];
            }

            if (isset($this->request->get['sub_category'])) {
                $url .= '&sub_category=' . $this->request->get['sub_category'];
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
                'text' => $this->language->get('text_search'),
                'href' => $this->url->link('product/search', $url)
            );
        }

        if (isset($this->request->get['product_id'])) {
            $product_id = (int)$this->request->get['product_id'];
        } else {
            $product_id = 0;
        }
        $data['selects']= $this->model_catalog_product->getProductSelects($product_id);
unset($this->session->data['cart_ids']);
        // print_r(  $data['selects']);exit();
       
        $data['options'] = $this->model_catalog_product->getOptionValues();
        $data['coupon'] = $this->url->link('common/coupon');
        
        $this->load->model('catalog/review');
        $resultcoupon = $this->model_catalog_review->getcoupon(0);

        // print_r($resultcoupon);exit;
        if($resultcoupon){
        foreach ($resultcoupon as $key => $value) {

             $coupon= $this->model_catalog_review->couponornot($value['coupon_id']);

             $data['resultcoupons'][] = array(
                'coupon_id'      => $value['coupon_id'],
                'name'          => $value['name'],
                'code'          => $value['code'],
                'discountp'             =>floatval($value['discount']),
                'discount'      =>$this->currency->format(floatval($value['discount']),$this->session->data['currency']), 
                'type'          => $value['type'],
                'coupon'            => $coupon,
                'total'     => $this->currency->format($value['total'],$this->session->data['currency']),
                'date_end' => date($this->language->get('date_format_short'), strtotime($value['date_end']))
                );
        }
        }
        //获取弹窗优惠券
        $resultalertcoupon = $this->model_catalog_review->getalertcoupon();
        
          if($resultalertcoupon){
             $data['resultalertcoupon'] = $resultalertcoupon[0]['code'];
            }
// print_r($data['options']);exit;
        
        $this->load->model('catalog/product');

        $product_info = $this->model_catalog_product->getProduct($product_id);
        $producthot = $this->model_catalog_product->getProcatehot($product_id);
// print_r($product_info);exit;
        if ($product_info) {
            $url = '';

            if (isset($this->request->get['path'])) {
                $url .= '&path=' . $this->request->get['path'];
            }

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['manufacturer_id'])) {
                $url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
            }

            if (isset($this->request->get['search'])) {
                $url .= '&search=' . $this->request->get['search'];
            }

            if (isset($this->request->get['tag'])) {
                $url .= '&tag=' . $this->request->get['tag'];
            }

            if (isset($this->request->get['description'])) {
                $url .= '&description=' . $this->request->get['description'];
            }

            if (isset($this->request->get['category_id'])) {
                $url .= '&category_id=' . $this->request->get['category_id'];
            }

            if (isset($this->request->get['sub_category'])) {
                $url .= '&sub_category=' . $this->request->get['sub_category'];
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
           
            $this->document->setTitle($product_info['meta_title']);
            $this->document->setDescription($product_info['meta_description']);
            $this->document->setKeywords($product_info['meta_keyword']);
            $this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');
            // print_r($product_info);exit();
          

            $data['heading_title'] = $product_info['name'];
            $this->load->model('tool/image');
            if ($product_info['image']) {
                    $data['selfimage'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                } else{
                      $data['selfimage']='';
                }
                // print_r( $data['selfimage']);exit();
            $data['selfhref']    = $this->url->link('product/product', 'product_id=' . $this->request->get['product_id']);
            // print_r($data['selfhref']);exit;
            $data['revi'] = $product_info['reviews'];
            $data['rating'] = $product_info['rating'];
            $data['quantity'] = $product_info['quantity'];
            $data['color'] = $product_info['color'];
            $data['tips'] = $product_info['tips'];
            // $data['hot'] = $producthot['hot'];
            // print_r($product_info);exit();
            
// 
            $data['description'] =html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
            $data['meta_description'] = $product_info['meta_description'];
            $data['wishlist']= $this->model_catalog_product->wishlistornot($product_info['product_id']);
            //折扣前最大 小
            $data['min_price'] = $this->currency->format($product_info['price'], $this->session->data['currency']);
            $data['max_price'] = $this->currency->format($product_info['max_price'], $this->session->data['currency']);
            // 折扣后价格最大 最小

            if ($product_info['special']) {
                 if($product_info['special']['percent']>0){
                        $data['min_prices'] =$this->currency->format($product_info['price']*$product_info['special']['percent']/100, $this->session->data['currency']);
                        $data['max_prices'] = $this->currency->format($product_info['max_price']*$product_info['special']['percent']/100, $this->session->data['currency']);
                               $percent = $product_info['special']['percent'];
                               $data['percent']=100-$percent;

                    }else{
                        $data['min_prices'] = $this->currency->format($product_info['price']-$product_info['special']['price'], $this->session->data['currency']);
                        $data['max_prices'] = $this->currency->format($product_info['max_price']-$product_info['special']['price'], $this->session->data['currency']);
                               $percent =round($product_info['special']['special']/$product_info['special']['old_price'],2)*100;
                               $data['percent']=100-$percent;
                    }              
                }else{
                    $data['min_prices'] =  '';
                      $data['max_prices'] = '';
                        $data['percent']='';
                } 
            $resultsone = $this->model_catalog_review->getReviewsByProductIdone($this->request->get['product_id'],$limit=1);
            // $resultso = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id']);
            // print_r($resultso);exit;
            $this->load->model('tool/image');
            foreach ($resultsone as $result) {
                $review_img = $this->model_catalog_review->getReviewImg($result['review_id']);

                foreach($review_img as $key=>$row){
                    //$review_img[$key]['img'] = HTTP_SERVER.$row['path'];
                    $review_img[$key]['img'] = $this->model_tool_image->resize( $row['images'], 120, 144);
                    $review_img[$key]['min_img'] = $this->model_tool_image->resize($row['images'], 286, 380);
                }

                $data['reviews'][] = array(
                    //'author'     => $result['author'],
                    'author'        => substr($result['author'],0,-2).'***',
                    'text'          => nl2br($result['text']),
                    'length'          => nl2br($result['length']),
                    'style'          => nl2br($result['style']),
                    'rating'        => (int)$result['rating'],
                    //'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                    'date_added'    => date('m/d/Y', strtotime($result['date_added'])),
                    'rating_starts' => $this->ratingStarts($result['rating']),
                    'images'        => $review_img
                );
            }
            $data['text_select'] = $this->language->get('text_select');
            $data['text_manufacturer'] = $this->language->get('text_manufacturer');
            $data['text_model'] = $this->language->get('text_model');
            $data['text_reward'] = $this->language->get('text_reward');
            $data['text_points'] = $this->language->get('text_points');
            $data['text_stock'] = $this->language->get('text_stock');
            $data['text_discount'] = $this->language->get('text_discount');
            $data['text_tax'] = $this->language->get('text_tax');
            $data['text_option'] = $this->language->get('text_option');
            $data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
            $data['text_write'] = 'Write A Review';
            $data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
            $data['text_note'] = $this->language->get('text_note');
            $data['text_tags'] = $this->language->get('text_tags');
            $data['text_quick_overview'] = 'Quick Overview';
            $data['text_related'] = 'Customers Who Bought This Item Also Bought';
            $data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
            $data['text_loading'] = $this->language->get('text_loading');

            $data['entry_qty'] = $this->language->get('entry_qty');
            $data['entry_name'] = $this->language->get('entry_name');
            $data['entry_review'] = $this->language->get('entry_review');
            $data['entry_image'] = 'Image';
            $data['entry_rating'] = $this->language->get('entry_rating');
            $data['entry_good'] = $this->language->get('entry_good');
            $data['entry_bad'] = $this->language->get('entry_bad');

            $data['button_cart'] = $this->language->get('button_cart');
            $data['button_upload'] = $this->language->get('button_upload');
            $data['button_continue'] = $this->language->get('button_continue');

            $data['wishlist_add'] = $this->url->link('account/wishlist/add', '', true);

            $data['delewishlist'] = $this->url->link('account/wishlist/delete', '', true);

            $data['review_tpl'] = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id']);

            //购物车数量
        $data['text_cart_items'] = $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0);

            $data['thumbs'] = $this->model_tool_image->resize($this->config->get('config_images'), 420, 185);
            $data['thumbs_href'] = $this->config->get('config_images_href');
            $this->load->model('catalog/review');

            $data['tab_description'] = $this->language->get('tab_description');
            $data['tab_attribute'] = $this->language->get('tab_attribute');
            $data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);

            $data['product_id'] = (int)$this->request->get['product_id'];

            $data['points'] = $product_info['points'];
            // $data['material'] = $product_info['material'];
            // 
 
            // $data['description'] =html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
            // $data['m_description'] = html_entity_decode($product_info['m_description'], ENT_QUOTES, 'UTF-8');
            // 
           
            //产品属性
            $data['manufacturer'] = $product_info['manufacturer'];
            $data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
            $data['model'] = $product_info['model'];
            // $data['reward'] = $product_info['reward'];
            $data['image'] = 'image/'.$product_info['image'];

            if ($product_info['quantity'] <= 0) {
                $data['stock'] = $product_info['stock_status'];
            } elseif ($this->config->get('config_stock_display')) {
                $data['stock'] = $product_info['quantity'];
            } else {
                $data['stock'] = $this->language->get('text_instock');
            }
            //产品属性,end

            $this->load->model('tool/image');

            $data['placeholder_image'] = $this->model_tool_image->resize('placeholder.png',98,98);

            if ($product_info['image']) {
                $data['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'));
            } else {
                $data['popup'] = '';
            }

            if ($product_info['image']) {
                //$data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'));
                $data['thumb'] = $this->model_tool_image->resize($product_info['image'], 800, 800);
            } else {
                $data['thumb'] = '';
            }

            //如果用户已登录，自动填充询盘用户信息（用户名、邮箱）
            if($this->customer->isLogged()){
                $data['name'] = $this->customer->getFirstName().' '.$this->customer->getLastName();
            }else{
                $data['name'] = '';
            }
            if(!$this->customer->isLogged()){

                if ($_SERVER['HTTPS']) {
                $this->session->data['redirect']='https://'.$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'];
                
            }else{
                $this->session->data['redirect']='http://'.$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'];
            }
            
            $data['numberdeails']=""; 
         }else{
            $this->load->model('account/customer');
            $this->load->model('account/address');
            $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
            if(empty($customer_info['telephone'])){
                $results = $this->model_account_address->getAddresses(); 
                foreach ($results as $result) {
                   $data['numberdeails']= $result['phone'];
                }  
            }else{
              $data['numberdeails'] = $customer_info['telephone'];  
            }

                $data['logins']=1;               
            }
            // print_r(  $this->session->data['userurl']);exit;
             $data['login'] = $this->url->link('account/login');
             if ($_SERVER['HTTPS']) {
                $data['servename'] = 'https://'.$_SERVER['SERVER_NAME'].'/image/';
              }else{ 

                $data['servename'] = 'http://'.$_SERVER['SERVER_NAME'].'/image/';
              }

            if (isset($this->request->post['email'])) {
                $data['email'] = $this->request->post['email'];
            } else {
                $data['email'] = $this->customer->getEmail();
            }

            $data['images'] = array();
            if($producthot){
                $data['hot'] = $producthot['hot'];
                if($data['hot']!=3){
                 $data['images'][] = array(
                
                    'thumb' => $this->model_tool_image->resize($product_info['image'], 540, 540),  //小图
                  
                    'image'=> $this->model_tool_image->resize($product_info['image'], 800, 800),  //小图
                  
                    'thumb2'=> $this->model_tool_image->resize($product_info['image'], 750, 750)
                );
                }

            }else{
                $data['images'][] = array(
                
                    'thumb' => $this->model_tool_image->resize($product_info['image'], 540, 540),  //小图
                  
                    'image'=> $this->model_tool_image->resize($product_info['image'], 800, 800),  //小图
                  
                    'thumb2'=> $this->model_tool_image->resize($product_info['image'], 750, 750)
                );
            }

            
      
            

            // print_r($product_info);exit();
            $results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);
            foreach ($results as $result) {
                if ($result['image']!=$product_info['image']) {
                $data['images'][] = array(
                
                    'thumb' => $this->model_tool_image->resize($result['image'], 540, 540),  //小图
                  
                    'image'=> $this->model_tool_image->resize($result['image'], 800, 800),  //小图
                  
                    'thumb2'=> $this->model_tool_image->resize($result['image'], 750, 750)
                );
            }
            }
// print_r($data['images']);exit;
            
            //包邮
            // if($product_info['free_postage']){
            //     $data['free_shipping'] = $this->language->get('text_free_shipping');
            // }else{
            //     $data['free_shipping'] = '';
            // }
            // 
            // 
            // 
            // print_r($product_info['price']['price']);exit();

        
            $data['price']=$this->currency->format($product_info['price'], $this->session->data['currency']);
            if ($product_info['special']) {
                 $data['special']=$this->currency->format($product_info['special']['special'], $this->session->data['currency']);
            }

            $data['isLogged'] = $this->customer->isLogged();

            if ($this->config->get('config_tax')) {
                $data['tax'] = $this->currency->format((float)$product_info['special']>0 ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
            } else {
                $data['tax'] = false;
            }

            $discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);
            $data['discounts'] = array();
            foreach ($discounts as $discount) {
                $data['discounts'][] = array(
                    'quantity' => $discount['quantity'],
                    'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
                );
            }

            $data['options'] = array();
            $options=$this->model_catalog_product->getProductOptions($this->request->get['product_id']);
           // print_r($options);exit;
            foreach ( $options as $option) {
                $product_option_value_data = array();
                foreach ($option['product_option_value'] as $option_value) {
                    if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
                        if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
                            $price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
                        } else {
                            $price = false;
                        }

                        $product_option_value_data[] = array(
                            'product_option_value_id' => $option_value['product_option_value_id'],
                            'option_value_id'         => $option_value['option_value_id'],
                            'name'                    => $option_value['name'],
                            'remarks'                    => $option_value['remarks'],
                            'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
                            'price'                   => $price,
                            'price_prefix'            => $option_value['price_prefix']
                        );
                    }
                }

                $data['options'][] = array(
                    'product_option_id'    => $option['product_option_id'],
                    'product_option_value' => $product_option_value_data,
                    'option_id'            => $option['option_id'],
                    'name'                 => $option['name'],
                    'type'                 => $option['type'],
                    // 'image'                 =>$this->model_tool_image->resize($option['image'], 50, 50),
                    // 
                    'value'                => $option['value'],
                    'required'             => $option['required']
                );
            }
// print_r($data['options']);exit;

            if ($product_info['minimum']) {
                $data['minimum'] = $product_info['minimum'];
            } else {
                $data['minimum'] = 1;
            }

            if ($this->request->server['HTTPS']) {
                $server = $this->config->get('config_ssl');
            } else {
                $server = $this->config->get('config_url');
            }

            // if ($product_info['video']) {
            //     $data['video'] = $server . 'image/' . $product_info['video'];
            // } else {
            //     $data['video'] = '';
            // }

            // if ($product_info['video_link']) {
            //     $data['video_link'] = $product_info['video_link'];
            // } else {
            //     $data['video_link'] = '';
            // }
            $data['review_status'] = $this->config->get('config_review_status');

            if ($this->config->get('config_review_guest') || $this->customer->isLogged()) {
                $data['review_guest'] = true;
            } else {
                $data['review_guest'] = false;
            }

            if ($this->customer->isLogged()) {
                $data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
            } else {
                $data['customer_name'] = '';
            }

            //评论提交的地址
            $data['reviews_action'] = $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id']);

            // $data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
            // $data['rating'] = (int)$product_info['rating'];
            // print_r($data['rating']);exit;

            // Captcha
            if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
                $data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'));
            } else {
                $data['captcha'] = '';
            }

            $data['share'] = $this->url->link('product/product', 'product_id=' . (int)$this->request->get['product_id']);

            $data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);

           

            $data['tags'] = array();
            if ($product_info['tag']) {
                $tags = explode(',', $product_info['tag']);
                foreach ($tags as $tag) {
                    $data['tags'][] = array(
                        'tag'  => trim($tag),
                        'href' => $this->url->link('product/search', 'tag=' . trim($tag))
                    );
                }
            }


         $this->load->model('catalog/information');

            // $faq = $this->model_catalog_information->getInformation(9);
            // print_r($faq);exit();
            // $data['faq']= html_entity_decode($faq['description'], ENT_QUOTES, 'UTF-8');

            //首页推荐商品
           // print_r($this->request->get['hot']);exit;
            
                // print_r($filter_data);exit;
            $recommend_products = $this->model_catalog_product->getRecommendProducts($this->request->get['product_id'],8);
            // print_r($recommend_products);exit;
            foreach ($recommend_products as $result) {
                // print_r($result);exit;
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
                        $perce=$result['special']['percent'];
                        $percents=100-$perce;
                    }else{
                        $perce=round($result['special']['special']/$result['special']['old_price'],2)*100;
                        $percents=100-$perce;
                    }
                    
                    $date_ends=strtotime($result['special']['date_end'])-time();
                }else{
                    $specials='';
                    $percents='';
                    $date_ends='';
                }
                if (isset($res[0]['image'])) {
                  $thumbs=$this->model_tool_image->resize($res[0]['image'],380,380);
                }else{
                    $thumbs= $image;
                }
                $data['sspecial']=$product_info['special'];
                // print_r( $data['sspecial']);exit;
                $data['products_like'][] = array(
                    'product_id'  => $result['product_id'],
                    'thumb'       => $image,
                    'thumbs'       =>$thumbs,
                    'date_end'    => $date_ends,
                    //'name'        => $result['name'],
                    'max_name'    => $result['name'],
                    'percent'    => $percents,
                    'reviews'     => $result['reviews'],
                    'name'        => utf8_substr(strip_tags($result['name']),0,40).'...',
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                    'price'       => $this->currency->format($result['price'],$this->session->data['currency']),
                    'special'     => $specials>0? $this->currency->format($specials,$this->session->data['currency']) : '',
                    'tax'         => $tax,
                    'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
                    'rating'      => $result['rating'],
                    'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
                    'wishlist'=>$wishlist
                );

            }               
            $data['recurrings'] = $this->model_catalog_product->getProfiles($this->request->get['product_id']);

            $this->model_catalog_product->updateViewed($this->request->get['product_id']);

            $results_rela = $this->model_catalog_product->getProductRelated($product_id);
            // print_r($results_rela);exit;
            foreach ($results_rela[1] as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                }
                $data['products_related'][] = array(
                    'product_id'  => $result['product_id'],
                    'thumb'       => $image,
                    'name'         =>$result['name'],
                    'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
                );
                // print_r($data['products_related']);exit;
            }
            $data['results_relatotal']=$results_rela[0];
            //产品详情页的FAQ
            // $data['product_faq'] = html_entity_decode($this->model_catalog_product->getInformaintion(7),ENT_QUOTES,'UTF-8');

            //产品的评论Reviews
            $this->load->model('catalog/review');

            //该产品的评论总次数
            // $productIdArray = $this->model_catalog_review->getTotalReviewsByRelatePro($product_info['relation_product']);
            // 
            // 
            $productIdString = '';
            // foreach($productIdArray as $k => $v){
            //     $productIdString .= $v['product_id'].',';
            // }
            // 
            // 
            // 
            $productIdString = mb_substr($productIdString,0,-1,'utf-8');

            if($this->request->server['REQUEST_METHOD'] == 'POST' && $this->write()){
                $data['error'] = $this->error;
            }
            //产品浏览量
            // $this->load->model('common/gallery');
            // $this->model_common_gallery->updateProductView($product_id);

            //询盘请求的url   dyl add
            $data['inquiry_url'] = $this->url->link('product/product/addinquiry');
            $this->load->model('localisation/country');
            $data['countries'] = $this->model_localisation_country->getCountries();
            //询盘请求的url  end

            $data['email'] = $this->config->get('config_email');
            //购物车链接
            $data['shopping_cart'] = $this->url->link('checkout/cart');
            if($product_info['special']){
                $data['ends_dates'] = strtotime($product_info['special']['date_end'])-strtotime($product_info['now']);

                $data['sort_orders']=$product_info['special']['sort_orders'];
            }else{
                $data['ends_dates']="";
                $data['sort_orders']="";
            }

// print_r($data['sort_orders']);exit;

            $data['facebook'] = $this->config->get('config_facebook');
         $data['instagram'] = $this->config->get('config_instagram');
              
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');
//            var_dump($data['options']);die;
            $this->response->setOutput($this->load->view('product/product', $data));

        } else {
            $url = '';

            if (isset($this->request->get['path'])) {
                $url .= '&path=' . $this->request->get['path'];
            }

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['manufacturer_id'])) {
                $url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
            }

            if (isset($this->request->get['search'])) {
                $url .= '&search=' . $this->request->get['search'];
            }

            if (isset($this->request->get['tag'])) {
                $url .= '&tag=' . $this->request->get['tag'];
            }

            if (isset($this->request->get['description'])) {
                $url .= '&description=' . $this->request->get['description'];
            }

            if (isset($this->request->get['category_id'])) {
                $url .= '&category_id=' . $this->request->get['category_id'];
            }

            if (isset($this->request->get['sub_category'])) {
                $url .= '&sub_category=' . $this->request->get['sub_category'];
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
                'href' => $this->url->link('product/product', $url . '&product_id=' . $product_id)
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

    public function review() {
       

        $this->load->language('product/product');

        $this->load->model('catalog/review');

        $data['text_no_reviews'] = $this->language->get('text_no_reviews');

        if (isset($this->request->get['page'])) {
                $page = $this->request->get['page'];
            } else {
                $page = 1;
            }
            if (isset($this->request->get['limit'])) {
            $limit = (int)$this->request->get['limit'];
            } else {
                $limit = 10;
            }
        $data['reviews'] = array();

        $product_id = $this->request->get['product_id'];   //产品id
        $this->load->model('catalog/product');

        $product_info = $this->model_catalog_product->getProduct($product_id);
        // print_r($product_info);exit;
        if(!empty($product_info)){

            $this->load->model('catalog/review');

            $filter_data = array(
                'start'              => ($page - 1) * $limit,
                'limit'              => $limit
            );

            $review_total = $this->model_catalog_review->getTotalReviewsByProductId($product_info['product_id']);
            $results = $this->model_catalog_review->getReviewsByProductId($product_info['product_id'],$filter_data);
// 
            $this->load->model('tool/image');
            foreach ($results as $result) {
                $review_img = $this->model_catalog_review->getReviewImg($result['review_id']);

             foreach($review_img as $key=>$row){
                    //$review_img[$key]['img'] = HTTP_SERVER.$row['path'];
                    $review_img[$key]['img'] = $this->model_tool_image->resize( $row['images'], 118, 118);
                    $review_img[$key]['min_img'] = $this->model_tool_image->resize($row['images'], 286, 380);
                }
                $thumbsnot= $this->model_catalog_review->thumbsornot($result['review_id']);
               $thumbstotal =$this->model_catalog_review->getTotalsThumbs($result['review_id']);

                $data['reviews'][] = array(
                    'review_id'     => $result['review_id'],
                    'author'        => substr($result['author'],0,-2).'***',
                    'text'          => nl2br($result['text']),
                    'length'          => nl2br($result['length']),
                    'style'          => nl2br($result['style']),
                    // 'thumbs'          =>$result['thumbs'],
                    'rating'        => (int)$result['rating'],
                    //'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                    'date_added'    => date('m/d/Y', strtotime($result['date_added'])),
                    'rating_starts' => $this->ratingStarts($result['rating']),
                    'images'        => $review_img,
                    'thumbstotal'    =>$thumbstotal,
                    'thumbsnot'    =>$thumbsnot
                );
            }
            // print_r( $data['reviews']);exit;
        }
        if(isset($_SERVER['HTTP_REFERER'])){
            $data['home'] =$_SERVER['HTTP_REFERER'];
        }

        // dianzan
        $data['addthumbs'] = $this->url->link('product/product/addthumbs');
        $data['deletethumbs'] = $this->url->link('product/product/deletethumbs');
        $data['login'] = $this->url->link('account/login');

        $data['revi'] = $product_info['reviews'];
        $data['rating'] = $product_info['rating'];
        $pagination = new Pagination();
        $pagination->total = $review_total;
        $pagination->page = $page;
        $pagination->limit = $limit;
        $pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

        $data['pagination'] = $pagination->render();
        if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }
        $this->document->setTitle($this->language->get('text_errors'));
         $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');
            // $data['heading_title'] = $this->language->get('text_errors');

        $this->response->setOutput($this->load->view('product/review', $data));

    }
    public function addreview() {
       

        $this->load->language('product/product');

        $this->load->model('catalog/review');

        $data['text_no_reviews'] = $this->language->get('text_no_reviews');

        
        if(isset($_SERVER['HTTP_REFERER'])){
            $data['home'] =$_SERVER['HTTP_REFERER'];
        }
        $data['action'] = $this->url->link('product/product/write', true);

        $data['order_id']=$this->request->get['order_id'];
      // print_r($data['order_id']);exit;

         $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');
        $this->response->setOutput($this->load->view('product/addreview', $data));

    }
    public function addthumbs() {

        $json = array();

        if (isset($this->request->post['review_id'])) {
            $review_id = $this->request->post['review_id'];
        } else {
            $review_id = 0;
        }

        $this->load->model('catalog/review');

        $review_info = $this->model_catalog_review->getReview($review_id);

        if ($review_info) {
            if ($this->customer->isLogged()) {
                // Edit customers cart
                $this->load->model('catalog/review');

                $this->model_catalog_review->addThumbs($this->request->post['review_id']);

                $json['success'] = sprintf($this->language->get('text_success'),  $this->url->link('account/wishlist'));

                $json['total'] =  $this->model_catalog_review->getTotalsThumbs($this->request->post['review_id']);
                // print_r($json['total']);
            } else {

                $json['error'] =  $this->url->link('account/login', '', true);
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    public function deletethumbs() {

        $json = array();

        if (isset($this->request->post['review_id'])) {
            $review_id = $this->request->post['review_id'];
        } else {
            $review_id = 0;
        }

        $this->load->model('catalog/review');

        $review_info = $this->model_catalog_review->getReview($review_id);

        if ($review_info) {
            if ($this->customer->isLogged()) {
                // Edit customers cart
                $this->load->model('catalog/review');

                $this->model_catalog_review->deleteThumbs($this->request->post['review_id']);

                $json['success'] = sprintf($this->language->get('text_success'),  $this->url->link('account/wishlist'));

                $json['total'] =  $this->model_catalog_review->getTotalsThumbs($this->request->post['review_id']);
            } else {
               
                $json['error'] =  $this->url->link('account/login', '', true);
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    public function write() {
        // $json = array();
        // $path='';
        //图片上传
        if($_FILES){
            foreach($_FILES['images']['name'] as $key=>$row){
                if($_FILES['images']['error'][$key]==4){
                    continue;
                }
                if($_FILES['images']['error'][$key]!=0){
                    $this->error['error'] = 'Picture format wrong!';
                }else if(!($_FILES['images']['type'][$key]=='image/gif' || $_FILES['images']['type'][$key]=='image/jpeg' || $_FILES['images']['type'][$key]=='image/pjpeg' || $_FILES['images']['type'][$key]=='image/png')){
                    $this->error['error'] = 'Picture format wrong!';
                }else if($_FILES['images']['size'][$key] > 4194304){   //限制图片大小为4M
                    $this->error['error'] = 'Picture size can not exceed 5M!';
                }
            }
        }

        if (empty($this->error['error'])) {
            //没错后,将图片进行迁移,并记录路径入库
            if($_FILES){
                $path = array();
                foreach($_FILES['images']['name'] as $key=>$row){
                    if($_FILES['images']['error'][$key]==4){
                        continue;
                    }
                    if($_FILES['images']['error'][$key]==0){
                        if(($_FILES['images']['type'][$key]=='image/gif' || $_FILES['images']['type'][$key]=='image/jpeg' || $_FILES['images']['type'][$key]=='image/pjpeg' || $_FILES['images']['type'][$key]=='image/png')){
                            $extend = pathinfo($row); //获取文件名数组
                            $extend = strtolower($extend["extension"]);                //获取文件的扩展名
                            $filename = time().rand(100,999).".".$extend;              //文件的新名称
                            $directory = DIR_IMAGE . 'review';
                            $path[] = 'review/' . $filename;
                            move_uploaded_file($_FILES['images']['tmp_name'][$key],$directory . '/' . $filename);
                        }
                    }
                }
            }
            $this->load->model('catalog/review');
            $this->load->model('account/order');
             $orderproduct = $this->model_catalog_review->getProductorder($this->request->post['order_id']);
             $order_products = $this->model_account_order->getOrderProducts($this->request->post['order_id']); 
            foreach ($orderproduct as $key=> $orderprod) {       
                      foreach ($order_products as $key=> $orderpro) {
                          $order_options[$key]['options']= $this->model_account_order->getOrderOptions($this->request->post['order_id'],$orderpro['order_product_id']);
                               foreach ($order_options[$key]['options'] as $key=> $options) { 
                                               
                           $date['orderoption'][]=array(

                                  'name' =>$options['name'],
                              'value' =>$options['value'],
                              );
                            }
                           foreach ($date['orderoption'] as $key => $value) {
                          // $orderoptions= print_r($value['value'].';');
                         $arr[$key] = $value['value'];
                        }
                            
                     }
                 $product_id=$orderprod['product_id'];
                 $this->load->model('account/customer');
                 $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
                 $firstname = $customer_info['firstname'];
                            // print_r($firstname);exit;
                 $this->model_catalog_review->addReview($product_id,$this->request->post ,$path,$firstname,$arr);
                 }
             
             // print_r($arr);exit;
             // $arrs[$key]['option']=$arr;

            // $orderoptionss= substr($orderoptions, 0, -1);
            // $o=$arr[0];
            //  $a=$arr[1];
            //  $c=$arr[2];
            // print_r($c);exit;


             
        }
        $this->response->redirect($this->url->link('account/order', '', true));
    }

    public function getRecurringDescription() {
        $this->load->language('product/product');
        $this->load->model('catalog/product');

        if (isset($this->request->post['product_id'])) {
            $product_id = $this->request->post['product_id'];
        } else {
            $product_id = 0;
        }

        if (isset($this->request->post['recurring_id'])) {
            $recurring_id = $this->request->post['recurring_id'];
        } else {
            $recurring_id = 0;
        }

        if (isset($this->request->post['quantity'])) {
            $quantity = $this->request->post['quantity'];
        } else {
            $quantity = 1;
        }

        $product_info = $this->model_catalog_product->getProduct($product_id);
        $recurring_info = $this->model_catalog_product->getProfile($product_id, $recurring_id);

        $json = array();

        if ($product_info && $recurring_info) {
            if (!$json) {
                $frequencies = array(
                    'day'        => $this->language->get('text_day'),
                    'week'       => $this->language->get('text_week'),
                    'semi_month' => $this->language->get('text_semi_month'),
                    'month'      => $this->language->get('text_month'),
                    'year'       => $this->language->get('text_year'),
                );

                if ($recurring_info['trial_status'] == 1) {
                    $price = $this->currency->format($this->tax->calculate($recurring_info['trial_price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    $trial_text = sprintf($this->language->get('text_trial_description'), $price, $recurring_info['trial_cycle'], $frequencies[$recurring_info['trial_frequency']], $recurring_info['trial_duration']) . ' ';
                } else {
                    $trial_text = '';
                }

                $price = $this->currency->format($this->tax->calculate($recurring_info['price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

                if ($recurring_info['duration']) {
                    $text = $trial_text . sprintf($this->language->get('text_payment_description'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
                } else {
                    $text = $trial_text . sprintf($this->language->get('text_payment_cancel'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
                }

                $json['success'] = $text;
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }


    /**
     * 等级Star
     * @author  dyl  783973660@qq.com  2016.9.7
     * @param   Int     $rating        等级数字
     * return   String  $retingStarts  返回等级描述
     */
    protected function ratingStarts($rating){
        $retingStarts = '';
        $starts = ' Star';

        switch($rating){
            case 1: $retingStarts = 'One'.$starts; break;
            case 2: $retingStarts = 'Two'.$starts; break;
            case 3: $retingStarts = 'Three'.$starts; break;
            case 4: $retingStarts = 'Four'.$starts; break;
            case 5: $retingStarts = 'Five'.$starts; break;
        }

        return $retingStarts;
    }


    /**
     * 产品详情页询盘的提交操作(页面ajax异步提交到这里)
     * @author  dyl  78397360@qq.com  2016.9.27
     */
    public function addinquiry(){

        if($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validate()){

            if( empty($this->error['error_name']) && empty($this->error['error_email']) && empty($this->error['error_content']) ){

                $data['product_id'] = $this->request->post['product_id'];
                $data['customer_id'] = ( $this->customer->isLogged() ) ? $this->customer->getId() : 0;
                $data['name'] = $this->request->post['name'];
                $data['email'] = $this->request->post['email'];

                $data['fixed_line'] = $this->request->post['fixed_line'];
                $data['country_id'] = $this->request->post['country_id'];
                $data['phone'] = $this->request->post['phone'];

                $factime = trim($this->request->post['phone']);
                $whatsapp = trim($this->request->post['whatsapp']);
                $enquiry = trim($this->request->post['content']);
                $str_enquiry = 'Factime&iMesssage ID:' . $factime . "<br>Whtsapp ID:" . $whatsapp . "<br>Comment:" . $enquiry;

                $data['content'] = $str_enquiry;

                $this->load->model('account/inquiry');
                $this->model_account_inquiry->addinquiry($data);

                //将前台传过来的信息写入session，发邮件使用
                $this->session->data['email_message']['product_id'] = isset($this->request->post['product_id']) ? $this->request->post['product_id'] : '';
                $this->session->data['email_message']['name'] = isset($this->request->post['name']) ? $this->request->post['name'] : '';
                $this->session->data['email_message']['email'] = isset($this->request->post['email']) ? $this->request->post['email'] : '';
                $this->session->data['email_message']['fixed_line'] = isset($this->request->post['fixed_line']) ? $this->request->post['fixed_line'] : '';
                $this->session->data['email_message']['country_id'] = isset($this->request->post['country_id']) ? $this->request->post['country_id'] : '';
                $this->session->data['email_message']['phone'] = isset($this->request->post['phone']) ? $this->request->post['phone'] : '';
                $this->session->data['email_message']['whatsapp'] = isset($this->request->post['whatsapp']) ? $this->request->post['whatsapp'] : '';
                $this->session->data['email_message']['content'] = isset($this->request->post['content']) ? $this->request->post['content'] : '';
                $this->session->data['email_message']['pro_name'] = isset($this->request->post['pro_name']) ? $this->request->post['pro_name'] : '';
                $this->session->data['email_message']['pro_model'] = isset($this->request->post['pro_model']) ? $this->request->post['pro_model'] : '';
                $this->session->data['email_message']['send_page'] = isset($this->request->get['route']) ? $this->request->get['route'] : "";

                //$this->sendEmail(); //发送询盘

                $info = array('code'=>1, 'message'=>'Submit successfully');
            }else{
                $data['error_name'] = $this->error['error_name'];
                $data['error_email'] = $this->error['error_email'];
                $data['error_content'] = $this->error['error_content'];
                $info = array('code'=>0, 'message'=>'Submit failed','data'=>$data);
            }

            $inquiryinfo = json_encode($info);
            echo $inquiryinfo;
        }

    }

    /**
     * 验证产品详情页询盘的提交操作
     * @author  dyl 783973660@qq.com  2016.9.27
     */
    public function validate() {

        //$json = array();

        //if ($this->request->server['REQUEST_METHOD'] == 'POST') {

        $this->error['error_name'] =  $this->error['error_email'] = $this->error['error_content'] = '';

        if ( empty(trim($this->request->post['name'])) ){
            //$json['error'] = $this->language->get('error_name');
            $this->error['error_name'] = 'Name cannot be empty!';
        }

        if ( empty(trim($this->request->post['email'])) ) {
            //$json['error'] = $this->language->get('error_text');
            $this->error['error_email'] = 'Email cannot be empty!';
        }

        if( !empty(trim($this->request->post['email'])) && !preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', trim($this->request->post['email'])) ){
            $this->error['error_email'] = 'Mailbox format error!';
        }

        if ( empty(trim($this->request->post['content'])) ) {
            //$json['error'] = $this->language->get('error_rating');
            $this->error['error_content'] = 'Content cannot be empty!';
        }

        if ( !empty(trim($this->request->post['content'])) && utf8_strlen(trim($this->request->post['content'])) < 4 ) {
            //$json['error'] = $this->language->get('error_rating');
            $this->error['error_content'] = 'Your message must be over 4 characters!';
        }

        if( empty($this->error['error_name']) && empty($this->error['error_email']) && empty($this->error['error_content']) ){
            return true;
        }else{
            return $this->error;
        }

        //}

        //$this->response->addHeader('Content-Type: application/json');
        //$this->response->setOutput(json_encode($json));
    }

    /**
     * 产品询盘、Contant页面、Merchant Service页面邮件发送信息提交到这里统一发送
     * @author  dyl 783973660@qq.com 2016.10.13
     */
    public function sendEmail(){

        if(isset($this->session->data['email_message'])){
            $pruduct_id = isset($this->session->data['email_message']['product_id']) ? $this->session->data['email_message']['product_id'] : '';
            $name = isset($this->session->data['email_message']['name']) ? $this->session->data['email_message']['name'] : '';
            $email = isset($this->session->data['email_message']['email']) ? $this->session->data['email_message']['email'] : '';
            $fixed_line = isset($this->session->data['email_message']['fixed_line']) ? $this->session->data['email_message']['fixed_line'] : '';
            $country_id = isset($this->session->data['email_message']['country_id']) ? $this->session->data['email_message']['country_id'] : '';
            $phone = isset($this->session->data['email_message']['phone']) ? $this->session->data['email_message']['phone'] : '';
            $whatsapp = isset($this->session->data['email_message']['whatsapp']) ? $this->session->data['email_message']['whatsapp'] : '';
            $content = isset($this->session->data['email_message']['content']) ? $this->session->data['email_message']['content'] : '';
            $pro_name = isset($this->session->data['email_message']['pro_name']) ? $this->session->data['email_message']['pro_name'] : '';
            $pro_model = isset($this->session->data['email_message']['pro_model']) ? $this->session->data['email_message']['pro_model'] : '';
            $contact_send_page = isset($this->session->data['email_message']['contact_send_page']) ? str_replace('/', '-', $this->session->data['email_message']['contact_send_page']) : '';   //信息联系页面发送邮件的页面
            $send_page = isset($this->session->data['email_message']['send_page']) ? str_replace('/', '-', $this->session->data['email_message']['send_page']) : '';   //发送邮件的页面

            $this->load->model('localisation/country');
            $country_result = $this->model_localisation_country->getCountry($country_id);

            //发送邮件
            $this->load->language('mail/customer');

            //logo
            if ($this->request->server['HTTPS']) {
                $server = $this->config->get('config_ssl');
            } else {
                $server = $this->config->get('config_url');
            }
            if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
                $html_data['logo'] = $server . 'image/' . $this->config->get('config_logo');
            } else {
                $html_data['logo'] = '';
            }

            //获取url的网址参数
            //$QUERY_STRING = explode('=',$_SERVER['QUERY_STRING']);

            $html_data['from_name'] = trim($name);
            $html_data['email'] = trim($email);
            $html_data['tel_number'] = trim($fixed_line);
            $html_data['country_name'] = $country_result['name'];
            $html_data['ip_address'] = $this->request->server['REMOTE_ADDR'];
            $html_data['business_name'] = trim($name);

            $factime = trim($phone);
            $whatsapp = trim($whatsapp);
            $html_data['factime'] = $factime;
            $html_data['whatsapp'] = $whatsapp;
            $html_data['content'] = trim($content);
            $reply_to = trim($email);

            //产品询盘发送邮件
            if(trim($send_page) == 'product-product-addinquiry'){
                $html_data['whatsapp_facetime_mphone'] = trim($phone);
                $html_data['pro_name'] = trim($pro_name);
                $html_data['sku'] = trim($pro_model);
                $html_data['send_page'] = 'product-wholesale-inquiry';
                $view = 'mail/product_email';
                $title = 'Naija Beauty Hair Product Inquiry';
                $this->send($name, $reply_to, $html_data, $view, $title);
            }

            //Contant页面发送邮件
            if(trim($send_page) == 'information-contact'){
                $html_data['send_page'] = $send_page;
                $view = 'mail/contact_us_email';
                $title = 'Naija Beauty Hair Contact Us Inquiry';
                $this->send($name, $reply_to, $html_data, $view, $title);

            }

            //信息页联系我们发送邮件
            if(trim($send_page) == 'information-contact_us-addContactusenquiry'){
                $html_data['send_page'] = $contact_send_page;
                $view = 'mail/contact_us_email';
                $title = 'Naija Beauty Hair Contact Us Inquiry';
                $this->send($name, $reply_to, $html_data, $view, $title);
            }
        }
    }

    /**
     * 封装发送方法
     * @param   String     $name       发件人名字
     * @param   String     $reply_to   发件人邮箱
     * @param   Array      $html_data  邮件信息
     * @param   String     $view       显示模板
     * @param   String     $title      邮件标题
     */
    public function send($name, $reply_to, $html_data, $view, $title){
        $mail = new Mail();
        $mail->protocol = $this->config->get('config_mail_protocol');
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

        $mail->setTo($this->config->get('config_email'));                     //发给系统管理员的邮箱(接收人邮箱)
        $mail->setFrom($this->config->get('config_mail_parameter'));      //发送人
        $mail->setSender(html_entity_decode(trim($name), ENT_QUOTES, 'UTF-8'));    //发送者名字
        //$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
        $mail->setSubject($title);     //邮件标题
        $mail->setReplyTo($reply_to);
        $mail->setHtml($this->load->view($view,$html_data));
        //$mail->setText($message);
        $mail->send();
        unset($this->session->data['email_message']);
    }


    /**
     * 产品价格
     */
    public function getprice() {

        $json = array();

        if (isset($this->request->get['product_id'])) {
            $product_id = (int)$this->request->get['product_id'];
        } else {
            $product_id = 0;
        }
        $options=$this->request->post['option'];
        if (in_array('0', $options)) {
           exit();
        }

            $this->load->model('catalog/product');

            $price=  $this->model_catalog_product->getProductPricebyOptions($product_id,$options);
           // print_r($price);exit;
            if ($price) {
                 $price_c= $this->currency->format($price['price'], $this->session->data['currency']);
                     
                  $json=$price;
                   $json['percent']=100-(round($price['special']/$price['price'],2)*100);
                 if ($price['special']>0) {
                      $price_s= $this->currency->format($price['special'], $this->session->data['currency']);
                       $json['html']= '<span>'.$price_s.'</span><del style="color:#999;font-size:18px;font-weight:normal;">'. $price_c.'</del>';
                  }else{
                    $json['html']= '<span id="make" data='.$price['price'].'>'. $price_c.'</span>'; 

                        // $json['html']= '<span data="$price['price']">'. $price_c.'</span>';  
                    }
            }else{
                $json=array();
            }
           
            // 
            // print_r($json);exit;

         $this->response->addHeader('Content-Type: application/json');
         $this->response->setOutput(json_encode($json));
        
    }
     public function makingdate() {
        $json = array();
        if (isset($this->request->post['data'])) {
            $data = $this->request->post['data'];
        }
        if (isset($this->request->post['ma'])) {
            $ma = $this->request->post['ma'];
        }
        // if($data){
        //     $price_c= $this->currency->format($price['price'], $this->session->data['currency']);
        // }
        if($ma==1){
            $price_w=$this->config->get('config_activity_price');
            $price=$data+$price_w;
            // 
            $price_s= $this->currency->format($price, $this->session->data['currency']);
            $json['price_s']=$price_s;
            // print_r($price_c);exit;
        }else{
            $price_s= $this->currency->format($data, $this->session->data['currency']);
            $json['price_s']=$price_s;

        }
        $this->response->addHeader('Content-Type: application/json');
         $this->response->setOutput(json_encode($json));
     }
}
