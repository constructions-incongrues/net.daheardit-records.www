      <div class="header_content">

        <div class="grid_9 header_nav_1 alpha">
          <h1 class="header_title_dhr"><a href="<?php echo url_for('@homepage') ?>">da ! heard it records</a></h1>
        </div> <!-- .grid_9 -->
        <div class="grid_3 header_nav_2 omega" >
          <ul class="header_nav_2_icon">
<?php include_partial('main/social') ?>
            <li><a href="" class="paypal-cart"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/img-panier.png" /></a></li>
            <li class="header_nav_2_button_lang"><a href="<?php echo url_for('@homepage_localized?sf_culture=fr') ?>">FR</a></li>
            <li class="header_nav_2_button_lang"><a href="<?php echo url_for('@homepage_localized?sf_culture=en') ?>">EN</a></li>
          </ul>
        </div><!-- .grid_3 -->
      </div><!-- end of header_content -->

      <div class="clear"></div><!-- end of clear -->

      <div class="grid_12 header_nav_3">
        <div class="header_nav_3_content">
          <ul id="menu-main">
            <li class="header_nav_3_content_logo"><a href="<?php echo url_for('@homepage') ?>"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/logo/logo-dhr.png" alt="logo" /></a></li>
            <li><a href="#artists"><?php echo __('Artistes') ?></a></li>
            <li><a href="#discography"><?php echo __('Discographie') ?></a></li>
            <li><a href="#informations"><?php echo __('Informations') ?></a></li>
            <li><a href="#contact"><?php echo __('Contact') ?></a></li>
            <li><a href="#links"><?php echo __('Liens') ?></a></li>
            <li><a href="http://www.musiques-incongrues.net/forum/labels/daheardit-records/"><?php echo __('Forum') ?></a></li>
            <li class="header_nav_3_button_donate"><a href="#" class="donate paypal" data-paypalid="RDMSQRU34X5YS">&hearts; <?php echo __('Dons') ?> &hearts; </a></li>
          </ul>
        </div><!-- end of header_nav_3_content -->