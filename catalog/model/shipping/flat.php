<?php   namespace Model\Shipping;

use Engine\Model;

class Flat {
    use Model;
    public function getQuote() {
		$this->load->language('shipping/flat');
		

		if (!$this->config->get('flat_geo_zone_id')) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();
	
		if ($status) {
			$quote_data = array();
			
      		$quote_data['flat'] = array(
        		'code'         => 'flat.flat',
        		'title'        => $this->language->get('text_description'),
        		'cost'         => $this->config->get('flat_cost'),
				'text'         => $this->currency->format($this->config->get('flat_cost'))
      		);

      		$method_data = array(
        		'code'       => 'flat',
        		'title'      => $this->language->get('text_title'),
        		'quote'      => $quote_data,
				'sort_order' => $this->config->get('flat_sort_order'),
        		'error'      => false
      		);
		}
	
		return $method_data;
	}
}
?>