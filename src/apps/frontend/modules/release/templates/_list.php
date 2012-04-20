      <div class="grid_12 releases_discography">
        <div class="releases_discography_listing_all">
<?php for ($i = 0; $i < count($releases); $i++): ?>
<?php $release = $releases[$i] ?>
          <div class="grid_3 releases_discography_number releases_discography_number_first ">
            <span class="calque_releases"> </span>
            <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/nouveau.png" class="releases_discography_last_release"/> 
            <img height="220px" width="220px" src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/artwork/<?php echo $release['image'] ?>" />
            <h1><a href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>"><?php echo $release['sku'] ?></a></h1>
            <h2><a title="<?php echo sprintf('%s - %s', $release['Artist']['name'], $release['title']) ?>" href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>"><?php echo truncate_text(sprintf('%s - %s', $release['Artist']['name'], $release['title']), 20) ?></a></h2>
            <ul class="releases_discography_button">
              <li><a href=""><?php echo __('Ajouter au panier') ?></a></li>
            </ul>
          </div><!-- end of grid_3 releases_discography_number  -->
  <?php if ($i % 4 == 0): ?>
          <div class="clear"></div>
  <?php endif; ?>
<?php endfor; ?>
        </div><!-- end of releases_discography -->
      </div><!-- end of discogs -->