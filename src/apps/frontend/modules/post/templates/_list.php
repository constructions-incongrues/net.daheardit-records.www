<div class="header_news_2_content" style="<?php echo $style ?>">
  <div class="grid_12 header_news_2"> 
    <div class="grid_3 header_news_2_pictures">
<?php if ($post->getImage()): ?>
      <p><a href="<?php echo url_for('@post_show?slug='.$post->getSlug()) ?>"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/uploads/news/<?php echo $post->getImage() ?>" alt="" width="217" height="100" /></a></p>
<?php else: ?>
      <p><a href="<?php echo url_for('@post_show?slug='.$post->getSlug()) ?>"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/micronews/default.png" width="217" height="100" /></a></p>
<?php endif; ?>
    </div>

    <div class="grid_9 header_news_2_descr">
      <h1 class="header_news_2_title">
        <?php echo $post['Translation'][$sf_request->getParameter('sf_culture', 'fr')]['title'] ?>
        <span class="header_news_2_nav">
<?php if ($postPrevious): ?>
          <a href="<?php echo url_for('@post_show?slug='.$postPrevious->getSlug()) ?>"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/left.png" alt="" /></a>
<?php endif; ?>
<?php if ($postNext): ?>
          <a href="<?php echo url_for('@post_show?slug='.$postNext->getSlug()) ?>"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/right.png" alt="" /></a>
<?php endif; ?>
<!--
          <a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/close.png" alt="" /></a>
-->
        </span>
      </h1>
      <p><?php echo html_entity_decode($post['Translation'][$sf_request->getParameter('sf_culture', 'fr')]['body']) ?></p>
    </div>
  </div>
</div>

</div><!-- /header_news_2 -->

<!--
          <div class="header_news_2_closed">
            <p class="header_news_2_closed_button">
              <a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/open-actu.png" alt="Open news" />
            </p> 
          </div> 
-->