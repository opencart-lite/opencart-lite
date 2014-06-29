<?php namespace System\Engine;

trait Controller {
	protected $registry;	
	protected $id;
	protected $layout;
	protected $template;
	protected $children = array();
	protected $data = array();
    public $output;
	
	public function __construct($registry) {
		$this->registry = $registry;
	}
	
	public function __get($key) {
		return $this->registry->get($key);
	}
	
	public function __set($key, $value) {
		$this->registry->set($key, $value);
	}

	protected function forward($route, $args = array()) {
		return new Action($route, $args);
	}

	protected function redirect($url, $status = 302) {
		header('Status: ' . $status);
		header('Location: ' . str_replace(array('&amp;', "\n", "\r"), array('&', '', ''), $url));
		exit();				
	}

	protected function getChild($child, $args = array()) {
		$action = new Action($child, $args);

        if(class_exists($action->getController())) {

            $front = Front::getInstance($this->registry);

            $controller = $front->dispatch($action, '');

			return $controller->output;
		} else {

            try{
                throw new CoreException($this->registry, 'Error: Could not load controller ' . $child . '!');
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
                throw new CoreException($this->registry, 'Error: Could not load template ' . DIR_TEMPLATE . $this->template . '!');
            }
            catch (CoreException $e) {exit();}

    	}
	}
}
?>