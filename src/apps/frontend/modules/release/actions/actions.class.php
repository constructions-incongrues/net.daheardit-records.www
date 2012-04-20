<?php

/**
 * release actions.
 *
 * @package    net.daheardit-records.www
 * @subpackage release
 * @author     Constructions Incongrues <contact@constructions-incongrues.net>
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class releaseActions extends sfActions
{
	public function executeShow(sfWebRequest $request)
	{
		// Fetch release
		$release = Doctrine_Core::getTable('Release')->findOneBySlugAndCulture($request->getParameter('slug'), $this->getUser()->getCulture());
		$this->forward404Unless($release);

		// Setup metadata
		$releaseArray = $release->toArray();
		$this->getResponse()->setTitle(sprintf('[%s] %s - %s', $releaseArray['sku'], $releaseArray['Artist']['name'], $releaseArray['title']));

		// Pass data to view
		$this->release = $releaseArray;
	}
}
