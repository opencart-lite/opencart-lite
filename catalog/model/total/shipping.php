<?php   namespace Model\Total;

use Engine\Model;

class Shipping {
    use Model;
	public function getTotal(&$total_data, &$total) {
		if ($this->cart->hasShipping() && isset($this->session->data['shipping_method'])) {
			$total_data[] = array( 
				'code'       => 'shipping',
        		'title'      => $this->session->data['shipping_method']['title'],
        		'text'       => $this->currency->format($this->session->data['shipping_method']['cost']),
        		'value'      => $this->session->data['shipping_method']['cost'],
				'sort_order' => $this->config->get('shipping_sort_order')
			);

			$total += $this->session->data['shipping_method']['cost'];
		}			
	}
}
?>