

      <div class="clear"></div><!-- end of clear -->

      <div class="grid_12 header_nav_3">
        <div class="header_nav_3_content">
          <ul id="menu-main" class="header_nav_3_content_list">
            <li class="header_nav_3_content_logo"><a href="<?php echo url_for('@homepage') ?>"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/logo/logo-dhr.png" alt="logo" /></a></li>
            <li><a href="#discography"><?php echo __('Releases') ?></a></li>
            <li><a href="#artists"><?php echo __('Artists') ?></a></li>
            <li><a href="#artwork_artists"><?php echo __('Illustrators') ?></a></li>
            <li><a href="#informations"><?php echo __('About') ?></a></li>
            <li> <a href="#videos"><?php echo __('Documentary') ?></a></li>

            <!-- <li><a href="https://dahearditrecords.bandcamp.com/"><?php echo __('Bandcamp') ?></a></li> -->

            <!-- <li> <a href="http://www.daheardit-records.net/radio"><?php echo __('Radio') ?></a></li> -->

            <!--<li><a href="http://www.musiques-incongrues.net/forum/labels/daheardit-records/"><?php echo __('Forum') ?></a></li> -->
            <li><a href="https://www.helloasso.com/associations/constructions-incongrues" class="donate"><?php echo __('Support') ?>
</li>
<li><a href="<?php echo url_for('@homepage_localized?sf_culture=fr') ?>">FR </a> / <a href="<?php echo url_for('@homepage_localized?sf_culture=en') ?>">EN</a></li>

          </ul>

        </div><!-- end of header_nav_3_content -->
