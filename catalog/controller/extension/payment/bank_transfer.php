<?php
class ControllerExtensionPaymentBankTransfer extends Controller {
	public function index() {
		$this->load->language('extension/payment/bank_transfer');

		$data['text_instruction'] = $this->language->get('text_instruction');
		$data['text_description'] = $this->language->get('text_description');
		$data['text_payment'] = $this->language->get('text_payment');
		$data['text_loading'] = $this->language->get('text_loading');

		$data['button_confirm'] = $this->language->get('button_confirm');

		$data['bank'] = nl2br($this->config->get('bank_transfer_bank' . $this->config->get('config_language_id')));
		$this->session->data['wait_href']=$this->url->link('extension/payment/bank_transfer/confirm', '', true);


		$data['continue'] = $this->url->link('checkout/payment', '', true);

		return $this->load->view('extension/payment/bank_transfer', $data);
	}

	public function confirm() {

		if ($this->session->data['payment_method']['code'] == 'bank_transfer') {
			$this->load->language('extension/payment/bank_transfer');

			$this->load->model('checkout/order');

			$comment  = $this->language->get('text_instruction') . "\n\n";
			$comment .=  htmlspecialchars_decode($this->config->get('bank_transfer_bank' . $this->config->get('config_language_id'))) . "\n\n";
			$comment .= $this->language->get('text_payment');
	

			$this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $this->config->get('bank_transfer_order_status_id'), $comment, true);
			$json['href']=$this->url->link('checkout/success');
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
	}
}