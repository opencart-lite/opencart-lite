<?php namespace System\Engine;

use Exception;

class CoreException extends Exception
{

    public function __construct($registry, $errstr = '')
    {

        if(!is_object($registry)) exit($registry . "\n" . $errstr);

        $config = $registry->get('config');
        $log = $registry->get('log');
        $traces = $this->getTrace();
        $str_log = $str_display = '';

        $trace = array_shift($traces);

        if (isset($trace['line']) && isset($trace['file'])) {
            $str_display .= '<b>CORE EXCEPTION</b> <i>[' . $trace['class'] . ']</i><b>:</b> ' . $errstr . ' in <b>' . $trace['file'] . '</b> on line <b>' . $trace['line'] . '</b><br>';
            $str_log .= 'CORE EXCEPTION [' . $trace['class'] . ']:  ' . $errstr . ' in ' . $trace['file'] . ' on line ' . $trace['line'] . "\n";
        } else {
            $str_display .= '<br><b>CORE EXCEPTION BLOCK</b><i>' . str_replace('#', '<br>#', $this->getTraceAsString()) . '</i><br><br>';
            $str_log .= "CORE EXCEPTION #\n" . $this->getTraceAsString() . "\n";
        }

        if ($config->get('config_error_display')) {
            echo $str_display;
        }

        if ($config->get('config_error_log')) {
            $log->write($str_log);
        }

    }

}