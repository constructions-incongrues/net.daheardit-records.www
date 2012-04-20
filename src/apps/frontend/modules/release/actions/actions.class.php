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
		
		// Guess next and previous releases (THIS IS SO UGLY)
		$previous = null;
		$next = null;
		$number = (int)substr($releaseArray['slug'], 4);
		if ($number > 1) {
			$previous = $number - 1;
			if ($previous < 10) {
				$previous = '0'.$previous;
			}
		}
		$next = $number + 1;
		if ($next < 10) {
			$next = '0'.$next;
		}

		// Pass data to view
		$this->release = $releaseArray;
		$this->next = $next;
		$this->previous = $previous;
	}
}
