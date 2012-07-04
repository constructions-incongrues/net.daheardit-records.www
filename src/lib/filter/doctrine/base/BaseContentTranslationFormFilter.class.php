<?php

/**
 * ContentTranslation filter form base class.
 *
 * @package    net.daheardit-records.www
 * @subpackage filter
 * @author     Constructions Incongrues <contact@constructions-incongrues.net>
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BaseContentTranslationFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'informations' => new sfWidgetFormFilterInput(),
      'greetings'    => new sfWidgetFormFilterInput(),
    ));

    $this->setValidators(array(
      'informations' => new sfValidatorPass(array('required' => false)),
      'greetings'    => new sfValidatorPass(array('required' => false)),
    ));

    $this->widgetSchema->setNameFormat('content_translation_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'ContentTranslation';
  }

  public function getFields()
  {
    return array(
      'id'           => 'Number',
      'informations' => 'Text',
      'greetings'    => 'Text',
      'lang'         => 'Text',
    );
  }
}
