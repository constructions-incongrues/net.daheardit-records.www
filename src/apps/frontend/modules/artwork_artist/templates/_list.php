      <div class="grid_12  artwork_artist">
        <div class="artists_content">
<?php for ($i = 0; $i < count($artists); $i++): ?>
<?php $artist = $artists[$i] ?>
  <?php if ($i % 4 === 0): ?>
          <div class="grid_3 artists_show_artwork_first">
  <?php else: ?>
        <div class="grid_3 artists_show_artwork ">
  <?php endif; ?>
            <p><a href="<?php echo url_for('@artwork_artist_show?slug='.$artist['slug']) ?>#artwork_artist"> <span class="calque_artists_artwork"> </span></a></p>
            <img src="<?php echo $artist['image'] ?>" class="artists_artwork_pictures hexagon" />


            <p class="artists_artwork_title "><a href="<?php echo url_for('@artwork_artist_show?slug='.$artist['slug']) ?>#artwork_artist"><?php echo $artist['name'] ?></a></p>
          </div><!-- end of grid_3 -->
<?php endfor; ?>

<?php $j = count($artists) + 4 ?>
<?php for ($i; $i < $j; $i++): ?>
  <?php if ($i % 4 === 0): break; endif; ?>
        <div class="grid_3 artists_show_artwork_default"/></div>
<?php endfor; ?>
        </div><!-- enf of artists content -->
      </div><!-- end of artists -->

