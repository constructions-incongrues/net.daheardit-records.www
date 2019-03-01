<?php

// Composer
require_once(dirname(__FILE__).'/../vendor/autoload.php');

// Symfony
require_once(dirname(__FILE__).'/../config/ProjectConfiguration.class.php');

$configuration = ProjectConfiguration::getApplicationConfiguration('frontend', 'prod', false);
sfContext::createInstance($configuration)->dispatch();
