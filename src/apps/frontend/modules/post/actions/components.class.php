<?php

class postComponents extends sfComponents
{
    public function executeList(sfWebRequest $request)
    {
        // TODO : ugly :D
        $style = '';
        if ($request->getParameter('module') != 'main' && $request->getParameter('module') != 'post') {
            $style = 'display:none;';
        }

        if ($this->getContext()->getRouting()->getCurrentRouteName() == 'post_show') {
            // Fetch requested post
            $post= Doctrine_Core::getTable('Post')->findOneBySlug($request->getParameter('slug'));
        } else {
            // Fetch latest post
            $post = Doctrine_Core::getTable('Post')->createQuery('p')
                ->orderBy('created_at desc')
                ->limit(1)
                ->fetchOne();
        }
 
        $this->getContext()->getActionStack()->getFirstEntry()->getActionInstance()->forward404Unless($post);;

        // Fetch previous post
        $postPrevious = Doctrine_Core::getTable('Post')->createQuery('p')
            ->orderBy('created_at desc')
            ->where('created_at < ?', $post->getCreatedAt())
            ->limit(1)
            ->fetchOne();

        // Fetch next post
        $postNext = Doctrine_Core::getTable('Post')->createQuery('p')
            ->orderBy('created_at desc')
            ->where('created_at > ?', $post->getCreatedAt())
            ->limit(1)
            ->fetchOne();

        // Pass data to view
        $this->postPrevious = $postPrevious;
        $this->postNext = $postNext;
        $this->post = $post;
        $this->style = $style;
    }
}
