<?php

class artwork_artistComponents extends sfComponents
{
    /**
     * Lists artists.
     *
     * @param sfRequest $request A request object
     */
    public function executeList(sfWebRequest $request)
    {
        // Fetch artists
        $q = Doctrine_Query::create()
            ->from('ArtworkArtist a')
            ->addOrderBy('a.name asc');
        if (!$request->hasParameter('preview')) {
            $q = $q->where('a.is_public = 1');
        }
        $artists = $q->execute(null, Doctrine_Core::HYDRATE_ARRAY);

        // Fixup images
        for ($i = 0; $i < count($artists); $i++) {
            $pathImage = sprintf('%s/assets/artwork_artists/%s/%s_300x300.jpg', sfConfig::get('sf_web_dir'), $artists[$i]['slug'], $artists[$i]['slug']);
            if (!is_readable($pathImage)) {
                $uriImage = sprintf('%s/frontend/pics/artwork_artists/img-artist-default.png', $request->getRelativeUrlRoot());
            } else {
                $uriImage = sprintf('%s/assets/artwork_artists/%s/%s_300x300.jpg', $request->getRelativeUrlRoot(), $artists[$i]['slug'], $artists[$i]['slug']);
            }
            $artists[$i]['image'] = $uriImage;
        }

        // Pass data to view
        $this->artists = $artists;
    }
}
