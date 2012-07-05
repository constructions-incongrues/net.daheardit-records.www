<?php

/**
 * artist actions.
 *
 * @package    net.daheardit-records.www
 * @subpackage artist
 * @author     Constructions Incongrues <contact@constructions-incongrues.net>
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class artistActions extends sfActions
{
    /**
     * @param sfRequest $request A request object
     */
     public function executeShow(sfWebRequest $request)
     {
        // Fetch artist
        $artist = Doctrine_Core::getTable('Artist')->findOneBySlugAndCulture($request->getParameter('slug'), $this->getUser()->getCulture());
        $this->forward404Unless($artist);

        // Fetch releases
        $releases = Doctrine_Core::getTable('Release')->findByArtistId($artist->id, Doctrine_Core::HYDRATE_ARRAY);
        $artistArray = $artist->toArray();
        $artistArray['releases'] = $releases;

        // Get previous artist
        $pdo = Doctrine_Manager::getInstance()->getCurrentConnection()->getDbh();
        $stmt = $pdo->prepare('select slug, name from artist where slug < :slug order by slug desc limit 1');
        $stmt->execute(array('slug' => $artistArray['slug']));
        $previous = $stmt->fetchAll();
        $previousArtist = null;
        if (count($previous)) {
            $previousArtist = $previous[0];
        }

        // Get next artist
        $pdo = Doctrine_Manager::getInstance()->getCurrentConnection()->getDbh();
        $stmt = $pdo->prepare('select slug, name from artist where slug > :slug order by slug asc limit 1');
        $stmt->execute(array('slug' => $artistArray['slug']));
        $next = $stmt->fetchAll();
        $nextArtist = null;
        if (count($next)) {
            $nextArtist = $next[0];
        }

        // Carousel
        $artistArray['links_carousel'] = explode("\n", $artistArray['links_carousel']);

        // Configure response
        $this->getResponse()->setTitle($artist['name']);

        // Opengraph 
        // TODO : this should go in a filter
        $headersOgp = array(
            'title' => $this->getContext()->getResponse()->getTitle() . ' | Da ! Heard It Records',
            'type'  => 'website',
            'image' => sprintf(sfConfig::get('app_dhr_url_root').'/assets/artists/%s/%s_300x300.jpg', $artist['slug'], $artist['slug']),
            'description' => $artist['Translation'][$request->getParameter('sf_culture', 'fr')]['presentation']
        );

        foreach ($headersOgp as $name => $value) {
            $this->getContext()->getResponse()->addMeta('og:'.$name, $value);
        }

        // Pass data to view
        $this->previousArtist = $previousArtist;
        $this->nextArtist = $nextArtist;
        $this->artist = $artistArray;
    }
}
