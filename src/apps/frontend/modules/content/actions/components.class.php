<?php

class contentComponents extends sfComponents
{
	/**
 	 * @param sfRequest $request A request object
	 */
	public function executeShow(sfWebRequest $request)
	{
		$content = Doctrine_Core::getTable('Content')->findWithTranslations($this->getUser()->getCulture());
		$contentArray = $content->toArray();

		if (isset($contentArray[$this->block])) {
			$text = $contentArray[$this->block];
		} elseif (isset($contentArray['Translation'][$this->getUser()->getCulture()][$this->block])) {
			$text = $contentArray['Translation'][$this->getUser()->getCulture()][$this->block];
		} else {
			$text = null;
		}

		$this->content = $text;
	}
}
