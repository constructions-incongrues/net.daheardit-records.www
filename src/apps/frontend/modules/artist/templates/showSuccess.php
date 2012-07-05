<div class="grid_12 releases">
        <div class="category_content">
          <h1 id="artist"><?php echo __('Biographie') ?></h1>
            <span class="triangle"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/others/triangle.png" class="triangle" /></span>
        </div><!-- end of category contents --> 
      </div><!-- end of releases -->

<div class="grid_12 open_artists"> 
  <div class="open_artists_content">
  
  <div class="grid_12">
    <ul class="open_artists_button">
<?php if ($previousArtist): ?>
      <li class="open_releases_button_left"> <a class="previous" href="<?php echo url_for('@artist_show?slug='.$previousArtist['slug'].'#artist') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" title="<?php echo $previousArtist['name'] ?>" /> </a></li>
<?php endif; ?>

<?php if ($nextArtist): ?>
      <li class="open_releases_button_right"> <a class="next" href="<?php echo url_for('@artist_show?slug='.$nextArtist['slug'].'#artist') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" title="<?php echo $nextArtist['name'] ?>" />  </a></li>
<?php endif; ?>
      <li class="open_releases_button_close"> <a class="close" href="<?php echo url_for('@homepage#artists') ?>" data-close="#content_async" title="<?php echo __('Retourner à la liste des artistes') ?>"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" alt="Close" /> </a></li>
    </ul>
  </div>
  <hr class="open_artists_button_hr"/>

    <div class="grid_6 open_artists_pictures">
      <span class="calque_artists_pictures"> </span>
      <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/assets/artists/<?php echo $artist['slug'] ?>/<?php echo $artist['slug'] ?>_300x300.jpg" alt="" />
    </div><!-- end of grid_6 -->
    
    <div class="grid_6 open_artists_infos">

    <h1 class="open_artists_name"><?php echo $artist['name'] ?></h2>

    <p class="open_artists_bio">
      <?php echo nl2br($artist['Translation'][$sf_user->getCulture()]['presentation']) ?>
    </p>

    <hr />
    <h2 class="open_artists_title"><?php echo __('Où le trouver ?') ?></h2>

    <div class="open_artists_linked">
    <?php echo html_entity_decode($artist['more']) ?>
    </div>
    <hr />
    <h2 class="open_artists_title"><?php echo __('Toutes les sorties') ?></h2>

     <div class=" open_artists_listing_releases ">
 <?php foreach ($artist['releases'] as $release): ?>
        <p><a href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>"> <span class="calque_releases_2"></span></a></p>
        <img width="220px" height="220px" src="<?php echo $sf_request->getRelativeUrlRoot() ?>/assets/releases/<?php echo $release['slug'] ?>/<?php echo $release['slug'] ?>_300x300.png" alt=""/>
        <h1><a href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>"><?php echo $release['sku'] ?></a></h1>
        <h2><a href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>"><?php echo $release['title'] ?></a></h2>
        <ul class="releases_discography_button">
          <li><a href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>"><?php echo __("+ D'infos") ?></a></li>
        </ul>
<?php endforeach; ?>
    </div>
    </div><!-- end of grid_6 -->
  </div><!-- enf of release_content -->
  </div><!-- end of grid_12 release_open -->
