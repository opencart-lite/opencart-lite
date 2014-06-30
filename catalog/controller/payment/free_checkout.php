<?php  namespace Controller\Payment;

use Engine\Controller;
use Engine\iController;

class Free_checkout implements iController {
    use Controller;

	public function index() {
    	$this->data['button_confirm'] = $this->language->get('button_confirm');

		$this->data['continue'] = $this->url->link('checkout/success');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/free_checkout.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/payment/free_checkout.tpl';
		} else {
            $this->template = 'default/template/payment/free_checkout.tpl';
        }
		
		$this->render();		 
	}
	
	public function confirm() {
		$this->load->model('checkout/order');
		
		$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('free_checkout_order_status_id'));
	}
}
?>