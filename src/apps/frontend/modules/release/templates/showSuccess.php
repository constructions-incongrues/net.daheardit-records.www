<?php slot('morescript') ?>
<?php if ($release['url_header']): ?>
    <script>
        $(document).ready(function() {
            $('.header').click(function() {
                window.location = '<?php echo $release['url_header'] ?>';
            });
        });
    </script>
<?php endif; ?>
<?php end_slot(); ?>

<!-- @see https://github.com/defunkt/jquery-pjax -->
<title><?php echo $sf_response->getTitle() ?></title>

<div class="grid_12 releases">
        <div class="category_content">
          <h1 id="release"><?php echo $release['sku'] ?> </h1>
            <span class="triangle"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/others/triangle-bord.png" class="triangle" /></span>
        </div><!-- end of category contents -->
      </div><!-- end of releases -->

<div class="grid_12 open_releases">
  <div class="open_releases_content">

  <div class="grid_12">
    <ul class="open_releases_button">
<?php if ($previousRelease): ?>
      <li class="open_releases_button_left"> <a class="previous" href="<?php echo url_for('@release_show?slug='.$previousRelease['slug'].'#release') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" title="<?php echo sprintf('[%s] %s', $previousRelease['sku'], $previousRelease['title' ]) ?>" /> </a></li>
<?php endif; ?>
<?php if ($nextRelease): ?>
      <li class="open_releases_button_right"> <a class="next" href="<?php echo url_for('@release_show?slug='.$nextRelease['slug'].'#release') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" title="<?php echo sprintf('[%s] %s', $nextRelease['sku'], $nextRelease['title' ]) ?>" />  </a></li>
<?php endif; ?>
      <li class="open_releases_button_close"> <a class="close" href="<?php echo url_for('@homepage#discography') ?>" data-close="#content_async" title="<?php echo __('Retourner à la liste des sorties') ?>"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" alt="Close" /> </a></li>
    </ul>
  </div>
  <hr class="open_releases_button_hr" />

    <div class="grid_6 open_releases_artwork">
      <span class="calque_artwork"> </span>
      <img id="carousel-current" height="460px" width="460px" src="<?php echo sprintf('//%s/thumbnail/_/500/500/crop/best%s', sfConfig::get('app_api_url_root'), $release['artworks'][0]) ?>" />
<?php for ($i = 1; $i < count($release['artworks']); $i++): ?>
      <img style="display:none;" height="460px" width="460px" src="<?php echo sprintf('//%s/thumbnail/_/500/500/crop/best%s', sfConfig::get('app_api_url_root'), $release['artworks'][$i]) ?>" />
<?php endfor ?>
      <ul class="open_releases_nav_artwork">
            <li>
              <a class="carousel-nav current" href="<?php echo sprintf('//%s/thumbnail/_/500/500/crop/best%s', sfConfig::get('app_api_url_root'), $release['artworks'][0]) ?>" title="<?php echo __("Survolez l'image pour mettre le carousel en pause") ?>">
                <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/caroussel-release-hover.png" />
              </a>
            </li>
<?php for ($i = 1; $i < count($release['artworks']); $i++): ?>
            <li>
              <a class="carousel-nav" href="<?php echo sprintf('//%s/thumbnail/_/500/500/crop/best%s', sfConfig::get('app_api_url_root'), $release['artworks'][$i]) ?>" title="<?php echo __("Survolez l'image pour mettre le carousel en pause") ?>">
                <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/caroussel-release.png" />
              </a>
            </li>
<?php endfor ?>
     </ul>
     <?php if (isset($release['ArtworkArtist'])): ?>
    <h2 class="open_releases_artwork_credit"><?php echo __('Illustration : ') ?><a href="<?php echo url_for(sprintf('@artwork_artist_show?slug=%s#artwork_artist', $release['ArtworkArtist']['slug'])) ?>" title="<?php echo $release['ArtworkArtist']['name'] ?>"><?php echo $release['ArtworkArtist']['name'] ?></a></h2>
