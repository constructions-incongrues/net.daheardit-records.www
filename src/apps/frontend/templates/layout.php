<!doctype html>
<html class="no-js" lang="<?php echo $sf_request->getParameter('sf_culture', 'fr') ?>" prefix="og: http://ogp.me/ns#">
<head>
  <meta charset="utf-8">
  <meta name="google-site-verification" content="GZLJrrM8tvBsh05BvBY8GHUsEFhojyg5inFZAfaHh-Y" />
  <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> -->

  <title><?php echo html_entity_decode(html_entity_decode($sf_response->getTitle(), ENT_QUOTES), ENT_QUOTES) ?> | Da ! Heard It Records</title>

  <meta name="viewport" content="width=device-width,initial-scale=1">

<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">

  <!-- 960 Grid system-->
  <link rel="stylesheet" type="text/css" media="all" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/css/lib/960.gs/reset.css?v=<?php echo sfConfig::get('app_version') ? sfConfig::get('app_version') : date('U') ?>" />
  <link rel="stylesheet" type="text/css" media="all" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/css/lib/960.gs/text.css?v=<?php echo sfConfig::get('app_version') ? sfConfig::get('app_version') : date('U') ?>" />
  <link rel="stylesheet" type="text/css" media="all" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/css/lib/960.gs/fluid_grid.css?v=<?php echo sfConfig::get('app_version') ? sfConfig::get('app_version') : date('U') ?>" />

  <link rel="stylesheet" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/css/main.css?v=<?php echo date('U') ?>">

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
  <meta property="<?php echo $name ?>" content="<?php echo strip_tags(html_entity_decode(html_entity_decode(html_entity_decode($value, ENT_QUOTES), ENT_QUOTES), ENT_QUOTES)) ?>" />
<?php endforeach ?>

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
          <h1 id="discography"><?php echo __('Releases') ?></h1>
            <span class="triangle"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/others/triangle-bord.png" class="triangle" /></span>
        </div><!-- end of category contents -->
      </div><!-- end of releases -->

      <div class="clear"></div>

<?php include_component('release', 'list') ?>

      <div class="grid_12 artists">
        <div class="category_content">
                    <span class="artist_button_top"><a href="#top"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/top_black.png" alt="TOP"></a></span>

          <h1 id="artists"><?php echo __('Artists') ?></h1>
    <span class="triangle"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/others/triangle-bord-blanc.png" class="triangle" /></span>

        </div><!-- end of artists_content -->
      </div><!-- end of artists -->

<?php include_component('artist', 'list') ?>

      <div class="grid_12 artwork_artists_listing_all">
        <div class="category_content">
          <h1 id="artwork_artists"><?php echo __('Illustrators') ?></h1>
            <span class="triangle"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/others/triangle-bord.png" class="triangle" /></span>
                 <span class="graphists_button_top"><a href="#top"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/top.png" alt="TOP"></a></span>

        </div><!-- end of category contents -->
      </div><!-- end of artwork_artists -->


<?php include_component('artwork_artist', 'list') ?>


      <div class="grid_12 category_infos">
         <div class="category_content">
          <h1 id="videos"><?php echo __('Documentary') ?></h1>
          <span class="triangle"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/others/triangle-bord-blanc.png" class="triangle" /></span>

          <span class="infos_button_top"><a href="#top"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/top_black.png" alt="TOP"></a></span>
        </div><!-- end of category_contents -->
      </div><!-- end of category -->

      <div class="grid_12 infos">

        <div class="infos_content">
          <iframe width="960" height="540" src="https://www.youtube.com/embed/e8UoUJha3zw?list=PLgpmTifGJBPQGp_JLT572YE7wV1gWTEpN" frameborder="0" allowfullscreen></iframe>
          </div><!-- end of .infos-->
      </div><!-- end of .infos content -->


      <div class="grid_12 footer">

        <div class="category_content">
          <span class="footer_button_top"><a href="#top"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/button/top_black.png" alt="TOP"></a></span>
        </div><!-- end of category_contents -->

        <div class="footer_content">



          <div id="informations" class="grid_5 infos_descr">

          <!-- Begin MailChimp Signup Form -->
        <!-- <div id="mc_embed_signup" name="#newsletter">
          <form action="//daheardit-records.us15.list-manage.com/subscribe/post?u=a260251d9efb71cb8f1bffff4&amp;id=e77908b281" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
            <div id="mc_embed_signup_scroll">
              <h1 name="newsletter"><?php echo __("S'inscrire à la liste d'informations") ?></h1>
              <div class="mc-field-group">
                <input type="email" value="" name="EMAIL" placeholder="Email" class="required email" id="mce-EMAIL">
                <input type="submit" value="OK" name="subscribe" id="mc-embedded-subscribe" class="button">
              </div>
            </div><!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
          </form>
        </div> 


            <p>

            <?php include_component('content', 'show', array('block' => 'informations')) ?>
            <?php include_component('content', 'show', array('block' => 'links1')) ?>
            </p>
            <!-- <p>            <?php include_component('content', 'show', array('block' => 'greetings')) ?>
</p> -->

            </p>
  

           
           

            <p>
           <a href="mailto:johan@daheardit-records.net">johan@daheardit-records.net</a> <br />

            <a href="http://www.thibaulthuertas.com/">Design by Thibault Huertas </a>  <br />
              <a href="http://www.constructions-incongrues.net">Code by Constructions Incongrues</a> <br />
            <a href="http://www.pastis-hosting.net">Hosting by Pastis Hosting </a> 
            </p>
            

<p class="donation"><a href="https://www.helloasso.com/associations/constructions-incongrues" >we releases our music for free, since 2006, if you  want you can support us here <3 </a></p>

<div class="documentaryembed">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/e8UoUJha3zw?controls=0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
              <div class="grid_12 footer_links_1">

    

          </div><!-- end of links -->
          </div><!-- end of .infos_descr -->


         <div class="grid_1"><br /></div>

          <div class="grid_6 footer_contact">
            <h1 id="contact"><?php echo __('') ?></h1>
            <!-- <ul class="footer_nav_1">
<?php include_partial('main/social') ?>
            </ul> -->

            <!-- <h2><?php echo __('Contact') ?></h2> -->

            <!-- <p>
            </p>

            <h2><?php echo __('Crédits') ?></h2>

             -->
         

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
        <script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.1.min.js?v=<?php echo sfConfig::get('app_version') ? sfConfig::get('app_version') : date('U') ?>"><\/script>')</script>

        <script>
<?php if ($sf_request->hasParameter('play')): ?>
          window.autoPlay = true;
<?php else: ?>
          window.autoPlay = false;
<?php endif; ?>
        </script>

        <!-- scripts concatenated and minified via ant build script-->
        <script src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/js/jQuery.jPlayer.2.1.0/jquery.jplayer.min.js?v=<?php echo sfConfig::get('app_version') ? sfConfig::get('app_version') : date('U') ?>"></script>
        <script src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/js/jQuery.jPlayer.2.1.0/add-on/jplayer.playlist.js?v=<?php echo sfConfig::get('app_version') ? sfConfig::get('app_version') : date('U') ?>"></script>
        <script src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/js/script.js?v=<?php echo sfConfig::get('app_version') ? sfConfig::get('app_version') : date('U') ?>"></script>
        <!-- end scripts-->

  <?php include_slot('morescript') ?>

        <script>
  var _gaq=[['_setAccount','UA-673133-1'],['_trackPageview']]; // Change UA-XXXXX-X to be your site's ID
  (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];g.async=1;
    g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
    s.parentNode.insertBefore(g,s)}(document,'script'));
  </script>

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
