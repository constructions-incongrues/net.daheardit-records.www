<!doctype html>
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="<?php echo $sf_request->getParameter('sf_culture', 'fr') ?>" prefix="og: http://ogp.me/ns#"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta name="google-site-verification" content="GZLJrrM8tvBsh05BvBY8GHUsEFhojyg5inFZAfaHh-Y" />
  <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> -->

  <title><?php echo $sf_response->getTitle() ?> | Da ! Heard It Records</title>

  <meta name="viewport" content="width=device-width,initial-scale=1">

  <!-- 960 Grid system-->
  <link rel="stylesheet" type="text/css" media="all" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/css/lib/960.gs/reset.css" />
  <link rel="stylesheet" type="text/css" media="all" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/css/lib/960.gs/text.css" />
  <link rel="stylesheet" type="text/css" media="all" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/css/lib/960.gs/fluid_grid.css" />

  <link rel="stylesheet" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/css/main.css">

<?php if (sfConfig::get('app_feeds_use_feedburner', false)): ?>
  <link rel="alternate" type="application/rss+xml" title="<?php echo __('Flux RSS des dernières nouvelles') ?>" href="http://feeds.feedburner.com/dhr-news-<?php echo $sf_request->getParameter('sf_culture', 'fr') ?>">
<?php else: ?>
  <link rel="alternate" type="application/rss+xml" title="<?php echo __('Flux RSS des dernières nouvelles') ?>" href="<?php echo url_for('@feeds_posts?sf_culture='.$sf_request->getParameter('sf_culture', 'fr')) ?>">
<?php endif; ?>

  <!-- favicon and other icons -->
  <link rel="shortcut icon" type="image/png" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/favicon.png" />
  <link rel="apple-touch-icon" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/apple-touch-icon-72.png" />
  <link rel="apple-touch-icon" sizes="72x72" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/apple-touch-icon-72.png" />
  <link rel="apple-touch-icon" sizes="114x114" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/apple-touch-icon-114.png" />

  <!-- Opengraph -->
<?php foreach ($sf_response->getMetas() as $name => $value): ?>
  <meta property="<?php echo $name ?>" content="<?php echo html_entity_decode(str_replace('&amp;#039;', "'", $value), ENT_QUOTES) ?>" />
<?php endforeach ?>

  <!--[if IE lte IE 8]>

  <link rel="stylesheet" type="text/css" media="all" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/css/lte_ie8.css" />

  <![endif]-->

  <!-- prefix-free -->
  <script src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/js/prefixfree.min.js"></script>

  <script>
  dhrUriRoot = '<?php echo $sf_request->getRelativeUrlRoot() ?>';
  </script>
</head>
<body>


  <div class="container_12" id="top">

    <div class="grid_12 header">

      <span class="header_calque"></span>

<?php include_partial('main/menu') ?>

        <div class="grid_12 header_news_1">
          <div class="header_news_1_content">
<?php include_component('release', 'hometitle') ?>
          </div><!-- header_news_1_content -->
        </div><!-- end of header_news_1 -->

<?php include_component('post', 'list') ?>

      </div> <!-- end of header -->

  <div class="clear"></div>

<div class="clear"></div>

<span id="content_async">
<?php echo $sf_content ?>
</span>

      <div class="grid_12 releases">
        <div class="category_content">
          <h1 id="discography"><?php echo __('Discographie') ?></h1>
            <span class="triangle"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/others/triangle.png" class="triangle" /></span>
        </div><!-- end of category contents -->
      </div><!-- end of releases -->

      <div class="clear"></div>

<?php include_component('release', 'list') ?>

      <div class="grid_12 artists">
        <div class="artists_content">
                    <span class="artist_button_top"><a href="#top"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/top_black.png" alt="TOP"></a></span>

          <h1 id="artists"><?php echo __('Artistes') ?></h1>
    <span class="triangle"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/others/triangle-blanc.png" class="triangle" /></span>

        </div><!-- end of category_contents -->
      </div><!-- end of category -->

<?php include_component('artist', 'list') ?>

      <div class="grid_12 category_infos">
         <div class="category_content">
          <h1 id="informations"><?php echo __('Informations') ?></h1>
                      <span class="triangle"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/others/triangle.png" class="triangle" /></span>

          <span class="infos_button_top"><a href="#top"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/top.png" alt="TOP"></a></span>
        </div><!-- end of category_contents -->
      </div><!-- end of category -->

      <div class="grid_12 infos">

        <div class="infos_content">

          <div class="grid_7 infos_descr">
            <p>
            <?php include_component('content', 'show', array('block' => 'informations')) ?>
            </p>

            <h3><?php echo __('Greetings') ?></h3>
            <p>
            <?php include_component('content', 'show', array('block' => 'greetings')) ?>
            </p>
          </div><!-- end of .infos_descr -->

          <div class="grid_5 infos_vids">
            <?php include_component('content', 'show', array('block' => 'footer_video')) ?>
          </div><!-- end of infos_vids -->
        </div><!-- end of .infos-->
      </div><!-- end of .infos content -->


      <div class="grid_12 footer">

        <div class="category_content">
          <span class="footer_button_top"><a href="#top"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/top.png" alt="TOP"></a></span>
        </div><!-- end of category_contents -->

        <div class="footer_content">

          <div class="grid_3 footer_links_1">

            <h1 id="links"><?php echo __('Links') ?></h1>

            <?php include_component('content', 'show', array('block' => 'links1')) ?>

          </div><!-- end of links -->

          <div class="grid_3 footer_links_2">

          <?php include_component('content', 'show', array('block' => 'links2')) ?>

          </div><!-- end of links -->

          <div class="grid_6 footer_contact">
            <h1 id="contact"><?php echo __('Contact') ?></h1>
            <ul class="footer_nav_1">
