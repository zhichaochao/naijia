<?php
class ControllerCheckoutSuccess extends Controller {
	public function index() {
		$this->load->language('checkout/success');
			if (isset($this->request->get['order_id'])) {
				$this->session->data['order_id']=$this->request->get['order_id'];
			}
		if (isset($this->session->data['order_id'])) {
			
				$this->load->model('account/order');
			$this->cart->clear();

			// Add to activity log
			if ($this->config->get('config_customer_activity')) {
				$this->load->model('account/activity');

				if ($this->customer->isLogged()) {
					$activity_data = array(
						'customer_id' => $this->customer->getId(),
						'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName(),
						'order_id'    => $this->session->data['order_id']
					);

					$this->model_account_activity->addActivity('order_account', $activity_data);
				} else {
					$activity_data = array(
						'name'     => $this->session->data['guest']['firstname'] . ' ' . $this->session->data['guest']['lastname'],
						'order_id' => $this->session->data['order_id']
					);

					$this->model_account_activity->addActivity('order_guest', $activity_data);
				}
			}
			$order_info=$this->model_account_order->getOrder($this->session->data['order_id']);
			// print_r($order_info);exit();
			// $data['payment'] = $this->load->controller('extension/payment/' . $this->session->data['payment_method']['code']);
			if ($order_info['payment_code']=='bank_transfer') {
				$data['bank']= htmlspecialchars_decode($this->config->get('bank_transfer_bank' . $this->config->get('config_language_id')));
			}else{
				$data['bank']='';
			}
			
		
			$data['add_time']=strtotime($order_info['date_modified']);
			$data['now_time']=strtotime($order_info['now']);
			$data['lest_time']=$data['add_time']+60*30-$data['now_time'];
			// print_r($data['lest_time']);
			// print_r($order_info['date_modified']);
			// print_r(date('Y-m-d H:i',$data['add_time']+60*30));exit();
	
			$data['order_number']=$order_info['order_number'];
			$data['order_id']=$order_info['order_id'];
			$totals=$this->model_account_order->getOrderTotals($this->session->data['order_id']);
			foreach ($totals as $key => $value) {
				$totals[$key]['text']=$this->currency->format($value['value'], $order_info['currency_code']);
			}
			$data['totals']=$totals;
				// print_r($data['totals']);exit();
			$data['upload_receipt']=$this->url->link('checkout/payment/success');

			// print_r($data['bank']);exit();

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['guest']);
			unset($this->session->data['comment']);
			// unset($this->session->data['order_id']);
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);
			unset($this->session->data['totals']);
			unset($this->session->data['cart_ids']);
			unset($this->session->data['message']);
		
		}

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_basket'),
			'href' => $this->url->link('checkout/cart')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_checkout'),
			'href' => $this->url->link('checkout/checkout', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_success'),
			'href' => $this->url->link('checkout/success')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		if ($this->customer->isLogged()) {
			$data['text_message'] = sprintf($this->language->get('text_customer'), $this->url->link('account/account', '', true), $this->url->link('account/order', '', true), $this->url->link('account/download', '', true), $this->url->link('information/contact'));
		} else {
			$data['text_message'] = sprintf($this->language->get('text_guest'), $this->url->link('information/contact'));
		}

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');
		$data['back'] = $this->url->link('account/order');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('checkout/success', $data));
	}
}