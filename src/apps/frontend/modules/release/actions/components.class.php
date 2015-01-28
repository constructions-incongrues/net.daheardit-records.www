<?php

class releaseComponents extends sfComponents
{
    /**
     * Lists releases.
     *
     * @param sfRequest $request A request object
     */
    public function executeList(sfWebRequest $request)
    {
        // Fetch releases
        $q = Doctrine_Query::create()
            ->from('Release r')
            ->innerJoin('r.Artist a')
            ->orderBy('r.sku desc');

        // Only display releases marked as public unless in preview mode
        if (!$request->hasParameter('preview')) {
            $q = $q->where('r.is_public = 1');
        }

        // Execute query
        $releases = $q->execute(array(), Doctrine_Core::HYDRATE_ARRAY);

        // Fixup data
        for ($i = 0; $i < count($releases); $i++) {
            $pathImage = sprintf('%s/assets/releases/%s/%s_300x300.png', sfConfig::get('sf_web_dir'), $releases[$i]['slug'], $releases[$i]['slug']);
            if (!is_readable($pathImage)) {
                $uriImage = sprintf('%s/frontend/pics/releases/img-release-default.png', $request->getRelativeUrlRoot());
            } else {
                $uriImage = sprintf('%s/assets/releases/%s/%s_300x300.png', $request->getRelativeUrlRoot(), $releases[$i]['slug'], $releases[$i]['slug']);
            }
            $releases[$i]['image'] = $uriImage;
        }

        // Pass data to view
        $this->releases = $releases;
    }

    public function executeHometitle(sfWebRequest $request)
    {
        if ($request->hasParameter('featured')) {
            $release = Doctrine_Core::getTable('Release')->findOneBySlugAndCulture($request->getParameter('featured'));
        } else {
            $release = Doctrine_Core::getTable('Release')->findLatest(!$request->hasParameter('preview'));
        }

        // This should not happen
        if (!$release) {
            throw new RuntimeException('Could not find any featured release');
        }

        // Build URL to header
        $urlHeader = sprintf(
            '%s/assets/releases/%s/header.jpg',
            $this->getRequest()->getRelativeUrlRoot(), 
            $release->slug
        );

        // Master header
        if (!$this->getRequest()->hasParameter('slug')) {
            $headers = glob(sprintf('%s/assets/header-master.*', sfConfig::get('sf_web_dir')));
            if (count($headers)) {
                $urlHeader = sprintf('%s/assets/%s', $this->getRequest()->getRelativeUrlRoot(), basename($headers[0]));
            }
        }

        // Pass data to view
        $this->urlHeader = $urlHeader;
        $this->release = $release;
    }
}
