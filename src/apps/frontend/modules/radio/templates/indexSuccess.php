<!doctype html>
<html class="no-js" lang="fr" prefix="og: http://ogp.me/ns#">
<head>
  <meta charset="utf-8">
  <meta name="google-site-verification" content="GZLJrrM8tvBsh05BvBY8GHUsEFhojyg5inFZAfaHh-Y" />
  <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> -->

  <title>Bienvenue | Da ! Heard It Records</title>

  <meta name="viewport" content="width=device-width,initial-scale=1">

<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">

  <!-- 960 Grid system-->
  <link rel="stylesheet" type="text/css" media="all" href="/frontend/css/lib/960.gs/reset.css?v=20190326.1" />
  <link rel="stylesheet" type="text/css" media="all" href="/frontend/css/lib/960.gs/text.css?v=20190326.1" />
  <link rel="stylesheet" type="text/css" media="all" href="/frontend/css/lib/960.gs/fluid_grid.css?v=20190326.1" />

  <link rel="stylesheet" href="/frontend/css/main.css?v=1588796413">
  <link rel="stylesheet" href="/frontend/css/radio.css?v=1588796413">

</head>
<body>




      <div class="clear"></div><!-- end of clear -->

      <div class="grid_12 header_nav_3">
        <div class="header_nav_3_content">
          <ul id="menu-main" class="header_nav_3_content_list">
            <li class="header_nav_3_content_logo"><a href="<?php echo url_for('@homepage') ?>"> <img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/logo/logo-dhr.png" alt="logo" /></a></li>
            <li><a href="https://www.daheardit-records.net/fr/#discography"><?php echo __('Discographie') ?></a></li>
            <li><a href="https://www.daheardit-records.net/fr/#artists"><?php echo __('Artistes') ?></a></li>
            <li><a href="https://www.daheardit-records.net/fr/#artwork_artists"><?php echo __('Illustrations') ?></a></li>
            <li><a href="https://www.daheardit-records.net/fr/#informations"><?php echo __('Informations') ?></a></li>
     
            <li class="header_nav_3_button_donate donate_infos"><a href="https://www.helloasso.com/associations/constructions-incongrues" class="donate"><?php echo __('Dons') ?>
</li>
          </ul>

        </div><!-- end of header_nav_3_content -->

        <div class="category_content">

<h2 class=""></a> </h2>
<h2 class="">En écoute actuellement sur la radio : </h2>

<audio controls src="http://stream.p-node.org/daheardit"></audio>

<p>
    <?php include_component('content', 'show', array('block' => 'radio_onair')) ?>
</p>

<p>
    <?php include_component('content', 'show', array('block' => 'radio_presentation')) ?>
</p>

<h2 class="">Chat : </h2>

<p>Le streaming est géré par l'excellent radio <a href="https://p-node.org/">https://p-node.org/</a></p>
</div>
</div>
</span>
</body>