<style type="text/css">
.header {
	background-image:url("<?php echo $urlHeader ?>");
}
</style>
<link rel="stylesheet" type="text/css" media="all" href="<?php echo $sf_request->getRelativeUrlRoot() ?>/assets/releases/<?php echo $release->slug ?>/<?php echo $release->slug ?>.css" />

<h1><a href="<?php echo url_for('@artist_show?slug='.$release->Artist->slug.'#artist') ?>"><?php echo $release->Artist->name ?></a></h1>
<h2><a href="<?php echo url_for('@release_show?slug='.$release->slug.'#release') ?>"><?php echo $release->title ?></a></h2>