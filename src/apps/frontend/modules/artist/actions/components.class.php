<?php

class artistComponents extends sfComponents
{
	/**
 	 * Lists artists.
 	 *
 	 * @param sfRequest $request A request object
	 */
	public function executeList(sfWebRequest $request)
	{
		// Fetch artists
		$q = Doctrine_Query::create()
			->from('Artist');
		$artists = $q->execute(array(), Doctrine_Core::HYDRATE_ARRAY);

		// Fixup images
		for ($i = 0; $i < count($artists); $i++) {
			$image = $artists[$i]['slug'].'.jpg';
			if (!is_readable(sprintf('%s/frontend/pics/artists/%s', sfConfig::get('sf_web_dir'), $image))) {
				$image = 'img-artist-default.png';
			}
			$artists[$i]['image'] = $image;
		}

		// Pass data to view
		$this->artists = $artists;
	}
}