<?php else: ?>
    <h2 class="open_releases_artwork_credit"><?php echo __('Illustration : ') ?><a href="<?php echo url_for(sprintf('@artist_show?slug=%s#artist', $release['Artist']['slug'])) ?>" title="<?php echo $release['Artist']['name'] ?>"><?php echo $release['Artist']['name'] ?></a></h2>
<?php endif ?>

<?php if (count($release['videos'])): ?>
  <?php foreach ($release['videos'] as $video): ?>
    <iframe width="100%" height="250" src="<?php echo $video ?>" frameborder="0" allowfullscreen></iframe>
  <?php endforeach ?>
<?php endif ?>
   </div><!-- end of grid_6 -->

    <div class="grid_6 open_releases_infos">

    <h1 class="open_releases_catalog"><?php echo $release['sku'] ?>
<?php if ($release['released_at']): ?>
     - <span class="open_releases_infos_date"><?php echo $release['released_at'] ?></span>
<?php endif; ?>


   </h1>
    <h2 class="open_releases_artist"><a href="<?php echo url_for(sprintf('@artist_show?slug=%s#artist', $release['Artist']['slug'])) ?>"><?php echo $release['Artist']['name'] ?></a></h2>
    <h3 class="open_releases_album"><?php echo $release['title'] ?> </h3>

    <div id="jquery_jplayer_1" class="jp-jplayer"></div>

    <div id="jp_container_1" class="jp-audio">
      <div class="jp-type-playlist">
        <div class="jp-gui jp-interface">
         <ul class="jp-controls" style="display:none;">
            <li><a href="javascript:;" class="jp-previous" tabindex="1">previous</a></li>
            <li><a href="javascript:;" class="jp-play" tabindex="1">play</a></li>
            <li><a href="javascript:;" class="jp-pause" tabindex="1">pause</a></li>
            <li><a href="javascript:;" class="jp-next" tabindex="1">next</a></li>
            <li><a href="javascript:;" class="jp-stop" tabindex="1">stop</a></li>
          </ul>
          <div class="jp-progress" style="display:none;">
            <div class="jp-seek-bar">
              <div class="jp-play-bar"></div>
            </div>
          </div>

          <div class="jp-current-time" style="display:none;"></div>
          <div class="jp-duration" style="display:none;"></div>
        </div>
        <div class="jp-playlist">
          <ul class="open_releases_playlist">
            <li></li>
          </ul>
        </div>
        <div class="jp-no-solution">
          <p><?php echo __('Chargement du player en cours. Patience :)') ?></p>
        </div>
      </div>
    </div>


    <ul class="open_releases_playlist" style="display:none;">
<?php foreach ($release['tracks'] as $track): ?>
    <?php if ($track['number'] < 10): ?>
      <?php $zero = '0'; ?>
    <?php else: ?>
      <?php $zero = ''; ?>
    <?php endif; ?>
    <li itemprop="track" itemscope itemtype="http://schema.org/MusicRecording">
      <a itemprop="url" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/assets/releases/<?php echo $release['slug'] ?>/tracks/<?php echo str_replace('-', '', $release['slug']) ?>_<?php echo $zero ?><?php echo $track['number'] ?>.mp3">
        <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/play.png" alt="play" class="open_releases_playlist_icon_play" />
        <span itemprop="name"><?php echo $track['title'] ?></span>
      </a>
      <meta itemprop="inAlbum" content="<?php echo htmlentities($release['title']) ?>" />
      <meta itemprop="byArtist" content="<?php echo htmlentities($release['Artist']['name']) ?>" />
      <meta itemprop="duration" content="PT6M33S" />
    </li>
  <?php endforeach; ?>
    </ul>

