<div class="grid_12 releases">
        <div class="category_content">
          <h1 id="artist"><?php echo __('Biographie') ?></h1>
            <span class="triangle"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/others/triangle-bord.png" class="triangle" /></span>
        </div><!-- end of category contents --> 
      </div><!-- end of releases -->

      <div class="grid_12 open_artists">
  <div class="open_artists_content">

  <div class="grid_12">
      
<div class="grid_12 open_artists"> 
  <div class="grid_9 open_artists_content">
  
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

    <div class=" open_artists_pictures">
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

  <div class="presentation">

    <h1 class="open_artists_name"><?php echo $artist['name'] ?>
    <?php if ($artist['url']): ?>
      <a href="<?php echo $artist['url'] ?>">
      (http://)      </a>
      <?php endif ?>
    </h1>

    <p class="grid_8 open_artists_bio">
    <img height="30%" width="30%" style="float:left;padding:10px 20px 0px 0px" src="<?php echo $sf_request->getRelativeUrlRoot() ?>/assets/artists/<?php echo $artist['slug'] ?>/<?php echo $artist['slug'] ?>_300x300.jpg" alt="" /> 
    <span class="text-bio">
      <?php echo nl2br($artist['Translation'][$sf_user->getCulture()]['presentation']) ?>
      </span>
    </p>

    <div class="grid_4 open_artists_listing_releases "> 


<div class="row">

<?php foreach ($artist['releases'] as $release): ?>
<div class="column">

<a data-pjax="#content_async" href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>">
<img width="50%" height="50%"src="<?php echo $sf_request->getRelativeUrlRoot() ?>/assets/releases/<?php echo $release['slug'] ?>/<?php echo $release['slug'] ?>_300x300.png"  alt=""/>
</a>
</div>


<?php endforeach; ?></div> 
      </div>


   </div> </div> </div>



  </div><!-- enf of release_content -->
  </div><!-- end of grid_12 release_open -->
  </div>


  