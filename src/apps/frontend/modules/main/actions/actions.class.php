<?php

/**
 * main actions.
 *
 * @package    net.daheardit-records.www
 * @subpackage main
 * @author     Constructions Incongrues <contact@constructions-incongrues.net>
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class mainActions extends sfActions
{
    /**
     * Executes index action
     *
     * @param sfRequest $request A request object
     */
    public function executeIndex(sfWebRequest $request)
    {
        // Redirect to localized homepage
        if (!$request->getParameter('sf_culture')) {
            if ($this->getUser()->isFirstRequest()) {
                $culture = $request->getPreferredCulture(array('en', 'fr'));
                $this->getUser()->setCulture($culture);
                $this->getUser()->isFirstRequest(false);
            } else {
                $culture = $this->getUser()->getCulture();
            }

            $this->redirect('homepage_localized');
        }

        $this->getResponse()->setTitle($this->getContext()->getI18N()->__('Bienvenue'));

        // Opengraph
        // TODO : this should go in a filter
        $headersOgp = array(
            'title' => $this->getContext()->getResponse()->getTitle() . ' | Da ! Heard It Records',
            'type'  => 'website',
            'url'   => sfConfig::get('app_dhr_url_root').'/'.$request->getParameter('sf_culture'),
            'image' => sfConfig::get('app_dhr_url_root').'/frontend/pics/logo.png',
            'description' => $this->getContext()->getI18N()->__('Créé en 2006, Da ! Heard it Records est un net-label flirtant avec les musiques Toyz-Pop, Electro Trash, Chiptune, Breakcore, Techno Parodique, Electro Punk, Acid, et avec un goût prononcé pour le 8-bit et le pixel art.')
        );

        foreach ($headersOgp as $name => $value) {
            $this->getContext()->getResponse()->addMeta('og:'.$name, $value);
        }

        // Select template
        return sfView::SUCCESS;
    }

    public function executeError404()
    {
        $this->setLayout(false);
    }

    public function executeThanks()
    {
        $this->setLayout(false);
    }
}
