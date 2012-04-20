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
			->innerJoin('r.Artist a')
			->orderBy('r.sku desc');
		$releases = $q->execute(array(), Doctrine_Core::HYDRATE_ARRAY);

		// Fixup data
		for ($i = 0; $i < count($releases); $i++) {
			// cover
			$image = $releases[$i]['sku'].'.png';
			if (!is_readable(sprintf('%s/frontend/pics/artwork/%s', sfConfig::get('sf_web_dir'), $image))) {
				$image = 'D!HR-017.png';
			}
			$releases[$i]['image'] = $image;

			// sku slug
			$releases[$i]['sku-slug'] = strtolower(str_replace(array('!', '-'), '', $releases[$i]['sku']));
		}

		// Pass data to view
		$this->releases = $releases;
	}
}
