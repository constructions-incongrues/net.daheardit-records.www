<?php

/**
 * ArtworkArtistTranslation filter form base class.
 *
 * @package    net.daheardit-records.www
 * @subpackage filter
 * @author     Constructions Incongrues <contact@constructions-incongrues.net>
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BaseArtworkArtistTranslationFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'presentation' => new sfWidgetFormFilterInput(),
    ));

    $this->setValidators(array(
      'presentation' => new sfValidatorPass(array('required' => false)),
    ));

    $this->widgetSchema->setNameFormat('artwork_artist_translation_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'ArtworkArtistTranslation';
  }

  public function getFields()
  {
    return array(
      'id'           => 'Number',
      'presentation' => 'Text',
      'lang'         => 'Text',
    );
  }
}
