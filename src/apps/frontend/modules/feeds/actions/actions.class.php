<?php

/**
* 
*/
class feedsActions extends sfActions
{
    /**
     * Generates RSS feed for posts
     * 
     * @return string Template name
     */
    public function executePosts(sfWebRequest $request)
    {
        // Instanciate feed
        $feed = new sfRssFeed();
        $feed->setTitle($this->getContext()->getI18N()->__('Da ! Heard It Records : Dernières Nouvelles'));
        $feed->setLink(sfConfig::get('app_dhr_url_root'));
        $feed->setAuthorEmail('contact@daheardit-records.net');
        $feed->setAuthorName('Da ! Heard It Records');

        // Define feed image
        $feedImage = new sfFeedImage();
        $feedImage->setTitle('Da ! Heard It Records');
        $feedImage->setLink(sfConfig::get('app_dhr_url_root'));
        $feedImage->setImage(sfConfig::get('app_dhr_url_root').'/frontend/pics/logo.png');
        $feed->setImage($feedImage);

        // Fetch latest posts
        $posts = Doctrine_Core::getTable('Post')->createQuery('p')
            ->orderBy('created_at desc')
            ->limit(20)
            ->execute();

        // Create feed items
        foreach ($posts as $post) {
            $item = new sfFeedItem();
            $item->setTitle($post->Translation[$request->getParameter('sf_culture', 'fr')]->title);
            $item->setLink('@post_show?slug='.$post->getSlug());
            $item->setAuthorName('Da ! Heard It Records');
            $item->setAuthorEmail('contact@daheardit-records.net');
            $item->setPubdate($post->getDateTimeObject('created_at')->getTimestamp());
            $item->setUniqueId($post->getSlug());
            $item->setDescription(
                sprintf(
                    '%s<p><img src="%s%s/uploads/news/%s" /></p>', 
                    $post->Translation[$request->getParameter('sf_culture', 'fr')]->body,
                    $request->getUriPrefix(),
                    $request->getRelativeUrlRoot(),
                    $post->getImage()
                )
            );
            $feed->addItem($item);
        }

        // Pass data to view
        $this->feed = $feed;

        // Configure view
        $this->setLayout(false);
        sfConfig::set('sf_web_debug', false);

        // Select template
        return sfView::SUCCESS;
    }
}
