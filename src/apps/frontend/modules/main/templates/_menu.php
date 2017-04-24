

      <div class="clear"></div><!-- end of clear -->

      <div class="grid_12 header_nav_3">
        <div class="header_nav_3_content">
          <ul id="menu-main" class="header_nav_3_content_list">
            <li class="header_nav_3_content_logo"><a href="<?php echo url_for('@homepage') ?>"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/logo/logo-dhr.png" alt="logo" /></a></li>
            <li><a href="#discography"><?php echo __('Discographie') ?></a></li>
            <li><a href="#artists"><?php echo __('Artistes') ?></a></li>
            <li><a href="#artwork_artists"><?php echo __('Illustrations') ?></a></li>
            <li> <a href="#vids"><?php echo __('Vidéos') ?></a></li>
            <li><a href="#informations"><?php echo __('Contact') ?></a></li>
            <li><a href="#links"><?php echo __('Liens') ?></a></li>
            <li><a href="<?php echo url_for('@homepage_localized?sf_culture=fr') ?>">FR </a> / <a href="<?php echo url_for('@homepage_localized?sf_culture=en') ?>">EN</a></li>
            <!--<li><a href="http://www.musiques-incongrues.net/forum/labels/daheardit-records/"><?php echo __('Forum') ?></a></li> -->
            <li class="header_nav_3_button_donate donate_infos"><a href="https://www.helloasso.com/associations/constructions-incongrues" class="donate"><?php echo __('Dons') ?>
</li>
          </ul>

        </div><!-- end of header_nav_3_content -->
