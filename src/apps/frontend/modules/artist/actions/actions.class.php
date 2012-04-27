<?php

/**
 * artist actions.
 *
 * @package    net.daheardit-records.www
 * @subpackage artist
 * @author     Constructions Incongrues <contact@constructions-incongrues.net>
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class artistActions extends sfActions
{
	/**
	 * @param sfRequest $request A request object
	 */
	 public function executeShow(sfWebRequest $request)
	 {
		// Fetch artist
	 	$artist = Doctrine_Core::getTable('Artist')->findOneBySlugAndCulture($request->getParameter('slug'), $this->getUser()->getCulture());
	 	$this->forward404Unless($artist);

	 	// Fetch releases
	 	$releases = Doctrine_Core::getTable('Release')->findByArtistId($artist->id, Doctrine_Core::HYDRATE_ARRAY);

	 	$artistArray = $artist->toArray();
	 	$artistArray['releases'] = $releases;

		// Pass data to view
		$this->artist = $artistArray;
	}
}
