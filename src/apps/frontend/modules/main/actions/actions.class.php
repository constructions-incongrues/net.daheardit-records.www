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

    public function executeImageResize(sfWebRequest $request)
    {
        // Sanity checks
        if (!$request->hasParameter('url')) {
            throw new InvalidArgumentException('Missing "url" parameter');
        } else {
            if (!filter_var(urldecode($request->getParameter('url')), FILTER_VALIDATE_URL)) {
                throw new InvalidArgumentException(sprintf('Invalid URL : %s', $request->getParameter('url')));
            }
        }

        // Download image
        // TODO : url => filesystem map
        $urlImage = $request->getParameter('url');
        $data = file_get_contents($urlImage);
        if (!$data) {
            throw new RuntimeException(sprintf('Could not download image from url : %s', $urlImage));
        }

        // Load image
        $image = new sfImage();
        $image->loadString($data);

        // Transform image
        $transform = $request->getParameter('transform', 'thumbnail');
        $params = explode(",", $request->getParameter('params', '150,150'));

        // TODO : create proper transform class (and commit it to upstream !)
        if ($transform == 'cropCenter') {
            list($width, $height) = explode(",", $request->getParameter('params', '150,150'));
            $left = ($image->getWidth() - $width) / 2;
            $top = ($image->getHeight() - $height) / 2;
            $params = array($left, $top, $width, $height);
            $transform = 'crop';
            if ($image->getWidth() < $width) {
                $transform = 'thumbnail';
                $params = array($width, $height);
            }
        }
        call_user_func_array(
            array($image, $transform),
            $params
        );

        // TODO : Cache image

        // Create response
        $response = $this->getResponse();
        $response->setContentType($image->getMIMEType());
        $response->setContent($image);

        return sfView::NONE;
    }
}
