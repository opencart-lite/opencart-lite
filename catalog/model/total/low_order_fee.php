<?php   namespace Model\Total;

use Engine\Model;

class Low_order_fee {
    use Model;
	public function getTotal(&$total_data, &$total) {
		if ($this->cart->getSubTotal() && ($this->cart->getSubTotal() < $this->config->get('low_order_fee_total'))) {
			$this->load->language('total/low_order_fee');
		 	
			$total_data[] = array( 
				'code'       => 'low_order_fee',
        		'title'      => $this->language->get('text_low_order_fee'),
        		'text'       => $this->currency->format($this->config->get('low_order_fee_fee')),
        		'value'      => $this->config->get('low_order_fee_fee'),
				'sort_order' => $this->config->get('low_order_fee_sort_order')
			);

			$total += $this->config->get('low_order_fee_fee');
		}
	}
}
?>