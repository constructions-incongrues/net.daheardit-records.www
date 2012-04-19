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
		$q = Doctrine_Query::create()
			->from('Release');
		$releases = $q->execute(array(), Doctrine_Core::HYDRATE_ARRAY);
		$this->releases = $releases;
	}
}
