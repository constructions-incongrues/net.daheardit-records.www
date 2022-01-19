<?php

/**
 * Release filter form base class.
 *
 * @package    net.daheardit-records.www
 * @subpackage filter
 * @author     Constructions Incongrues <contact@constructions-incongrues.net>
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BaseReleaseFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'title'             => new sfWidgetFormFilterInput(array('with_empty' => false)),
      'sku'               => new sfWidgetFormFilterInput(array('with_empty' => false)),
      'slug'              => new sfWidgetFormFilterInput(array('with_empty' => false)),
      'released_at'       => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate())),
      'license'           => new sfWidgetFormFilterInput(),
      'url_header'        => new sfWidgetFormFilterInput(),
      'is_public'         => new sfWidgetFormChoice(array('choices' => array('' => 'yes or no', 1 => 'yes', 0 => 'no'))),
      'is_new'            => new sfWidgetFormChoice(array('choices' => array('' => 'yes or no', 1 => 'yes', 0 => 'no'))),
      'image1'            => new sfWidgetFormFilterInput(),
      'image2'            => new sfWidgetFormFilterInput(),
      'artist_id'         => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Artist'), 'add_empty' => true)),
      'artwork_artist_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('ArtworkArtist'), 'add_empty' => true)),
      'paypal_id'         => new sfWidgetFormFilterInput(),
      'is_available'      => new sfWidgetFormChoice(array('choices' => array('' => 'yes or no', 1 => 'yes', 0 => 'no'))),
      'price'             => new sfWidgetFormFilterInput(array('with_empty' => false)),
      'links_press'       => new sfWidgetFormFilterInput(),
      'links_streaming'   => new sfWidgetFormFilterInput(),
      'links_videos'      => new sfWidgetFormFilterInput(),
      'player_code'       => new sfWidgetFormFilterInput(),
      'credits'           => new sfWidgetFormFilterInput(),
      'licence'           => new sfWidgetFormFilterInput(),
      'created_at'        => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate(), 'with_empty' => false)),
      'updated_at'        => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate(), 'with_empty' => false)),
    ));

    $this->setValidators(array(
      'title'             => new sfValidatorPass(array('required' => false)),
      'sku'               => new sfValidatorPass(array('required' => false)),
      'slug'              => new sfValidatorPass(array('required' => false)),
      'released_at'       => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDate(array('required' => false)), 'to_date' => new sfValidatorDateTime(array('required' => false)))),
      'license'           => new sfValidatorPass(array('required' => false)),
      'url_header'        => new sfValidatorPass(array('required' => false)),
      'is_public'         => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
      'is_new'            => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
      'image1'            => new sfValidatorPass(array('required' => false)),
      'image2'            => new sfValidatorPass(array('required' => false)),
      'artist_id'         => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Artist'), 'column' => 'id')),
      'artwork_artist_id' => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('ArtworkArtist'), 'column' => 'id')),
      'paypal_id'         => new sfValidatorPass(array('required' => false)),
      'is_available'      => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
      'price'             => new sfValidatorPass(array('required' => false)),
      'links_press'       => new sfValidatorPass(array('required' => false)),
      'links_streaming'   => new sfValidatorPass(array('required' => false)),
      'links_videos'      => new sfValidatorPass(array('required' => false)),
      'player_code'       => new sfValidatorPass(array('required' => false)),
      'credits'           => new sfValidatorPass(array('required' => false)),
      'licence'           => new sfValidatorPass(array('required' => false)),
      'created_at'        => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 00:00:00')), 'to_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 23:59:59')))),
      'updated_at'        => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 00:00:00')), 'to_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 23:59:59')))),
    ));

    $this->widgetSchema->setNameFormat('release_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'Release';
  }

  public function getFields()
  {
    return array(
      'id'                => 'Number',
      'title'             => 'Text',
      'sku'               => 'Text',
      'slug'              => 'Text',
      'released_at'       => 'Date',
      'license'           => 'Text',
      'url_header'        => 'Text',
      'is_public'         => 'Boolean',
      'is_new'            => 'Boolean',
      'image1'            => 'Text',
      'image2'            => 'Text',
      'artist_id'         => 'ForeignKey',
      'artwork_artist_id' => 'ForeignKey',
      'paypal_id'         => 'Text',
      'is_available'      => 'Boolean',
      'price'             => 'Text',
      'links_press'       => 'Text',
      'links_streaming'   => 'Text',
      'links_videos'      => 'Text',
      'player_code'       => 'Text',
      'credits'           => 'Text',
      'licence'           => 'Text',
      'created_at'        => 'Date',
      'updated_at'        => 'Date',
    );
  }
}
