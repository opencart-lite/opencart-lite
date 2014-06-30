<?php namespace Engine;

final class Action {
    protected $_ns = '\Controller';
    protected $_ns_separator = '\\';
	protected $_controller;
	protected $_method;
	protected $_args = array();

	public function __construct($route, $args = array()) {
		$parts = explode('/', str_replace('../', '', (string)$route));

        $this->_controller =  $this->_ns
                            . $this->_ns_separator
                            . ucfirst(array_shift($parts))
                            . $this->_ns_separator
                            . ucfirst(array_shift($parts));

		if ($args) {
			$this->_args = $args;
		}
			
		$method = array_shift($parts);
				
		if ($method) {
			$this->_method = $method;
		} else {
			$this->_method = 'index';
		}
	}

	public function getController() {
		return $this->_controller;
	}
	
	public function getMethod() {
		return $this->_method;
	}
	
	public function getArgs() {
		return $this->_args;
	}
}
?>