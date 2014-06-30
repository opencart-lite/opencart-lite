<?php  namespace Model\Payment;

use Engine\Model;

class Cod {
    use Model;
  	public function getMethod($total) {
		$this->load->language('payment/cod');

		if ($this->config->get('cod_total') > $total) {
			$status = false;
		} elseif (!$this->config->get('cod_geo_zone_id')) {
			$status = true;
		} else {
			$status = false;
		}
		
		$method_data = array();
	
		if ($status) {  
      		$method_data = array( 
        		'code'       => 'cod',
        		'title'      => $this->language->get('text_title'),
				'sort_order' => $this->config->get('cod_sort_order')
      		);
    	}
   
    	return $method_data;
  	}
}
?>