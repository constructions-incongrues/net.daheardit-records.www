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
        
        // Get previous artist
        $pdo = Doctrine_Manager::getInstance()->getCurrentConnection()->getDbh();
        $stmt = $pdo->prepare('select slug, title from  `release` where slug < :slug order by slug desc limit 1');
        $stmt->execute(array('slug' => $releaseArray['slug']));
        $previous = $stmt->fetchAll();
        $previousRelease = null;
        if (count($previous)) {
            $previousRelease = $previous[0];
        }

        // Get next artist
        $pdo = Doctrine_Manager::getInstance()->getCurrentConnection()->getDbh();
        $stmt = $pdo->prepare('select slug, title from `release` where slug > :slug order by slug asc limit 1');
        $stmt->execute(array('slug' => $releaseArray['slug']));
        $next = $stmt->fetchAll();
        $nextRelease = null;
        if (count($next)) {
            $nextRelease = $next[0];
        }

        // Pass data to view
        $this->previousRelease = $previousRelease;
        $this->nextRelease = $nextRelease;
        $this->release = $releaseArray;
    }
}
