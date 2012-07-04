<?php

require_once dirname(__FILE__).'/../lib/vendor/symfony/lib/autoload/sfCoreAutoload.class.php';
sfCoreAutoload::register();

class ProjectConfiguration extends sfProjectConfiguration
{
	public function setup()
	{
        // Enable plugins
		$this->enablePlugins(
			'sfDoctrinePlugin',
			'sfTwitterBootstrapPlugin',
			'sfDoctrineGuardPlugin',
			'sfFeed2Plugin'
		);
	}

	public function configureDoctrine()
	{
		// Force quoting of database identifiers
		$manager = Doctrine_Manager::getInstance();
		$manager->setAttribute(Doctrine::ATTR_QUOTE_IDENTIFIER, true);
	}
}
