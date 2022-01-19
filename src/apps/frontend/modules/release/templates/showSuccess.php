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
          <h1 id="release"></h1>
            <span class="triangle"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/others/triangle-bord.png" class="triangle" /></span>
        </div><!-- end of category contents -->
      </div><!-- end of releases -->

<div class="grid_12 open_releases">
  <div class="open_releases_content">

     <ul class="open_releases_button">
<?php if ($previousRelease): ?>
      <li class="open_releases_button_left"> <a class="previous" href="<?php echo url_for('@release_show?slug='.$previousRelease['slug'].'#release') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" title="<?php echo sprintf('[%s] %s', $previousRelease['sku'], $previousRelease['title' ]) ?>" /> </a></li>
<?php endif; ?>
<?php if ($nextRelease): ?>
      <li class="open_releases_button_right"> <a class="next" href="<?php echo url_for('@release_show?slug='.$nextRelease['slug'].'#release') ?>" data-pjax="#content_async"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" title="<?php echo sprintf('[%s] %s', $nextRelease['sku'], $nextRelease['title' ]) ?>" />  </a></li>
<?php endif; ?>
      <li class="open_releases_button_close"> <a class="close" href="<?php echo url_for('@homepage#discography') ?>" data-close="#content_async" title="<?php echo __('Retourner à la liste des sorties') ?>"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/hack.png" alt="Close" /> </a></li>
    </ul>
 


<div class="presentation">
      <h2 class="open_releases_artist">
      <span class="date_release"></span>
      <span class="sku"><?php echo $release['sku'] ?> / <a href="https://creativecommons.org/licenses/by-nc-nd/4.0/">CC BY-NC-ND 4.0</a> /

      <?php echo $release['released_at'] ?> </span> 
<a href="<?php echo url_for(sprintf('@artist_show?slug=%s#artist', $release['Artist']['slug'])) ?>"><br /><?php echo $release['Artist']['name'] ?></a>  <?php echo $release['title'] ?> </h2>
<img id="carousel-current" height="30%" width="40%" style="float:left;padding:9px 20px 0px 0px" src="<?php echo sprintf('//%s/thumbnail/_/500/500/crop/best%s', sfConfig::get('app_api_url_root'), $release['artworks'][0]) ?>" />
<p class="text-bio"><?php echo nl2br(html_entity_decode($release['Translation'][$sf_user->getCulture()]['presentation'])) ?>
</p>
 </div>
    <div class="grid_12 open_releases_artwork">
      <!-- <img id="carousel-current" height="460px" width="460px" src="<?php echo sprintf('//%s/thumbnail/_/500/500/crop/best%s', sfConfig::get('app_api_url_root'), $release['artworks'][0]) ?>" /> -->
<?php for ($i = 1; $i < count($release['artworks']); $i++): ?>
      <!-- <img height="460px" width="460px" src="<?php echo sprintf('//%s/thumbnail/_/500/500/crop/best%s', sfConfig::get('app_api_url_root'), $release['artworks'][$i]) ?>" /> -->
<?php endfor ?>

<?php if (count($release['videos'])): ?>
  <?php foreach ($release['videos'] as $video): ?>
    <iframe width="100%" height="250" src="<?php echo $video ?>" frameborder="0" allowfullscreen></iframe>
  <?php endforeach ?>
<?php endif ?>

    <div class="grid_12 open_releases_infos">
      <div class="grid_6">  <?php echo html_entity_decode($release['player_code']) ?>

  </div>
  <div class="grid_6 open_releases_infos2">

  <p class="open_releases_buy">

<?php if ($release['is_available']): ?>
    <!-- <span style="font-weight: bold;">Acheter :</span> -->
    <?php foreach ($release['prices'] as $price): ?>
    <?php if (is_numeric($price['price'])): ?>
      <a href="" class="paypal" data-paypalid="<?php echo $price['paypal_id'] ?>"><?php echo $price['format'] ?>  <?php echo $price['price'] ?> </a>
    <?php else: ?>
      <a href="" class="paypal" data-paypalid="<?php echo $price['paypal_id'] ?>"><?php echo $price['format'] ?>  <?php echo $price['price'] ?> -  </a>
    <?php endif ?> 
    <?php endforeach; ?><?php endif ?>

<?php if (count($archives)): ?>
    <!-- <span style="font-weight: bold;">Télécharger :</span> -->
  <?php foreach ($archives as $archive): ?>
      <a class="release-download" data-dhr-release-slug="<?php echo $release['slug'] ?>" data-dhr-archive-format="<?php echo $archive['name'] ?>" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/assets/releases/<?php echo $release['slug'] ?>/archives/<?php echo $archive['filename'] ?>"><?php echo strtolower($archive['name']) ?></a> -
  <?php endforeach ?>
<?php endif ?>

<?php if (count($archives)): ?>
    <!-- <span style="font-weight: bold;">Écouter :</span> -->

  <?php foreach ($release['streaming'] as $link): ?>
      <a class="release-download" href="<?php echo $link['url'] ?>"><?php echo strtolower(basename($link['title'])) ?></a> -
  <?php endforeach ?>
  </p>
<?php endif ?>
</ul>
  </p>

  <?php if (isset($release['press-releases']) && count($release['press-releases'])): ?>
    <ul class="open_releases_reviews">
  <?php foreach ($release['press-releases'] as $link): ?>
      <li><a href="<?php echo $link['url'] ?>"><?php echo basename($link['title']) ?></a>d</li>
  <?php endforeach ?>
    </ul>
<?php endif ?>
  <p class="open_releases_download_licence">
<?php if ($release['license']): ?>
    <?php echo html_entity_decode($release['license']) ?>

<?php else: ?>

Artwork by <a href="<?php echo url_for(sprintf('@artwork_artist_show?slug=%s#artwork_artist', $release['ArtworkArtist']['slug'])) ?>"><?php echo $release['ArtworkArtist']['name'] ?></a><br>
<?php echo nl2br(html_entity_decode($release['credits'])) ?></p>

<?php endif ?>
<?php if (count($release['press'])): ?>
<span>reviews :</span>
<?php foreach ($release['press'] as $link): ?>
        <span class="reviews"> <a href="<?php echo $link['url'] ?>"><?php echo basename($link['title']) ?></a> / </span>
  <?php endforeach ?>
<?php endif ?>
    </p>
</div>
</div>
</div>

</p>








    </div><!-- end of grid_6 -->
  </div><!-- enf of release_content -->
  </div><!-- end of grid_12 release_open -->