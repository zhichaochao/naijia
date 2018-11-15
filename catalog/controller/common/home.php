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
			// 
			$this->load->model('catalog/review');


            $results = $this->model_catalog_review->getreviews();
            // print_r($results);exit;
            $this->load->model('tool/image');
            foreach ($results as $result) {
                $review_img = $this->model_catalog_review->getReviewImgs($result['review_id']);
// print_r($review_img);exit;
             foreach($review_img as $key=>$row){
                    //$review_img[$key]['img'] = HTTP_SERVER.$row['path'];
                    $review_img[$key]['img'] = $this->model_tool_image->resize( $row['images'], 112, 112);
                    $review_img[$key]['min_img'] = $this->model_tool_image->resize($row['images'], 400, 400);
                    $review_img[$key]['big_img'] = $this->model_tool_image->resize($row['images'], 600, 600);
                }
                $thumbsnot= $this->model_catalog_review->thumbsornot($result['review_id']);
               $thumbstotal =$this->model_catalog_review->getTotalsThumbs($result['review_id']);

               if (isset($row)) {
                  $thumbs=$this->model_tool_image->resize($row['images'],400,400);
                }else{
                    $thumbs= '';
                }
               $product_info = $this->model_catalog_product->getProduct($result['product_id']);
                $data['allreviews'][] = array(
                    'review_id'     => $result['review_id'],
                    'href'     =>$this->url->link('product/product','product_id='.$result['product_id']),
                    'author'        => substr($result['author'],0,-2).'***',
                    'text'          => nl2br($result['text']),
                    'thumbs'          =>$thumbs,
                    'prothumbs'          =>$this->model_tool_image->resize($product_info['image'],400,400),
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
            // print_r($data['allreviews']);exit;
			// 
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			 $this->load->model('setting/feedback');
			 $result = $this->model_setting_feedback->addFeedback( $this->request->post);

			 if($result){
               $this->session->data['success'] = 'We have received your message, thank you for your advice';

               //发送邮件
               $this->load->language('mail/customer');

               //获取url的网址参数
	           $QUERY_STRING = explode('=',$_SERVER['QUERY_STRING']);

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

		       $this->load->model('localisation/country');
		       // $country_result = $this->model_localisation_country->getCountry($customerResult['country_id']);
		       $data['user_name'] = $this->request->post['user_name'];
		       $data['email'] = $this->request->post['email'];
		       $data['telephone'] = $this->request->post['telephone'];

               // $html_data['from_name'] = $data['user_name'];
               $html_data['email'] = $data['email'];
               $html_data['tel_number'] = $data['telephone'];
               // $html_data['country_name'] = !empty($country_result['name']) ? $country_result['name'] : 'United States';
               // $html_data['business_name'] = $data['user_name'];
               $html_data['ip_address'] = $this->request->server['REMOTE_ADDR'];
               $html_data['send_page'] = $QUERY_STRING[1];
               $html_data['content'] = trim($this->request->post['enquiry']);
               $html_data['factime'] = '';
               $html_data['whatsapp'] = '';

               $message  = $this->language->get('text_website') . ' ' . html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8') . "\n\n";
		       $message .= 'Full Name: ' . $data['user_name'] . "\n\n";
		       $message .= 'Telephone: ' . $data['telephone'] . "\n\n";
		       $message .= $this->language->get('text_email') . ' '  .  $data['email']  . "\n\n";
		       $message .= 'Inquiry Content: '  .  $this->request->post['enquiry'] . "\n\n";

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
               $mail->setSender(html_entity_decode($data['user_name'], ENT_QUOTES, 'UTF-8'));    //发送者名字
               //$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
               $mail->setSubject('Naijia Ask for help');                                             //邮件标题
               // $mail->setHtml($this->load->view('mail/contact_us_email',$html_data));
               $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
               $mail->send();

            }else{
               $this->session->data['error'] = 'Submit your proposal to failure.';
            }
		}
		 //成功提示
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		//失败提示
		if (isset($this->session->data['error'])) {
			$data['error_warning'] = $this->session->data['error'];
			unset($this->session->data['error']);
		} else {
			$data['error_warning'] = '';
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		 // dianzan
        $data['addthumbs'] = $this->url->link('product/product/addthumbs');
        $data['deletethumbs'] = $this->url->link('product/product/deletethumbs');
        $data['login'] = $this->url->link('account/login');

		
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		$data['homes'] = $this->url->link('information/allreviews');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
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
}
