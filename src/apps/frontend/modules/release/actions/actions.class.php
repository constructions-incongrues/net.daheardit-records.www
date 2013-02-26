<?php

/**
 * release actions.
 *
 * @package    net.daheardit-records.www
 * @subpackage release
 * @author     Constructions Incongrues <contact@constructions-incongrues.net>
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class releaseActions extends sfActions
{
    public function executeShow(sfWebRequest $request)
    {
        // Fetch release
        $release = Doctrine_Core::getTable('Release')->findOneBySlugAndCulture($request->getParameter('slug'), $this->getUser()->getCulture());
        $this->forward404Unless($release);
        if (!$request->hasParameter('preview') && !$release->is_public) {
            $this->forward404();
        }

        // Fetch release tracks
        $tracks = Doctrine_Core::getTable('Track')->findByReleaseId($release['id'], Doctrine_Core::HYDRATE_ARRAY);

        // Setup metadata
        $releaseArray = $release->toArray();
        $releaseArray['tracks'] = $tracks;
        $this->getResponse()->setTitle(sprintf('[%s] %s - %s', $releaseArray['sku'], $releaseArray['Artist']['name'], $releaseArray['title']));
        
        // Archives
        $archives = array();
        $archivesPaths = glob(sprintf('%s/web/assets/releases/%s/archives/*.zip', sfConfig::get('sf_root_dir'), $release['slug']));
        foreach ($archivesPaths as $path) {
            $archives[] = array(
                'filename' => basename($path),
                'name' => trim(str_replace(array($release['slug'], '_'), array('', ' '), basename($path, '.zip')))
            );
        }

        // Press
        $releaseArray['press'] = array();

        // Find images scans
        $pathsScans = glob(sprintf('%s/assets/releases/%s/press/*', sfConfig::get('sf_web_dir'), $release['slug']));
        foreach ($pathsScans as $path) {
            $releaseArray['press'][] = array(
                'title' => ucfirst(str_replace('_', ' ', basename($path, '.jpg'))),
                'url'  => $request->getRelativeUrlRoot().str_replace(sfConfig::get('sf_web_dir'), '', $path)
            );
        }

        // Web articles
        $urls = explode("\n", $releaseArray['links_press']);
        if ($urls[0]) {
            foreach ($urls as $url) {
                $releaseArray['press'][] = array(
                    'title' => ucfirst(str_replace('www.', '', parse_url($url, PHP_URL_HOST))),
                    'url'  => $url
                );
            }
        }

        // Get previous release
        $pdo = Doctrine_Manager::getInstance()->getCurrentConnection()->getDbh();
        $stmt = $pdo->prepare('select slug, title, sku from  `release` where slug < :slug order by slug desc limit 1');
        $stmt->execute(array('slug' => $releaseArray['slug']));
        $previous = $stmt->fetchAll();
        $previousRelease = null;
        if (count($previous)) {
            $previousRelease = $previous[0];
        }

        // Get next release
        $pdo = Doctrine_Manager::getInstance()->getCurrentConnection()->getDbh();
        $stmt = $pdo->prepare('select slug, title, sku from `release` where slug > :slug order by slug asc limit 1');
        $stmt->execute(array('slug' => $releaseArray['slug']));
        $next = $stmt->fetchAll();
        $nextRelease = null;
        if (count($next)) {
            $nextRelease = $next[0];
        }

        // Artwork
        $artworks = array();
        $pathsArtworks = glob(sprintf('%s/assets/releases/%s/images/*.png', sfConfig::get('sf_web_dir'), $release['slug']));
        foreach ($pathsArtworks as $path) {
            $artworks[] = str_replace(sfConfig::get('sf_web_dir'), '', $path);
        }
        $releaseArray['artworks'] = $artworks;

        // Other carousel items
        if (trim($releaseArray['links_carousel'])) {
            $releaseArray['links_carousel'] = explode("\n", trim($releaseArray['links_carousel']));
        } else {
            $releaseArray['links_carousel'] = array();
        }

        /*
         * Featured release (header image, css, etc)
         * @see release/hometitle component
         */
        if (!$request->hasParameter('featured')) {
            if (is_readable(sprintf('%s/web/assets/releases/%s/header.jpg', sfConfig::get('sf_root_dir'), $release->slug))) {
                $request->setParameter('featured', $release->slug);
            }
        }

        // Opengraph 
        // TODO : this should go in a filter
        $headersOgp = array(
            'title' => $this->getContext()->getResponse()->getTitle() . ' | Da ! Heard It Records',
            'type'  => 'music.album',
            'image' => sprintf(sfConfig::get('app_dhr_url_root').'/assets/releases/%s/images/%s_1.png', $release['slug'], $release['slug']),
            'description' => $release['Translation'][$request->getParameter('sf_culture', 'fr')]['presentation']
        );
        foreach ($headersOgp as $name => $value) {
            $this->getContext()->getResponse()->addMeta('og:'.$name, $value);
        }

        // Pass data to view
        $this->previousRelease = $previousRelease;
        $this->nextRelease = $nextRelease;
        $this->release = $releaseArray;
        $this->archives = $archives;
    }
}
