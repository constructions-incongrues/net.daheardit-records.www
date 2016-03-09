<?php

/**
 * Release form base class.
 *
 * @method Release getObject() Returns the current form's model object
 *
 * @package    net.daheardit-records.www
 * @subpackage form
 * @author     Constructions Incongrues <contact@constructions-incongrues.net>
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseReleaseForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'                => new sfWidgetFormInputHidden(),
      'title'             => new sfWidgetFormTextarea(),
      'sku'               => new sfWidgetFormTextarea(),
      'slug'              => new sfWidgetFormTextarea(),
      'released_at'       => new sfWidgetFormDate(),
      'links_carousel'    => new sfWidgetFormTextarea(),
      'is_public'         => new sfWidgetFormInputCheckbox(),
      'is_new'            => new sfWidgetFormInputCheckbox(),
      'image1'            => new sfWidgetFormTextarea(),
      'image2'            => new sfWidgetFormTextarea(),
      'artist_id'         => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Artist'), 'add_empty' => true)),
      'artwork_artist_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('ArtworkArtist'), 'add_empty' => true)),
      'paypal_id'         => new sfWidgetFormTextarea(),
      'is_available'      => new sfWidgetFormInputCheckbox(),
      'price'             => new sfWidgetFormTextarea(),
      'links_press'       => new sfWidgetFormInputText(),
      'created_at'        => new sfWidgetFormDateTime(),
      'updated_at'        => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'                => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'title'             => new sfValidatorString(),
      'sku'               => new sfValidatorString(),
      'slug'              => new sfValidatorString(),
      'released_at'       => new sfValidatorDate(array('required' => false)),
      'links_carousel'    => new sfValidatorString(array('required' => false)),
      'is_public'         => new sfValidatorBoolean(array('required' => false)),
      'is_new'            => new sfValidatorBoolean(array('required' => false)),
      'image1'            => new sfValidatorString(array('required' => false)),
      'image2'            => new sfValidatorString(array('required' => false)),
      'artist_id'         => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Artist'), 'required' => false)),
      'artwork_artist_id' => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('ArtworkArtist'), 'required' => false)),
      'paypal_id'         => new sfValidatorString(array('required' => false)),
      'is_available'      => new sfValidatorBoolean(array('required' => false)),
      'price'             => new sfValidatorString(array('required' => false)),
      'links_press'       => new sfValidatorPass(array('required' => false)),
      'created_at'        => new sfValidatorDateTime(),
      'updated_at'        => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('release[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'Release';
  }

}
