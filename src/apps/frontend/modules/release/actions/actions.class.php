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
                'name' => str_replace(array($release['slug'], '_'), array('', ' '), basename($path, '.zip'))
            );
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

        // Opengraph 
        // TODO : this should go in a filter
        $headersOgp = array(
            'title' => $this->getContext()->getResponse()->getTitle() . ' | Da ! Heard It Records',
            'type'  => 'music.album',
            'image' => sprintf('http://next.daheardit-records.net/assets/releases/%s/images/%s_1.png', $release['slug'], $release['slug']),
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
