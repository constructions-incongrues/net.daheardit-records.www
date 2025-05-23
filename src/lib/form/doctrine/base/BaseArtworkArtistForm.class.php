<?php

/**
 * ArtworkArtist form base class.
 *
 * @method ArtworkArtist getObject() Returns the current form's model object
 *
 * @package    net.daheardit-records.www
 * @subpackage form
 * @author     Constructions Incongrues <contact@constructions-incongrues.net>
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseArtworkArtistForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'             => new sfWidgetFormInputHidden(),
      'name'           => new sfWidgetFormTextarea(),
      'url'            => new sfWidgetFormTextarea(),
      'image'          => new sfWidgetFormTextarea(),
      'links_carousel' => new sfWidgetFormTextarea(),
      'more'           => new sfWidgetFormTextarea(),
      'is_public'      => new sfWidgetFormInputCheckbox(),
      'slug'           => new sfWidgetFormInputText(),
      'created_at'     => new sfWidgetFormDateTime(),
      'updated_at'     => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'             => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'name'           => new sfValidatorString(),
      'url'            => new sfValidatorRegex(array('pattern' => '|^http(s)?://[a-z0-9-]+(.[a-z0-9-]+)*(:[0-9]+)?(/.*)?$|', 'required' => false)),
      'image'          => new sfValidatorString(array('required' => false)),
      'links_carousel' => new sfValidatorString(array('required' => false)),
      'more'           => new sfValidatorString(array('required' => false)),
      'is_public'      => new sfValidatorBoolean(array('required' => false)),
      'slug'           => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'created_at'     => new sfValidatorDateTime(),
      'updated_at'     => new sfValidatorDateTime(),
    ));

    $this->validatorSchema->setPostValidator(
      new sfValidatorDoctrineUnique(array('model' => 'ArtworkArtist', 'column' => array('slug')))
    );

    $this->widgetSchema->setNameFormat('artwork_artist[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'ArtworkArtist';
  }

}
