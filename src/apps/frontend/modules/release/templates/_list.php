      <div class="grid_12 releases_discography">
        <div class="releases_discography_listing_all">
<?php for ($i = 0; $i < count($releases); $i++): ?>
<?php $release = $releases[$i] ?>
  <?php if ($i %4 === 0): ?>
          <div class="grid_3 releases_discography_number releases_discography_number_first ">
  <?php else: ?>
          <div class="grid_3 releases_discography_number ">
  <?php endif; ?>
           <p><a data-pjax="#content_async" href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>"> <span class="calque_releases"> </span></a></p>
  <?php if ($release['is_new']): ?>
            <span class="releases_discography_last_release"><?php echo __('Nouveau') ?></span>  
  <?php endif; ?>
          <img height="220px" width="220px" src="<?php echo $release['image'] ?>" />
            <h1><a data-pjax="#content_async" href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>"> <?php echo $release['Artist']['name'] ?></a> - <a data-pjax="#content_async" title="<?php echo $release['title'] ?>" href="<?php echo url_for(sprintf('@release_show?slug=%s#release', $release['slug'])) ?>"><?php echo truncate_text($release['title'], 20) ?></a></h1>
          </div><!-- end of grid_3 releases_discography_number  -->
<?php endfor; ?>
<?php $j = count($releases) + 4 ?>
<?php for ($i; $i < $j; $i++): ?>
  <?php if ($i % 4 === 0): break; endif; ?>
        <div class="grid_3 releases_discography_number_default"></div>
<?php endfor; ?>
        </div><!-- end of releases_discography -->
      </div><!-- end of discogs -->