<?php namespace Library;

use PDO;
use Engine\CoreException;

class DB {
    private $driver;

    public function __construct($driver, $hostname, $username, $password, $database, $pdo_driver = 'mysql')
    {

        if (file_exists(DIR_DATABASE . $driver . '.php')) {

            if($driver == 'PDO'){
                if(!in_array($pdo_driver, PDO::getAvailableDrivers()))
                    try{
                        throw new CoreException('Error: Not support PDO driver ' . $driver . '!');
                    }
                    catch (CoreException $e) {exit();}
            }

            require_once(DIR_DATABASE . $driver . '.php');

            $driver = '\System\Database\\' . $driver;

        } else {
            try{
                throw new CoreException('Error: Could not load database file ' . $driver . '!');
            }
            catch (CoreException $e) {exit();}
        }

        $this->driver = ($driver == '\System\Database\PDO') ? new $driver($pdo_driver, $hostname, $username, $password, $database) : new $driver($hostname, $username, $password, $database);

    }

    public function query($sql)
    {
        return $this->driver->query($sql);
    }

    public function exec($sql)
    {
        return $this->driver->exec($sql);
    }

    public function quote($value)
    {
        return $this->driver->quote($value);
    }

    public function getLastId()
    {
        return $this->driver->getLastId();
    }
}