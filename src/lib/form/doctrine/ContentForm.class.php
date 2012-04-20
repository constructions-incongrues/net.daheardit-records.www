<?php

/**
 * Content form.
 *
 * @package    net.daheardit-records.www
 * @subpackage form
 * @author     Constructions Incongrues <contact@constructions-incongrues.net>
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class ContentForm extends BaseContentForm
{
	public function configure()
	{
		// behaviors
		unset($this['created_at'], $this['updated_at']);

		$this->embedI18n(array('fr', 'en'));
	}
}
