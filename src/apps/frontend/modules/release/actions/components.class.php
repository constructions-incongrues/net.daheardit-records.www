<?php
use Symfony\Component\Finder\Finder;

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
            ->orderBy('r.released_at desc');

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

        if (is_readable(sprintf('%s/frontend/pics/others/header_force.jpg', sfConfig::get('sf_web_dir')))) {
            $urlHeader = sprintf('%s/frontend/pics/others/header_force.jpg', $this->getRequest()->getRelativeUrlRoot());
        } else {
            // Build URL to header
            $urlHeader = sprintf(
                '%s/assets/releases/%s/header.jpg',
                $this->getRequest()->getRelativeUrlRoot(),
                $release->slug
            );
        }

        $urlStylesheet = null;
        $urlScript = null;

        // Master header
        if (!$this->getRequest()->hasParameter('slug')) {
            // Image
            $finder = new Finder();
            $headerImages = $finder
                ->files()
                ->name('/\.gif|\.jpg|\.png$/')
                ->depth('== 0')
                ->in(sprintf('%s/assets/', sfConfig::get('sf_web_dir')));

            $headerImages = iterator_to_array($headerImages, false);

            if (count($headerImages)) {
                $urlHeader = sprintf(
                    '%s/assets/%s',
                    $this->getRequest()->getRelativeUrlRoot(),
                    basename($headerImages[0]->getFilename())
                );
            }

            $finder = new Finder();
            $headerStylesheets = $finder
                ->files()
                ->name('*.css')
                ->depth('== 0')
                ->in(sprintf('%s/assets/', sfConfig::get('sf_web_dir')));

            $headerStylesheets = iterator_to_array($headerStylesheets, false);

            if (count($headerStylesheets)) {
                $urlStylesheet = sprintf(
                    '%s/assets/%s',
                    $this->getRequest()->getRelativeUrlRoot(),
                    basename($headerStylesheets[0]->getFilename())
                );
            }

            $finder = new Finder();
            $headerScripts = $finder
                ->files()
                ->name('*.js')
                ->depth('== 0')
                ->in(sprintf('%s/assets/', sfConfig::get('sf_web_dir')));

            $headerScripts = iterator_to_array($headerScripts, false);

            if (count($headerScripts)) {
                $urlScript = sprintf(
                    '%s/assets/%s',
                    $this->getRequest()->getRelativeUrlRoot(),
                    basename($headerScripts[0]->getFilename())
                );
            }
        }

        // Pass data to view
        $this->release = $release;
        $this->urlHeader = $urlHeader;
        $this->urlScript = $urlScript;
        $this->urlStylesheet = $urlStylesheet;
    }
}
