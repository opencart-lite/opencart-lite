<?php namespace OpencartLite;
// Version
define('VERSION', '1.0.0');

set_time_limit(0);

// Configuration
require_once('config.php');
   
// Install 
if (!defined('DIR_APPLICATION')) {
	header('Location: install/index.php');
	exit;
}

// Startup
require_once(DIR_SYSTEM . 'startup.php');

// Registry
$registry = new \System\Engine\Registry();

// Loader
$loader = new \System\Engine\Loader($registry);
$registry->set('load', $loader);

// Config
$config = new \System\Library\Config();
$registry->set('config', $config);

// Database 
$db = new \System\Library\DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
$registry->set('db', $db);

// Settings
$query = $db->query("SELECT * FROM " . DB_PREFIX . "setting");

foreach ($query->rows as $setting) {
	if (!$setting['serialized']) {
		$config->set($setting['key'], $setting['value']);
	} else {
		$config->set($setting['key'], unserialize($setting['value']));
	}
}


	$config->set('config_url', HTTP_SERVER);
	$config->set('config_ssl', HTTPS_SERVER);	

// Url
$url = new \System\Library\Url($config->get('config_url'), $config->get('config_use_ssl') ? $config->get('config_ssl') : $config->get('config_url'));
$registry->set('url', $url);

// Log 
$log = new \System\Library\Log($config->get('config_error_filename'));
$registry->set('log', $log);

// Request
$request = new \System\Library\Request();
$registry->set('request', $request);
 
// Response
$response = new \System\Library\Response();
$response->addHeader('Content-Type: text/html; charset=utf-8');
$response->setCompression($config->get('config_compression'));
$registry->set('response', $response);

// Cache
$cache = new \System\Library\Cache();
$registry->set('cache', $cache);

// Session
$session = new \System\Library\Session();
$registry->set('session', $session);

// Language Detection
$languages = array();

$query = $db->query("SELECT * FROM " . DB_PREFIX . "language WHERE status = '1'"); 

foreach ($query->rows as $result) {
	$languages[$result['code']] = $result;
}

$detect = '';

if (isset($request->server['HTTP_ACCEPT_LANGUAGE']) && ($request->server['HTTP_ACCEPT_LANGUAGE'])) {
	$browser_languages = explode(',', $request->server['HTTP_ACCEPT_LANGUAGE']);

	foreach ($browser_languages as $browser_language) {
		foreach ($languages as $key => $value) {
			if ($value['status']) {
				$locale = explode(',', $value['locale']);

				if (in_array($browser_language, $locale)) {
					$detect = $key;
				}
			}
		}
	}
}

if (isset($session->data['language']) && array_key_exists($session->data['language'], $languages) && $languages[$session->data['language']]['status']) {
	$code = $session->data['language'];
} elseif (isset($request->cookie['language']) && array_key_exists($request->cookie['language'], $languages) && $languages[$request->cookie['language']]['status']) {
	$code = $request->cookie['language'];
} elseif ($detect) {
	$code = $detect;
} else {
	$code = $config->get('config_language');
}

if (!isset($session->data['language']) || $session->data['language'] != $code) {
	$session->data['language'] = $code;
}

if (!isset($request->cookie['language']) || $request->cookie['language'] != $code) {
	setcookie('language', $code, time() + 60 * 60 * 24 * 30, '/', $request->server['HTTP_HOST']);
}

$config->set('config_language_id', $languages[$code]['language_id']);
$config->set('config_language', $languages[$code]['code']);

// Language
$language = new \System\Library\Language($languages[$code]['directory']);
$language->load($languages[$code]['filename']);
$registry->set('language', $language);

// Document
$registry->set('document', new \System\Library\Document());

// Customer
$registry->set('customer', new \System\Library\Customer($registry));

// Affiliate
$registry->set('affiliate', new \System\Library\Affiliate($registry));

if (isset($request->get['tracking']) && !isset($request->cookie['tracking'])) {
	setcookie('tracking', $request->get['tracking'], time() + 3600 * 24 * 1000, '/');
}

// Currency
$registry->set('currency', new \System\Library\Currency($registry));

// Weight
$registry->set('weight', new \System\Library\Weight($registry));

// Length
$registry->set('length', new \System\Library\Length($registry));

// Cart
$registry->set('cart', new \System\Library\Cart($registry));

//  Encryption
$registry->set('encryption', new \System\Library\Encryption($config->get('config_encryption')));

// Front Controller
$front = \System\Engine\Front::getInstance($registry);

// Maintenance Mode
//$controller->addPreAction(new \System\Engine\Action('common/maintenance'));

// SEO URL's
//$controller->addPreAction(new \System\Engine\Action('common/seo_url'));

// Router
if (isset($request->get['route'])) {
	$action = new \System\Engine\Action($request->get['route']);
} else {
	$action = new \System\Engine\Action('common/home');
}

// Dispatch
$front->dispatch($action, new \System\Engine\Action('error/not_found'));
//var_dump($controller);
// Output
$response->output();
