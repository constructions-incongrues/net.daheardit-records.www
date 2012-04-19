      <div class="grid_12 artists_listing_all">
        <div class="artists_content">

<?php for ($i = 0; $i < count($artists); $i++): ?>
<?php $artist = $artists[$i] ?>
          <div class="grid_3 artists_show">
            <span class="calque_artists"> </span>
            <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/artists/<?php echo $artist['image'] ?>" class="artists_pictures" />
            <p class="artists_title"><a href=""><?php echo $artist['name'] ?></a></p>
          </div><!-- end of grid_3 -->
<?php if ($i % 4 === 0): ?>
          <div class="clear"></div>
<?php endif; ?>
<?php endfor; ?>

        </div><!-- enf of artists content -->
      </div><!-- end of artists -->

