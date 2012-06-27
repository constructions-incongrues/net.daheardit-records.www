<?php

/**
 * Post form.
 */
class PostForm extends BasePostForm
{
    public function configure()
    {
        // Behaviors
        unset($this['created_at'], $this['updated_at'], $this['slug']);

        // New image
        $this->validatorSchema['image'] = new sfValidatorFile(
            array(
              'required'              => $this->getObject()->isNew(),
              'path'                  => sfConfig::get('sf_web_dir').'/uploads/news'
            )
        );
        $this->widgetSchema['image'] = new sfWidgetFormInputFileEditable(
            array(
                'label'     => "L'image associée à la news",
                'file_src'  => sfContext::getInstance()->getRequest()->getRelativeUrlRoot().'/uploads/news/'.$this->getObject()->getImage(),
                'is_image'  => true,
                'edit_mode' => !$this->isNew(),
                'template'  => '<div>%file%<br />%input%</div>',
            )
        );

        // i18n
        $this->embedI18n(array('fr', 'en'));
    }
}
