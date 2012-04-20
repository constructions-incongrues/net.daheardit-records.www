<!DOCTYPE html>
<html lang="<?php echo $sf_user->getCulture() ?>">
  <head>
    <?php include_title() ?>
    <?php include_http_metas() ?>
    <?php include_metas() ?>

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <script src="<?php echo $sf_request->getRelativeUrlRoot() ?>/backend/aloha/src/lib/aloha.js" data-aloha-plugins="common/format,common/link,common/list"></script>
    <script>
Aloha.ready( function() {
  $('textarea').css('width', '70%');
  $('textarea').attr('rows', 15);
  Aloha.jQuery('textarea').aloha();
});
    </script>

    <!-- Le styles -->
    <?php include_stylesheets() ?>
    <?php include_javascripts() ?>

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="/favicon.ico" />
    <link rel="stylesheet" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/backend/aloha/src/css/aloha.css" type="text/css">
  </head>
  <body>
    <?php include_component('sfTwitterBootstrap', 'header'); ?>

    <div class="container-fluid">
      <?php echo $sf_content ?>
    </div>
    
    <script>$(function () { prettyPrint() })</script>

  </body>
</html>
