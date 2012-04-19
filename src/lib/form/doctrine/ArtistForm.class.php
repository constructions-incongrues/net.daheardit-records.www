<?php

/**
 * Artist form.
 *
 * @package    net.daheardit-records.www
 * @subpackage form
 * @author     Constructions Incongrues <contact@constructions-incongrues.net>
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class ArtistForm extends BaseArtistForm
{
	public function configure()
	{
		// Behaviors
		unset($this['created_at'], $this['updated_at'], $this['slug']);

		// i18n
		$this->embedI18n(array('fr', 'en'));
	}
}
