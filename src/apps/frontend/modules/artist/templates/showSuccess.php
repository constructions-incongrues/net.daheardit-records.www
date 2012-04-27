<div class="grid_12 releases">
        <div class="category_content">
          <h1><?php echo __('Biographie') ?></h1>
            <span class="triangle"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/others/triangle.png" class="triangle" /></span>
        </div><!-- end of category contents --> 
      </div><!-- end of releases -->

<div class="grid_12 open_artists"> 
  <div class="open_artists_content">
  
  <div class="grid_12">
    <ul class="open_releases_button">
      <li class="open_releases_button_left"> <a href="<?php echo url_for('@release_show?slug=dhr-'.$previous.'#release') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" alt="Before" /> </a></li>

      <li class="open_releases_button_right"> <a href="<?php echo url_for('@release_show?slug=dhr-'.$next.'#release') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" alt="Previous" />  </a></li>
      <li class="open_releases_button_close"> <a href="" data-close="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" alt="Close" /> </a></li>
    </ul>
  </div>
  <hr /> 

    <div class="grid_6 open_artists_pictures">
    <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/artwork/cover_test.png" alt="" />
    </div><!-- end of grid_6 -->
    
    <div class="grid_6 open_releases_infos">

    <h1 class="open_artists_name"><?php echo $artist['name'] ?></h2>

    <p class="open_artists_bio">
      <?php echo nl2br($artist['Translation'][$sf_user->getCulture()]['presentation']) ?>
    </p>

    <hr>
    <h2 class="open_artists_title"><?php echo __('Où le trouver ?') ?></h2>

<div class="open_artists_linked">
    <ul>
      <li><a href="">Myspace</a></li>
      <li><a href="">Youtube</a></li>
      <li><a href="">Dailymotion</a></li>
    <ul>
</div>
    <hr>
    <h2 class="open_artists_title"><?php echo __('Toutes les sorties') ?></h2>

 <div class=" open_artists_listing_releases ">
 <?php foreach ($artist['releases'] as $release): ?>
            <span class="calque_releases"></span>
            <img width="220px" height="220px" src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/artwork/<?php echo $release['slug'] ?>_thumb-new.png" alt=""/>
            <h1><a href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>"><?php echo $release['sku'] ?></a></h1>
            <h2><a href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>"><?php echo $release['title'] ?></a></h2>
            <ul class="releases_discography_button">
              <li><a href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>">+ D'infos</a></li>
              <li><a href=""><? echo __('Ajouter au Panier') ?></a></li>
            </ul>
          </div>
<?php endforeach; ?>
    </div><!-- end of grid_6 -->
  </div><!-- enf of release_content -->
  </div><!-- end of grid_12 release_open -->