<?php if (count($archives)): ?>
    <span style="margin-top:-25px;"> </span>
    <h2 class="open_releases_title"><?php echo __('Télécharger librement') ?> ou faire un <a href="https://www.helloasso.com/associations/constructions-incongrues/formulaires/1" class="donate">&hearts; <?php echo __('don') ?> &hearts;</a></h2>

    <ul class="open_releases_download">
  <?php foreach ($archives as $archive): ?>
      <li><a class="release-download" data-dhr-release-slug="<?php echo $release['slug'] ?>" data-dhr-archive-format="<?php echo $archive['name'] ?>" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/assets/releases/<?php echo $release['slug'] ?>/archives/<?php echo $archive['filename'] ?>"><?php echo strtoupper($archive['name']) ?></a></li>
  <?php endforeach ?>
    </ul>
<?php endif ?>

    <p class="open_releases_download_licence">
<?php if ($release['license']): ?>
    <?php echo html_entity_decode($release['license']) ?>
<?php else: ?>
        Cette œuvre est mise à disposition selon les termes de la <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/deed.fr">Licence Creative Commons Attribution - Pas d’Utilisation Commerciale - Pas de Modification 4.0 France</a>.
<?php endif ?>
    </p>

<?php if (count($release['streaming'])): ?>
  <span style="margin-top:-25px;"> </span>
  <h3 class="open_releases_title"><?php echo __('Écouter en streaming') ?></h3>
  <ul class="open_releases_download">
  <?php foreach ($release['streaming'] as $link): ?>
      <li><a class="release-download" href="<?php echo $link['url'] ?>"><?php echo basename($link['title']) ?></a></li>
  <?php endforeach ?>
  </ul>
<?php endif ?>


<?php if ($release['is_available']): ?>
    <h3 class="open_releases_title"><?php echo __('Acheter une copie physique') ?></h3>
    <?php foreach ($release['prices'] as $price): ?>
    <p class="open_releases_buy">
    <?php if (is_numeric($price['price'])): ?>
      <span class="open_releases_price"><?php echo $price['format'] ?> : <?php echo $price['price'] ?> €</span>
    <?php else: ?>
      <span class="open_releases_price"><?php echo $price['format'] ?> : <?php echo $price['price'] ?></span>
    <?php endif ?>
    <?php if ($price['paypal_id']): ?>
      <span class="open_releases_market"><a href="" class="paypal" data-paypalid="<?php echo $price['paypal_id'] ?>"><?php echo __('Ajouter au panier') ?></a> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/img-panier.png" alt="" /></span>
    <?php endif ?>
    </p>
    <?php endforeach; ?>
<?php endif ?>


</ul>

    <h1 class="open_releases_title">

    <?php echo __('À propos de la sortie') ?></h1>

    <p class="open_releases_press_text">
<?php echo nl2br(html_entity_decode($release['Translation'][$sf_user->getCulture()]['presentation'])) ?>
    </p>

<?php if (count($release['presskits'])): ?>
    <h1 class="open_releases_title">PDF</h1>
    <ul class="open_releases_reviews">
  <?php foreach ($release['presskits'] as $presskit): ?>
      <li><a href="<?php echo $presskit['url'] ?>"><?php echo $presskit['name'] ?></a></li>
  <?php endforeach ?>
    </ul>
<?php endif ?>

<?php if (isset($release['press-releases']) && count($release['press-releases'])): ?>
    <ul class="open_releases_reviews">
  <?php foreach ($release['press-releases'] as $link): ?>
      <li><a href="<?php echo $link['url'] ?>"><?php echo basename($link['title']) ?></a></li>
  <?php endforeach ?>
    </ul>
<?php endif ?>

<?php if (count($release['press'])): ?>
    <h1 class="open_releases_title"><?php echo __('Ils en parlent') ?></h1>
    <ul class="open_releases_reviews">
  <?php foreach ($release['press'] as $link): ?>
      <li><a href="<?php echo $link['url'] ?>"><?php echo basename($link['title']) ?></a></li>
  <?php endforeach ?>
    </ul>
<?php endif ?>


    </div><!-- end of grid_6 -->
  </div><!-- enf of release_content -->
  </div><!-- end of grid_12 release_open -->
