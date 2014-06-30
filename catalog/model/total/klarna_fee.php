<?php   namespace Model\Total;

use Engine\Model;

class Klarna_fee {
    use Model;
	public function getTotal(&$total_data, &$total) {
		if (($this->cart->getSubTotal() < $this->config->get('klarna_fee_total')) && ($this->cart->getSubTotal() > 0) && isset($this->session->data['payment_method']['code']) && $this->session->data['payment_method']['code'] == 'klarna_invoice' || $this->session->data['payment_method']['code'] == 'klarna_pp') {
			$this->load->language('total/klarna_fee');
		 	
			$total_data[] = array( 
				'code'       => 'klarna_fee',
        		'title'      => $this->language->get('text_klarna_fee'),
        		'text'       => $this->currency->format($this->config->get('klarna_fee_fee')),
        		'value'      => $this->config->get('klarna_fee_fee'),
				'sort_order' => $this->config->get('klarna_fee_sort_order')
			);

			$total += $this->config->get('klarna_fee_fee');
		}
	}
}
?>