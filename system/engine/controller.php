<?php namespace Engine;

trait Controller {
	protected $id;
	protected $layout;
	protected $template;
	protected $children = array();
	protected $data = array();
    public $output;
	
	public function __construct() {}

    public function __get($key) {
        return Registry::get($key);
    }

    public function __set($key, $value) {
        Registry::set($key, $value);
    }

	protected function forward($route, $args = array()) {

        $front = Front::getInstance();

        $controller = $front->dispatch(new Action($route, $args), '');

        return $controller->output;
	}

	protected function redirect($url, $status = 302) {
		header('Status: ' . $status);
		header('Location: ' . str_replace(array('&amp;', "\n", "\r"), array('&', '', ''), $url));
		exit();				
	}

	protected function getChild($child, $args = array()) {
		$action = new Action($child, $args);

        if(class_exists($action->getController())) {

            $front = Front::getInstance();

            $controller = $front->dispatch($action, '');

			return $controller->output;

		} else {

            try{
                throw new CoreException('Error: Could not load controller ' . $child . '!');
            }
            catch (CoreException $e) {exit();}

		}		
	}

	protected function render() {
		foreach ($this->children as $child) {
			$this->data[basename($child)] = $this->getChild($child);
		}

		if (file_exists(DIR_TEMPLATE . $this->template)) {
			extract($this->data);
			
      		ob_start();
      
	  		require(DIR_TEMPLATE . $this->template);
      
	  		$this->output = ob_get_contents();

      		ob_end_clean();
      		
			return $this->output;
    	} else {

            try{
                throw new CoreException('Error: Could not load template ' . DIR_TEMPLATE . $this->template . '!');
            }
            catch (CoreException $e) {exit();}

    	}
	}
}
?>