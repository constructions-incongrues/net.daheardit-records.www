
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
      <li> <a href="<?php echo url_for('@release_show?slug=dhr-'.$previous.'#release') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/release_retour.png" alt="" /> </a></li>
<?php endif; ?>
<?php if ($next): ?>
      <li> <a href="<?php echo url_for('@release_show?slug=dhr-'.$next.'#release') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/release_suivant.png" alt="" /> </a></li>
<?php endif; ?>
      <li> <a href="" data-close="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/release_close.png" alt="" /> </a></li>
    </ul>
  </div>
  <hr /> 

    <div class="grid_6 open_releases_artwork">
    <img width="400px" src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/artwork/<?php echo $release['slug'] ?>.png" alt="" />
    </div><!-- end of grid_6 -->
    
    <div class="grid_6 open_releases_infos">

    <h1 class="open_releases_catalog"><?php echo $release['sku'] ?></h2>
    <h2 class="open_releases_artist"><a href="<?php echo url_for(sprintf('@artist_show?slug=%s#artist', $release['Artist']['slug'])) ?>"><?php echo $release['Artist']['name'] ?></a></h2>
    <h3 class="open_releases_album"><?php echo $release['title'] ?></h3>

    <ul class="open_releases_playlist">
      <li><a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/play.png" alt="play" class="open_releases_playlist_icon_play" />Title</a></li>
      <li><a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/play.png" alt="play" class="open_releases_playlist_icon_play" />Title</a></li>
      <li><a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/play.png" alt="play" class="open_releases_playlist_icon_play" />Title</a></li>
      <li><a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/play.png" alt="play" class="open_releases_playlist_icon_play" />Title</a></li>
      <li><a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/play.png" alt="play" class="open_releases_playlist_icon_play" />Title</a></li>
      <li><a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/play.png" alt="play" class="open_releases_playlist_icon_play" />Title</a></li>
      <li><a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/play.png" alt="play" class="open_releases_playlist_icon_play" />Title</a></li>
      <li><a href=""><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/play.png" alt="play" class="open_releases_playlist_icon_play" />Title</a></li>
    </ul>

    <h1 class="open_releases_title"><?php echo __('À propos de la sortie') ?></h1>
    <p class="open_releases_press_text">
<?php echo $release['Translation'][$sf_user->getCulture()]['presentation'] ?>
    </p>

    <h2 class="open_releases_title"><?php echo __('Télécharger l\'album gratuitement') ?></h2>
    <ul class="open_releases_download">
      <li><a href="">MP3</a></li>
      <li><a href="">OGG</a></li>
      <li><a href="">FLAC</a></li>
    </ul>

    <h3 class="open_releases_title"><?php echo __('Acheter l\'album') ?></h3>
    <p class="open_releases_buy">
      <span class="open_releases_price">15€</span>
      <span class="open_releases_market"><a href=""><?php echo __('Ajouter au panier') ?></a> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/img-panier.png" alt="" /></span>
    </p>
    <hr>
    <p class="open_releases_share"><?php echo __('Partager') ?></p>

    </div><!-- end of grid_6 -->
  </div><!-- enf of release_content -->
  </div><!-- end of grid_12 release_open -->
