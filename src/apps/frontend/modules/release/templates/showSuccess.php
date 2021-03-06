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
    <h2 class="open_releases_artist"><a href="<?php echo url_for(sprintf('@artist_show?slug=%s#artist', $release['Artist']['slug'])) ?>"><?php echo $release['Artist']['name'] ?></a> / <?php echo $release['title'] ?></h2>

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
      <img id="carousel-current" height="460px" width="460px" src="<?php echo sprintf('//%s/thumbnail/_/500/500/crop/best%s', sfConfig::get('app_api_url_root'), $release['artworks'][0]) ?>" />
<?php for ($i = 1; $i < count($release['artworks']); $i++): ?>
      <p></p>
      <img height="460px" width="460px" src="<?php echo sprintf('//%s/thumbnail/_/500/500/crop/best%s', sfConfig::get('app_api_url_root'), $release['artworks'][$i]) ?>" />
<?php endfor ?>
     </ul>

<?php if (count($release['videos'])): ?>
  <p></p>
  <?php foreach ($release['videos'] as $video): ?>
    <iframe width="100%" height="250" src="<?php echo $video ?>" frameborder="0" allowfullscreen></iframe>
  <?php endforeach ?>
<?php endif ?>
   </div><!-- end of grid_6 -->

    <div class="grid_6 open_releases_infos">
<div class="open_releases_press_text">
  <?php echo html_entity_decode($release['player_code']) ?>
</div>

<br>
<?php if ($release['is_available']): ?>
  <p class="open_releases_buy">
    <span style="font-weight: bold;">Acheter :</span>
    <?php foreach ($release['prices'] as $price): ?>
    <?php if (is_numeric($price['price'])): ?>
      <a href="" class="paypal" data-paypalid="<?php echo $price['paypal_id'] ?>"><?php echo $price['format'] ?>  <?php echo $price['price'] ?> €</a>
    <?php else: ?>
      <a href="" class="paypal" data-paypalid="<?php echo $price['paypal_id'] ?>"><?php echo $price['format'] ?>  <?php echo $price['price'] ?> / </a>
    <?php endif ?> ▪
    <?php endforeach; ?>
  </p>
<?php endif ?>

<?php if (count($archives)): ?>
  <p class="open_releases_buy">
    <span style="font-weight: bold;">Télécharger :</span>
  <?php foreach ($archives as $archive): ?>
      <a class="release-download" data-dhr-release-slug="<?php echo $release['slug'] ?>" data-dhr-archive-format="<?php echo $archive['name'] ?>" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/assets/releases/<?php echo $release['slug'] ?>/archives/<?php echo $archive['filename'] ?>"><?php echo strtolower($archive['name']) ?></a> ▪
  <?php endforeach ?>
<?php endif ?>
</ul>

<?php if (count($archives)): ?>
  <p class="open_releases_buy">
    <span style="font-weight: bold;">Écouter :</span>

  <?php foreach ($release['streaming'] as $link): ?>
      <a class="release-download" href="<?php echo $link['url'] ?>"><?php echo strtolower(basename($link['title'])) ?></a> ▪
  <?php endforeach ?>
  </p>
<?php endif ?>
</ul>



    <p class="open_releases_press_text press credits">

<?php echo nl2br(html_entity_decode($release['Translation'][$sf_user->getCulture()]['presentation'])) ?>
<?php if (count($release['press'])): ?>
  <br />- <br />
<br />
Chroniques : <?php foreach ($release['press'] as $link): ?>
       <a href="<?php echo $link['url'] ?>"><?php echo basename($link['title']) ?></a> ▪
  <?php endforeach ?>
<?php endif ?>
<br>
<?php echo nl2br(html_entity_decode($release['credits'])) ?>
<?php if (isset($release['ArtworkArtist'])): ?>
Illustration : <a href="<?php echo url_for(sprintf('@artwork_artist_show?slug=%s#artwork_artist', $release['ArtworkArtist']['slug'])) ?>"><?php echo $release['ArtworkArtist']['name'] ?></a><br>
<?php endif ?>
Date de sortie : <?php echo $release['released_at'] ?>

</p>

    <p class="open_releases_download_licence">
<?php if ($release['license']): ?>
    <?php echo html_entity_decode($release['license']) ?>
<?php else: ?>
        Cette œuvre est mise à disposition selon les termes de la <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/deed.fr">Licence Creative Commons Attribution - Pas d’Utilisation Commerciale - Pas de Modification 4.0 France</a>.
<?php endif ?>
    </p>

<?php if (isset($release['press-releases']) && count($release['press-releases'])): ?>
    <ul class="open_releases_reviews">
  <?php foreach ($release['press-releases'] as $link): ?>
      <li><a href="<?php echo $link['url'] ?>"><?php echo basename($link['title']) ?></a></li>
  <?php endforeach ?>
    </ul>
<?php endif ?>



    </div><!-- end of grid_6 -->
  </div><!-- enf of release_content -->
  </div><!-- end of grid_12 release_open -->
