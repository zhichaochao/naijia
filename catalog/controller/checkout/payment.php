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
		


		if(!empty($_FILES['img']['name'])){

			$img = date("YmdHis").substr(md5(mt_rand(0,1000)),0,2).strtolower(strrchr($_FILES['img']['name'],"."));
			$souceName = DIR_IMAGE.'/receipt/'.$img;
			$moveRes=move_uploaded_file($_FILES['img']['tmp_name'],$souceName);
			if (isset($this->request->post['order_id'])&&$this->request->post['order_id']>0) {
				$this->model_checkout_order->UploadReceipt($this->request->post['order_id'],'/receipt/'.$img);
			}

		}


		$data['whatsapp']=$this->config->get('config_telephone');
		$data['order_number']=$order_info['order_number'];
		$data['continue']=$this->url->link('common/home');
		$data['view_order']=$this->url->link('account/order/info','&order_id='.$this->request->post['order_id']);
		unset($this->session->data['order_id']);
		$data['header'] = $this->load->controller('common/header');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('checkout/payment_success', $data));
	}

	
}
