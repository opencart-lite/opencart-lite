<?php  namespace Controller\Common;

use Engine\Controller;
use Engine\iController;

class Foot implements iController {
    use Controller;

	public function index() {
        $this->language->load('common/footer');

		$this->data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/foot.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/foot.tpl';
		} else {
			$this->template = 'default/template/common/foot.tpl';
		}
		
		$this->render();
	}
}
?>