<?php namespace OpencartLite;

use Engine;
use Library;

// Version
define('VERSION', '1.0.0');

// Configuration
require_once('config.php');

// Install
if (!defined('DIR_APPLICATION')) {
	header('Location: ../install/index.php');
	exit;
}

// Startup
require_once(DIR_SYSTEM . 'startup.php');

// Loader
$loader = new Engine\Loader();
Engine\Registry::set('load', $loader);

// Config
$config = new Library\Config();
Engine\Registry::set('config', $config);

// Database
$db = new Library\DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
Engine\Registry::set('db', $db);

// Settings
$query = $db->query("SELECT * FROM " . DB_PREFIX . "setting");

foreach ($query->rows as $setting) {
	if (!$setting['serialized']) {
		$config->set($setting['key'], $setting['value']);
	} else {
		$config->set($setting['key'], unserialize($setting['value']));
	}
}

// Url
$url = new Library\Url(HTTP_SERVER, $config->get('config_use_ssl') ? HTTPS_SERVER : HTTP_SERVER);
Engine\Registry::set('url', $url);

// Log
$log = new Library\Log($config->get('config_error_filename'));
Engine\Registry::set('log', $log);

// Request
$request = new Library\Request();
Engine\Registry::set('request', $request);

// Response
$response = new Library\Response();
$response->addHeader('Content-Type: text/html; charset=utf-8');
Engine\Registry::set('response', $response);

// Cache
$cache = new Library\Cache();
Engine\Registry::set('cache', $cache);

// Session
$session = new Library\Session();
Engine\Registry::set('session', $session);

// Language
$languages = array();

$query = $db->query("SELECT * FROM " . DB_PREFIX . "language");

foreach ($query->rows as $result) {
	$languages[$result['code']] = $result;
}

$config->set('config_language_id', $languages[$config->get('config_admin_language')]['language_id']);

// Language
$language = new Library\Language($languages[$config->get('config_admin_language')]['directory']);
$language->load($languages[$config->get('config_admin_language')]['filename']);
Engine\Registry::set('language', $language);

// Document
Engine\Registry::set('document', new Library\Document());

// Currency
Engine\Registry::set('currency', new Library\Currency());

// Weight
Engine\Registry::set('weight', new Library\Weight());

// Length
Engine\Registry::set('length', new Library\Length());

// User
Engine\Registry::set('user', new Library\User());

// Front Controller
$front = Engine\Front::getInstance();

// Login
$front->addPreAction(new Engine\Action('common/home/login'));

// Permission
$front->addPreAction(new Engine\Action('common/home/permission'));

// Router
if (isset($request->get['route'])) {
	$action = new Engine\Action($request->get['route']);
} else {
	$action = new Engine\Action('common/home');
}

// Dispatch
$front->dispatch($action, new Engine\Action('error/not_found'));

// Output
$response->output();

