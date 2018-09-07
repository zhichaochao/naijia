<?php
// HTTP
define('HTTP_SERVER', 'http://hotnajia.com/');

// HTTPS
define('HTTPS_SERVER', 'http://hotnajia.com/');

// DIR
define('DIR_ROOT', str_replace('\\', '/', __DIR__).'/');
define('DIR_APPLICATION', DIR_ROOT.'catalog/');
define('DIR_LANGUAGE', DIR_APPLICATION.'language/');
define('DIR_TEMPLATE', DIR_APPLICATION.'view/theme/');
define('DIR_IMAGE', DIR_ROOT.'image/');
define('DIR_SYSTEM', DIR_ROOT.'system/');
define('DIR_CONFIG', DIR_SYSTEM.'config/');
define('DIR_CACHE', DIR_SYSTEM.'storage/cache/');
define('DIR_DOWNLOAD', DIR_SYSTEM.'storage/download/');
define('DIR_LOGS', DIR_SYSTEM.'storage/logs/');
define('DIR_UPLOAD', DIR_SYSTEM.'storage/upload/');
define('DIR_MODIFICATION', DIR_SYSTEM.'storage/modification/');

// DB
define('DB_DRIVER', 'mpdo');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'root');
define('DB_DATABASE', 'naijia');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');
