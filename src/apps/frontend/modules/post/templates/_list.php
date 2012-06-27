<div class="header_news_2_content">
  <div class="grid_12 header_news_2"> 
    <div class="grid_3 header_news_2_pictures">
      <p><a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/uploads/news/<?php echo $postLatest['image'] ?>" alt="" width="217" height="100" /></a></p>
    </div>

    <div class="grid_9 header_news_2_descr">
      <h1 class="header_news_2_title">
        <?php echo $postLatest['title'] ?>
        <!--
        <span class="header_news_2_nav">
          <a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/left.png" alt="" /></a>
          <a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/right.png" alt="" /></a>
          <a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/close.png" alt="" /></a></span>
        -->
        </h1>
        <p><?php echo nl2br($postLatest['body']) ?></p>
      </div>
    </div>
  </div>
</div><!-- /header_news_2 -->