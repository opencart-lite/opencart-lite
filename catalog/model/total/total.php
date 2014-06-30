<?php   namespace Model\Total;

use Engine\Model;

class Total {
    use Model;
	public function getTotal(&$total_data, &$total) {
		$this->load->language('total/total');
	 
		$total_data[] = array(
			'code'       => 'total',
			'title'      => $this->language->get('text_total'),
			'text'       => $this->currency->format(max(0, $total)),
			'value'      => max(0, $total),
			'sort_order' => $this->config->get('total_sort_order')
		);
	}
}
?>