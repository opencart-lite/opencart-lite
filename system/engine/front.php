<?php namespace Engine;

use ReflectionClass;

final class Front {
    protected static $_instance;
	protected $pre_action = array();
	protected $error;

    private function __construct(){}

    public function addPreAction(Action $pre_action)
    {
		$this->pre_action[] = $pre_action;
	}

    public function dispatch(Action $action, $error)
    {
		$this->error = $error;

        while ($result = array_shift($this->pre_action)) {
            $this->execute($result);
        }

        return $this->execute($action);

  	}
    
	private function execute($action) {
        if (class_exists($action->getController())) {

            $reflection = new ReflectionClass($action->getController());

            if ($reflection->implementsInterface('Engine\IController')) {

                if ($reflection->hasMethod($action->getMethod())) {
                    $controller = $reflection->newInstance();
                    $method = $reflection->getMethod($action->getMethod());
                    $method->invoke($controller, $action->getArgs());
                    //$method->invokeArgs($controller, $action->getArgs());

                } else {
                    try {
                        throw new CoreException('METHOD ' . $action->getMethod() . ' NOT FOUND');
                    } catch (CoreException $e) {
                    }

                }

            } else {
                try {
                    throw new CoreException("INTERFACE IController NOT FOUND");
                } catch (CoreException $e) {
                }

            }

		} else {

            try {
                throw new CoreException('CONTROLLER ' . $action->getController() . ' NOT FOUND');
            } catch (CoreException $e) {
            }

		}

        return $controller;
	}

    //Singleton
    public static function getInstance()
    {
        self::$_instance = !(self::$_instance instanceof self) ? new self() : self::$_instance;
        return self::$_instance;
    }

}
?>