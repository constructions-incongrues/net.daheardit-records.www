<?php

class releaseComponents extends sfComponents
{
	/**
 	 * Lists releases.
 	 *
 	 * @param sfRequest $request A request object
	 */
	public function executeList(sfWebRequest $request)
	{
		// Fetch releases
		$q = Doctrine_Query::create()
			->from('Release r')
			->where('r.is_public = 1')
			->innerJoin('r.Artist a')
			->orderBy('r.sku desc');
		$releases = $q->execute(array(), Doctrine_Core::HYDRATE_ARRAY);

		// Fixup data
		for ($i = 0; $i < count($releases); $i++) {
			// cover
			$image = $releases[$i]['slug'].'_thumb-new.png';
			if (!is_readable(sprintf('%s/frontend/pics/artwork/%s', sfConfig::get('sf_web_dir'), $image))) {
				$image = 'TODO.png';
			}
			$releases[$i]['image'] = $image;
		}

		// Pass data to view
		$this->releases = $releases;
	}
}
