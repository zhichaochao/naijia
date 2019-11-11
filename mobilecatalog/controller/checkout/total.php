<?php
class ControllerCheckoutTotal extends Controller {
	
	public function index() 
	{
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
				$data[$total['code']] = array(
					'title' => $total['title'],
					'value'=> $total['value'],
					'text'  => $this->currency->formats($total['value'], $this->session->data['currency']),
					'texts'  => $this->currency->formats($total['value'], $this->session->data['currency'])
				);
			}
			if(REDUCTION){
				$cart_total=substr($this->currency->format($total['value'], $this->session->data['currency']),1);
            	$this->load->model('catalog/review');
				$fullcoupon = $this->model_catalog_review->getfullCoupon(14);
				if(!empty($fullcoupon)){

					$fulltotal=substr($this->currency->format($fullcoupon['total'], $this->session->data['currency']),1);
					// print_r($fulltotal);
					$code=$fullcoupon['code'];

					if($cart_total>=$fulltotal){
						$this->session->data['coupon']=$code;

						// print_r($cart_total);exit;
					}
				
				}
			}
			// print_r($data);

			return $data;

	}
}
