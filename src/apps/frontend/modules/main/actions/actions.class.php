<?php

/**
 * main actions.
 *
 * @package    net.daheardit-records.www
 * @subpackage main
 * @author     Constructions Incongrues <contact@constructions-incongrues.net>
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class mainActions extends sfActions
{
	/**
 	 * Executes index action
	 *
	 * @param sfRequest $request A request object
	 */
	public function executeIndex(sfWebRequest $request)
	{
		// Redirect to localized homepage
		if (!$request->getParameter('sf_culture'))
		{
			$culture = $request->getPreferredCulture(array('en', 'fr'));
			$this->getUser()->setCulture($culture);
			$this->redirect('homepage_localized');
		}

	 	// Select template
		return sfView::SUCCESS;
	}
}
