<?php namespace System\Engine;

use ReflectionClass;

final class Front {
    protected static $_instance;
	protected $registry;
	protected $pre_action = array();
	protected $error;

    private function __construct($registry)
    {
		$this->registry = $registry;
	}

    public function addPreAction(Actio $pre_action)
    {
		$this->pre_action[] = $pre_action;
	}

    public function dispatch(Action $action, $error)
    {
		$this->error = $error;

        /*foreach ($this->pre_action as $pre_action) {
            $result = $this->execute($pre_action);

            if ($result) {
                $action = $result;

                break;
            }
        }

        while ($action) {
            //$action = $this->execute($action);
        }
        */

        return $this->execute($action);

  	}
    
	private function execute($action) {
        if (class_exists($action->getController())) {

            $reflection = new ReflectionClass($action->getController());

            if ($reflection->implementsInterface('System\Engine\IController')) {

                if ($reflection->hasMethod($action->getMethod())) {
                    $controller = $reflection->newInstance($this->registry);
                    $method = $reflection->getMethod($action->getMethod());
                    $method->invoke($controller, $action->getArgs());
                    //$method->invokeArgs($controller, $action->getArgs());

                } else {
                    try {
                        throw new CoreException($this->registry, 'METHOD ' . $action->getMethod() . ' NOT FOUND');
                    } catch (CoreException $e) {
                    }

                }

            } else {
                try {
                    throw new CoreException($this->registry, "INTERFACE IController NOT FOUND");
                } catch (CoreException $e) {
                }

            }

		} else {

            try {
                throw new CoreException($this->registry, 'CONTROLLER ' . $action->getController() . ' NOT FOUND');
            } catch (CoreException $e) {
            }

		}

        return $controller;
	}

    //Singleton
    public static function getInstance($registry)
    {
        self::$_instance = !(self::$_instance instanceof self) ? new self($registry) : self::$_instance;
        return self::$_instance;
    }

}
?>