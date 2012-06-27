      <div class="grid_12 artists_listing_all">
        <div class="artists_content">
<?php for ($i = 0; $i < count($artists); $i++): ?>
<?php $artist = $artists[$i] ?>
  <?php if ($i % 4 === 0): ?>
          <div class="grid_3 artists_show_first">
  <?php else: ?>
  		  <div class="grid_3 artists_show">
  <?php endif; ?>
            <p><a href="<?php echo url_for('@artist_show?slug='.$artist['slug']) ?>#artist"> <span class="calque_artists"> </span></a></p>
            <img src="<?php echo $artist['image'] ?>" class="artists_pictures" />
            <p class="artists_title"><a href="<?php echo url_for('@artist_show?slug='.$artist['slug']) ?>#artist"><?php echo $artist['name'] ?></a></p>
          </div><!-- end of grid_3 -->
<?php endfor; ?>

<?php $j = count($artists) + 4 ?>
<?php for ($i; $i < $j; $i++): ?>
  <?php if ($i % 4 === 0): break; endif; ?>
        <div class="grid_3 artists_show_default"/></div>
<?php endfor; ?>
        </div><!-- enf of artists content -->
      </div><!-- end of artists -->

