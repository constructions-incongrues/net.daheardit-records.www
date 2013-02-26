<?php

require_once dirname(__FILE__).'/../lib/contentGeneratorConfiguration.class.php';
require_once dirname(__FILE__).'/../lib/contentGeneratorHelper.class.php';

/**
 * content actions.
 *
 * @package    net.daheardit-records.www
 * @subpackage content
 * @author     Constructions Incongrues <contact@constructions-incongrues.net>
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class contentActions extends autoContentActions
{
	public function executeClearCache(sfWebRequest $request)
	{
		// Execute cache clear command upon request
		$results = array();
		if ($request->getMethod() == sfWebRequest::POST) {
			$command = sprintf('%s/symfony cache:clear --app=frontend', sfConfig::get('sf_root_dir'));
			exec($command, $results);
			$results[] = $command;
		}

		// Pass data to view
		$this->results = $results;
	}
}
