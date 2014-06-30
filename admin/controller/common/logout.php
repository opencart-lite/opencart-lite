<?php  namespace Controller\Common;

use Engine\Controller;
use Engine\iController;

class Logout implements iController {
    use Controller;

	public function index() { 
    	$this->user->logout();
 
 		unset($this->session->data['token']);

		$this->redirect($this->url->link('common/login', '', 'SSL'));
  	}
}  
?>