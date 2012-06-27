<?php

class postComponents extends sfComponents
{
    public function executeList(sfWebRequest $request)
    {
        // Fetch latest post
        $postLatest = Doctrine_Core::getTable('Post')->createQuery('p')
            ->orderBy('created_at desc')
            ->limit(1)
            ->fetchOne(Doctrine_Core::HYDRATE_ARRAY);

        if (!$postLatest['image']) {
            $postLatest['image'] = 'default.png';
        }

        // Pass data to view
        $this->postLatest = $postLatest;
    }
}
