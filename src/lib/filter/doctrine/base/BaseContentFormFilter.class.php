<?php

/**
 * Content filter form base class.
 *
 * @package    net.daheardit-records.www
 * @subpackage filter
 * @author     Constructions Incongrues <contact@constructions-incongrues.net>
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BaseContentFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'links1'             => new sfWidgetFormFilterInput(),
      'links2'             => new sfWidgetFormFilterInput(),
      'footer_video'       => new sfWidgetFormFilterInput(),
      'radio_presentation' => new sfWidgetFormFilterInput(),
      'radio_onair'        => new sfWidgetFormFilterInput(),
      'created_at'         => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate(), 'with_empty' => false)),
      'updated_at'         => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate(), 'with_empty' => false)),
    ));

    $this->setValidators(array(
      'links1'             => new sfValidatorPass(array('required' => false)),
      'links2'             => new sfValidatorPass(array('required' => false)),
      'footer_video'       => new sfValidatorPass(array('required' => false)),
      'radio_presentation' => new sfValidatorPass(array('required' => false)),
      'radio_onair'        => new sfValidatorPass(array('required' => false)),
      'created_at'         => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 00:00:00')), 'to_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 23:59:59')))),
      'updated_at'         => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 00:00:00')), 'to_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 23:59:59')))),
    ));

    $this->widgetSchema->setNameFormat('content_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'Content';
  }

  public function getFields()
  {
    return array(
      'id'                 => 'Number',
      'links1'             => 'Text',
      'links2'             => 'Text',
      'footer_video'       => 'Text',
      'radio_presentation' => 'Text',
      'radio_onair'        => 'Text',
      'created_at'         => 'Date',
      'updated_at'         => 'Date',
    );
  }
}