<?php include_partial('main/social') ?>
            </ul>

            <h2><?php echo __('Adresse') ?></h2>

            <p>
              Da ! Heard It Records <br/>
              34, Rue des gardes <br />
              75018 PARIS FRANCE<br />
              <a href="mailto:contact@daheardit-records.net">contact@daheardit-records.net</a>
            </p>

            <h2><?php echo __('Envoyer une demo') ?></h2>
            <p><?php echo __('Merci d\'envoyer vos demos par la poste ou par e-mail à') ?>
              <a href="mailto:demo@daheardit-records.net">demo@daheardit-records.net</a></p>

              <!--
              <h2><?php echo __('Formulaire de contact') ?></h2>
              <form action="send.php" method="post">

                <p>
                  <label for="name"><?php echo __('Nom') ?></label>
                  <input type="text" name="name" id="name" size="10" class="champs_username required"/>

                  <label for="mail_"><?php echo __('Email') ?>&nbsp;</label>
                  <input type="text" name="mail" id="mail_" size="20" class="champs required"/></p>

                  <p><textarea rows="7" name="message" cols="50" class="champs required"></textarea></p>

                  <p><input type="submit" value="Envoyer" class="valid"/> </p>
                </form>
                <p id="required_legend">*   <?php echo __('Champs Obligatoires') ?> </p>
                -->

              </div><!-- end of .contact -->


            </div><!-- end of .footer_content -->
          </div><!-- end of footer -->

        </div><!-- end of container 12s -->

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.1.min.js"><\/script>')</script>

        <script>
<?php if ($sf_request->hasParameter('play')): ?>
          window.autoPlay = true;
<?php else: ?>
          window.autoPlay = false;
<?php endif; ?>
        </script>

        <!-- scripts concatenated and minified via ant build script-->
        <script src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/js/jQuery.jPlayer.2.1.0/jquery.jplayer.min.js?v=3"></script>
        <script src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/js/jQuery.jPlayer.2.1.0/add-on/jplayer.playlist.js?v=3"></script>
        <script src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/js/jquery.scrollTo-1.4.2-min.js?v=3"></script>
        <script src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/js/jquery.pjax.js?v=3"></script>
        <script src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/js/script.js?v=3"></script>
        <!-- end scripts-->

        <?php if (has_slot('home_script')): ?>
          <?php include_slot('home_script') ?>
        <?php endif; ?>

        <script>
  var _gaq=[['_setAccount','UA-673133-1'],['_trackPageview']]; // Change UA-XXXXX-X to be your site's ID
  (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];g.async=1;
    g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
    s.parentNode.insertBefore(g,s)}(document,'script'));
  </script>

  <!--[if lt IE 7 ]>
  <script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.2/CFInstall.min.js"></script>
  <script>window.attachEvent("onload",function(){CFInstall.check({mode:"overlay"})})</script>
  <![endif]-->

  <!-- Form submission is triggered by click on Paypal links -->
  <form action="https://www.paypal.com/cgi-bin/webscr" method="post" id="paypal" style="display:none;">
    <input type="hidden" name="cmd" value="_s-xclick" />
    <input type="hidden" id="paypal_id" name="hosted_button_id" value="RDMSQRU34X5YS" />
    <input type="image" src="https://www.paypalobjects.com/fr_FR/FR/i/btn/btn_donate_SM.gif" border="0" name="submit" alt="PayPal - la solution de paiement en ligne la plus simple et la plus sécurisée !" />
    <img border="0" src="https://www.paypalobjects.com/fr_FR/i/scr/pixel.gif" width="1" height="1">
  </form>

  <form name="_xclick" action="https://www.paypal.com/cgi-bin/webscr" method="post" style="display:none;" id="paypal-view-cart">
    <input type="hidden" name="cmd" value="_cart">
    <input type="hidden" name="business" value="support@daheardit-records.net">
    <input type="image" src="https://www.paypal.com/fr_XC/i/btn/view_cart_new.gif" border="0" name="submit" alt="Payez avec PayPal : une solution rapide, gratuite et sécurisée!">
    <input type="hidden" name="display" value="1">
  </form>

</html>
