<?php namespace OpencartLite;

use Engine;
use Library;

// Version
define('VERSION', '1.0.0');

// Configuration
require_once('config.php');
   
// Install 
if (!defined('DIR_APPLICATION')) {
	header('Location: install/index.php');
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


	$config->set('config_url', HTTP_SERVER);
	$config->set('config_ssl', HTTPS_SERVER);

// Url
$url = new Library\Url($config->get('config_url'), $config->get('config_use_ssl') ? $config->get('config_ssl') : $config->get('config_url'));
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
$response->setCompression($config->get('config_compression'));
Engine\Registry::set('response', $response);

// Cache
$cache = new Library\Cache();
Engine\Registry::set('cache', $cache);

// Session
$session = new Library\Session();
Engine\Registry::set('session', $session);

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
$language = new Library\Language($languages[$code]['directory']);
$language->load($languages[$code]['filename']);
Engine\Registry::set('language', $language);

// Document
Engine\Registry::set('document', new Library\Document());

// Customer
Engine\Registry::set('customer', new Library\Customer());

// Affiliate
Engine\Registry::set('affiliate', new Library\Affiliate());

if (isset($request->get['tracking']) && !isset($request->cookie['tracking'])) {
	setcookie('tracking', $request->get['tracking'], time() + 3600 * 24 * 1000, '/');
}

// Currency
Engine\Registry::set('currency', new Library\Currency());

// Weight
Engine\Registry::set('weight', new Library\Weight());

// Length
Engine\Registry::set('length', new Library\Length());

// Cart
Engine\Registry::set('cart', new Library\Cart());

//  Encryption
Engine\Registry::set('encryption', new Library\Encryption($config->get('config_encryption')));

// Front Controller
$front = Engine\Front::getInstance();

// Maintenance Mode
$front->addPreAction(new Engine\Action('common/maintenance'));

// SEO URL's
$front->addPreAction(new Engine\Action('common/seo_url'));

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

//////////////////////////////////////////////////////////////////////////////////////////////////////
//$ccc = glob(DIR_APPLICATION . "controller/*/*.php");
//$i = 0;
//foreach (glob(DIR_APPLICATION . "controller/*/*.php") as $filename) {
//    $old_filename =  $ccc[$i];
//    $new_filename = str_replace(basename($filename), ucfirst(basename($filename)), $old_filename);
//    //var_dump($new_filename);
//    rename($old_filename, $new_filename);
//    $i++;
//}