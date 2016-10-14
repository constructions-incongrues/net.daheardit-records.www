<div class="grid_12 releases">
        <div class="category_content">
          <h1 id="artwork_artist"><?php echo __('Biographie') ?></h1>
            <span class="triangle"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/others/triangle.png" class="triangle" /></span>
        </div><!-- end of category contents -->
      </div><!-- end of releases -->

<div class="grid_12 open_artists">
  <div class="open_artists_content">

  <div class="grid_12">
    <ul class="open_artists_button">
<?php if ($previousArtist): ?>
      <li class="open_releases_button_left"> <a class="previous" href="<?php echo url_for('@artwork_artist_show?slug='.$previousArtist['slug'].'#artwork_artist') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" title="<?php echo $previousArtist['name'] ?>" /> </a></li>
<?php endif; ?>

<?php if ($nextArtist): ?>
      <li class="open_releases_button_right"> <a class="next" href="<?php echo url_for('@artwork_artist_show?slug='.$nextArtist['slug'].'#artwork_artist') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" title="<?php echo $nextArtist['name'] ?>" />  </a></li>
<?php endif; ?>
      <li class="open_releases_button_close"> <a class="close" href="<?php echo url_for('@homepage#artwork_artists') ?>" data-close="#content_async" title="<?php echo __('Retourner à la liste des graphistes') ?>"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" alt="Close" /> </a></li>
    </ul>
  </div>
  <hr class="open_artists_button_hr"/>

    <div class="grid_6 open_artists_pictures">
      <span class="calque_artists_pictures"> </span>
      <img id="carousel-current" height="460px" width="460px" src="<?php echo $sf_request->getRelativeUrlRoot() ?>/assets/artwork_artists/<?php echo $artist['slug'] ?>/<?php echo $artist['slug'] ?>_300x300.jpg" alt="" />
      <ul class="open_releases_nav_artwork">
        <li>
          <a class="carousel-nav current" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/assets/artwork_artists/<?php echo $artist['slug'] ?>/<?php echo $artist['slug'] ?>_300x300.jpg" title="<?php echo __("Survolez l'image pour mettre le carousel en pause") ?>">
            <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/caroussel-release-hover.png" />
          </a>
        </li>
<?php if (count($artist['links_carousel'])): ?>
  <?php for ($i = 0; $i < count($artist['links_carousel']); ++$i): ?>
        <li>
          <a class="carousel-nav" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/<?php echo $artist['links_carousel'][$i] ?>" title="<?php echo __("Survolez l'image pour mettre le carousel en pause") ?>">
            <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/caroussel-release.png" />
          </a>
        </li>
  <?php endfor ?>
<?php endif; ?>
     </ul>

    </div><!-- end of grid_6 -->

    <div class="grid_6 open_artists_infos">

    <h1 class="open_artists_name"><?php echo $artist['name'] ?></h2>

    <p class="open_artists_bio">
      <?php echo nl2br($artist['Translation'][$sf_user->getCulture()]['presentation']) ?>
    </p>

<?php if ($artist['url']): ?>
    <p class="open_artists_bio">
      <a href="<?php echo $artist['url'] ?>"><?php echo $artist['url'] ?></a>
    </p>
<?php endif ?>

    <hr />


    <h2 class="open_artists_title"><?php echo __('Illustration(s)') ?></h2>

<div style="width:600px; ">
 <?php foreach ($artist['releases'] as $release): ?>
       <div class="open_artists_listing_releases ">

   <img width="220px" height="220px" src="<?php echo $sf_request->getRelativeUrlRoot() ?>/assets/releases/<?php echo $release['slug'] ?>/<?php echo $release['slug'] ?>_300x300.png" alt=""/>
            <h1 style="margin-left:-5px;"><a data-pjax="#content_async" href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>"><?php echo $release['sku'] ?></a></h1>
            <h2 style="margin-bottom:0px;"><a data-pjax="#content_async" title="<?php echo sprintf('%s - %s', $artist['name'], $release['title']) ?>" href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>"><?php echo truncate_text(sprintf('%s - %s', $artist['name'], $release['title']), 35) ?></a></h2>
    </div>

<?php endforeach; ?>
</div>
    </div><!-- end of grid_6 -->
  </div><!-- enf of release_content -->
  </div><!-- end of grid_12 release_open -->
