<?php

// this check prevents access to debug front controllers that are deployed by accident to production servers.
// feel free to remove this, extend it or make something more sophisticated.
$ipWhiteList = array(
    '127.0.0.1', '::1', // Local
    '78.192.130.120'    // rue Saint-Charles
);
if (!in_array(@$_SERVER['REMOTE_ADDR'], $ipWhiteList)) {
//    die('You are not allowed to access this file. Check '.basename(__FILE__).' for more information.');
}

// Composer
require_once(__DIR__.'/../../vendor/autoload.php');

// Symfony
require_once dirname(__FILE__).'/../config/ProjectConfiguration.class.php';

$configuration = ProjectConfiguration::getApplicationConfiguration('frontend', 'dev', true);
sfContext::createInstance($configuration)->dispatch();
