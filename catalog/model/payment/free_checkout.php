<?php  namespace Model\Payment;

use Engine\Model;

class Free_checkout {
    use Model;
  	public function getMethod($total) {
		$this->load->language('payment/free_checkout');

		if ($total <= 0) {
			$status = false;
		} else {
			$status = true;
		}

		$method_data = array();

		if ($status) {
			$method_data = array(
				'code'       => 'free_checkout',
				'title'      => $this->language->get('text_title'),
				'sort_order' => $this->config->get('free_checkout_sort_order')
			);
		}

    	return $method_data;
  	}
}
?>