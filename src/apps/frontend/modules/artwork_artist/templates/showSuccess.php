<div class="grid_12 releases">
        <div class="category_content">
          <h1 id="artwork_artist"><?php echo __('Biographie') ?></h1>
            <span class="triangle"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/others/triangle-bord.png" class="triangle" /></span>
        </div><!-- end of category contents -->
      </div><!-- end of releases -->

<div class="grid_12 open_artists">
  <div class="open_artists_content">

  <div class="grid_12 grid_12 open_illustrator">
  <ul class="open_artists_button">
<?php if ($previousArtist): ?>
      <li class="open_releases_button_left"> <a class="previous" href="<?php echo url_for('@artwork_artist_show?slug='.$previousArtist['slug'].'#artwork_artist') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" title="<?php echo $previousArtist['name'] ?>" /> </a></li>
<?php endif; ?>

<?php if ($nextArtist): ?>
      <li class="open_releases_button_right"> <a class="next" href="<?php echo url_for('@artwork_artist_show?slug='.$nextArtist['slug'].'#artwork_artist') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" title="<?php echo $nextArtist['name'] ?>" />  </a></li>
<?php endif; ?>
      <li class="open_releases_button_close"> <a class="close" href="<?php echo url_for('@homepage#artwork_artists') ?>" data-close="#content_async" title="<?php echo __('Retourner à la liste des graphistes') ?>"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" alt="Close" /> </a></li>
    </ul>
 

<div class="presentation">
    <h1 class="open_artists_name"><?php echo $artist['name'] ?> <a href="<?php echo $artist['url'] ?>">(web)</a></h1>

    <img id="carousel-current" height="30%" width="30%" style="float:left;padding:9px 20px 0px 0px"  src="<?php echo $sf_request->getRelativeUrlRoot() ?>/assets/artwork_artists/<?php echo $artist['slug'] ?>/<?php echo $artist['slug'] ?>_300x300.jpg" alt="" /> 
     
    <p class="open_artists_bio">
      <?php echo auto_link_text(nl2br($artist['Translation'][$sf_user->getCulture()]['presentation'])) ?>
      <?php if ($artist['url']): ?>
        <span class="writers2"> </span>
<?php endif ?>
    </p>

    <?php foreach ($artist['releases'] as $release): ?>
       <div class="open_artists_listing_releases ">

<span><a data-pjax="#content_async" href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>">
   <span class="calque_releases"></span>
   <img width="220px" height="220px" src="<?php echo $sf_request->getRelativeUrlRoot() ?>/assets/releases/<?php echo $release['slug'] ?>/<?php echo $release['slug'] ?>_300x300.png" alt=""/>
            <h1 style="margin-left:-5px;"><a data-pjax="#content_async" href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>"><?php echo $release['sku'] ?></a></h1>
            <h2 style="margin-bottom:0px;"><a data-pjax="#content_async" title="<?php echo sprintf('%s - %s', $artist['name'], $release['title']) ?>" href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>"><?php echo truncate_text(sprintf('%s', $release['title']), 36) ?></a></h2>
    </a></span>
    </div>

<?php endforeach; ?>
</div>
    </div>
 
    <!-- <div class="grid_6 open_artists_pictures"> -->
      <!-- <span class="calque_artists_pictures"> </span> -->

    <!-- </div>    -->
     <!-- end of grid_6 -->

    
  


<div class="grid_6">

    </div><!-- end of grid_6 -->
  </div><!-- enf of release_content -->
  </div><!-- end of grid_12 release_open -->
