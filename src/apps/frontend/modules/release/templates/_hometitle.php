<style type="text/css">
<?php if (!is_null($urlHeader)): ?>
.header {
	background-image:url("<?php echo $urlHeader ?>");
}
<?php endif ?>
</style>
<?php if (!is_null($urlStylesheet)): ?>
<link rel="stylesheet" type="text/css" media="all" href="<?php echo $urlStylesheet ?>" />
<?php endif ?>
<link rel="stylesheet" type="text/css" media="all" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/assets/releases/<?php echo $release->slug ?>/<?php echo $release->slug ?>.css" />

<?php slot('home_script') ?>
<?php if (!is_null($urlScript)): ?>
<script src="<?php echo $urlScript ?>"></script>
<?php endif ?>
<?php end_slot() ?>

<h1><a href="<?php echo url_for('@artist_show?slug='.$release->Artist->slug.'#artist') ?>"><?php echo $release->Artist->name ?></a></h1>
<h2><a href="<?php echo url_for('@release_show?slug='.$release->slug.'#release') ?>"><?php echo $release->title ?></a></h2>
