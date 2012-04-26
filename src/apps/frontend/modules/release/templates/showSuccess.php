
<!-- @see https://github.com/defunkt/jquery-pjax -->
<title><?php echo $sf_response->getTitle() ?></title>

<div class="grid_12 releases">
        <div class="category_content">
          <h1 id="release"><?php echo $release['sku'] ?></h1>
            <span class="triangle"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/others/triangle.png" class="triangle" /></span>
        </div><!-- end of category contents --> 
      </div><!-- end of releases -->

<div class="grid_12 open_releases"> 
  <div class="open_releases_content">
  
  <div class="grid_12">
    <ul class="open_releases_button">
    <?php if ($previous): ?>
      <li class="open_releases_button_left"> <a href="<?php echo url_for('@release_show?slug=dhr-'.$previous.'#release') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" alt="" /> </a></li>
<?php endif; ?>
<?php if ($next): ?>
      <li  class="open_releases_button_right"> <a href="<?php echo url_for('@release_show?slug=dhr-'.$next.'#release') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" alt="" />  </a></li>
<?php endif; ?>
      <li class="open_releases_button_close"> <a href="" data-close="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" alt="" /> </a></li>
    </ul>
  </div>
  <hr /> 

    <div class="grid_6 open_releases_artwork">
    <img width="400px" src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/artwork/<?php echo $release['slug'] ?>.png" alt="" />
 <ul class="open_releases_nav_artwork">
            <li><a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/caroussel-release.png" alt="" /></a></li>
            <li><a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/caroussel-release-hover.png" alt="" /></a></li>
     </ul>
   </div><!-- end of grid_6 -->
    
    <div class="grid_6 open_releases_infos">

    <h1 class="open_releases_catalog"><?php echo $release['sku'] ?></h2>
    <h2 class="open_releases_artist"><a href="<?php echo url_for(sprintf('@artist_show?slug=%s#artist', $release['Artist']['slug'])) ?>"><?php echo $release['Artist']['name'] ?></a></h2>
    <h3 class="open_releases_album"><?php echo $release['title'] ?></h3>

    <ul class="open_releases_playlist">
<?php foreach ($release['tracks'] as $track): ?>
    <?php if ($track['number'] < 10): ?>
      <li><a href="<?php echo $sf_request->getRelativeUrlRoot() ?>/releases/<?php echo $release['slug'] ?>/0<?php echo $track['number'] ?>_<?php echo $track['slug'] ?>.mp3"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/play.png" alt="play" class="open_releases_playlist_icon_play" /><?php echo $track['title'] ?></a></li>
    <?php else: ?>
      <li><a href="<?php echo $sf_request->getRelativeUrlRoot() ?>/releases/<?php echo $release['slug'] ?>/<?php echo $track['number'] ?>_<?php echo $track['slug'] ?>.mp3"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/play.png" alt="play" class="open_releases_playlist_icon_play" /><?php echo $track['title'] ?></a></li>
    <?php endif; ?> 
<?php endforeach; ?>
    </ul>

    <h1 class="open_releases_title"><?php echo __('À propos de la sortie') ?></h1>
    <p class="open_releases_press_text">
<?php echo $release['Translation'][$sf_user->getCulture()]['presentation'] ?>
    </p>

    <h2 class="open_releases_title"><?php echo __('Télécharger l\'album gratuitement') ?></h2>
    <ul class="open_releases_download">
      <li><a href="<?php echo $sf_request->getRelativeUrlRoot() ?>/releases/<?php echo $release['slug'] ?>/<?php echo $release['slug'] ?>_mp3_320.zip">MP3</a></li>
      <li><a href="<?php echo $sf_request->getRelativeUrlRoot() ?>/releases/<?php echo $release['slug'] ?>/<?php echo $release['slug'] ?>_ogg.zip">OGG</a></li>
      <li><a href="<?php echo $sf_request->getRelativeUrlRoot() ?>/releases/<?php echo $release['slug'] ?>/<?php echo $release['slug'] ?>_flac.zip">FLAC</a></li>
    </ul>

    <h3 class="open_releases_title"><?php echo __('Acheter l\'album') ?></h3>
    <p class="open_releases_buy">
      <span class="open_releases_price">15€</span>
      <span class="open_releases_market"><a href=""><?php echo __('Ajouter au panier') ?></a> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/img-panier.png" alt="" /></span>
    </p>
    <hr>
  <ul class="open_releases_share_button">
            <li><?php echo __('Partager') ?></li>
            <li><a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/img-twitter-b.png" alt="" /></a></li>
            <li><a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/google+-b.png" alt="" /></a></li>
            <li><a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/img-facebook-b.png" alt="" /></a></li>
          </ul>
    </div><!-- end of grid_6 -->
  </div><!-- enf of release_content -->
  </div><!-- end of grid_12 release_open -->
