<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');

		$this->load->model('catalog/information');

		$facebook= $this->config->get('config_facebook');
		$instagram = $this->config->get('config_instagram');
		$whatsapp = $this->config->get('config_telephone');

		$data['informations'] = array(
			0 =>array(
				'title'=>'COMPANY',
				'image'=>'/catalog/view/theme/default/img/png/icon_11.png',
				'child'=>array(
						0=>array(
							'title'=>'About Us',
							'url'=>$this->url->link('information/company'),
							),
						1=>array(
							'title'=>'Instagram',
							'url'=>('http://www.instagram.com/'.$instagram),
							),
						2=>array(
							'title'=>'Facebook',
							'url'=>('http://www.facebook.com/'.$facebook),

							),
						3=>array(
							'title'=>'WhatsApp',
							'url'=>('http://api.whatsapp.com/send?phone='.$whatsapp),
							),
					),
				),
			1=>array(
				'title'=>'POLOCIES',
				'image'=>'/catalog/view/theme/default/img/png/icon_11.png',
				'child'=>array(
						0=>array(
							'title'=>'Return Policy',
						'url'=>$this->url->link('information/returnpolicy'),
							),
						1=>array(
							'title'=>'Shipping & Handling',
							'url'=>$this->url->link('information/shipping'),
							),
						2=>array(
							'title'=>'Terms & Conditions',
							'url'=>$this->url->link('information/trems'),

							),
						3=>array(
							'title'=>'VIP Policy',
							'url'=>$this->url->link('information/vip'),
							),
					),
				),
			2=>array(
				'title'=>'POLOCIES',
				'image'=>'/catalog/view/theme/default/img/png/icon_11.png',
				'child'=>array(
						0=>array(
							'title'=>'FAQs',
							'url'=>$this->url->link('information/faqs'),
							),
						1=>array(
							'title'=>'Tutorials',
							'url'=>$this->url->link('information/profile'),
							),
						2=>array(
							'title'=>'Feedback',
							'url'=>$this->url->link('information/help'),

							),
						3=>array(
							'title'=>'About Us',
							'url'=>$this->url->link('information/company'),

							),
					),
				),
		 );

		// $data['informations'] = array();

		// foreach ($this->model_catalog_information->getInformations() as $result) {
		// 	if ($result['bottom']) {
		// 		$data['informations'][] = array(
		// 			'title' => $result['title'],
		// 			'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
		// 		);
		// 	}
		// }

		$data['contac'] = $this->url->link('product/allcategory', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);
		$data['vip'] = $this->url->link('information/vip');


		$data['home'] = $this->url->link('common/home', '', true);
		$data['sername']=$_SERVER['REQUEST_URI'];
		$data['thispage']=$_SERVER['QUERY_STRING'].$_SERVER['REQUEST_URI'];

		$data['me'] = $this->url->link('information/personal', '', true);



		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		return $this->load->view('common/footer', $data);
	}
}
