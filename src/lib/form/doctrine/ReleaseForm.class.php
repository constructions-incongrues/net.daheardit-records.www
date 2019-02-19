<?php

/**
 * Release form.
 *
 * @package    net.daheardit-records.www
 * @subpackage form
 * @author     Constructions Incongrues <contact@constructions-incongrues.net>
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class ReleaseForm extends BaseReleaseForm
{
    public function configure()
    {
        // Custom widgets
        $this->setWidget('links_press', new sfWidgetFormTextArea());
        $this->setWidget('links_streaming', new sfWidgetFormTextArea());
        $years = range(2005, date('Y '));
        $this->setWidget(
            'released_at',
            new sfWidgetFormDate(
                array(
                    'can_be_empty' => false,
                    'years' => array_combine($years, $years),
                )
            )
        );

        // Behaviors
        unset($this['created_at'], $this['updated_at']);

        // i18n
        $this->embedI18n(array('fr', 'en'));
    }
}
