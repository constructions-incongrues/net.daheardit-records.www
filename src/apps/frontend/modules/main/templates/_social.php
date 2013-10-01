<?php if (sfConfig::get('app_feeds_use_feedburner', false)): ?>
    <li><a href="http://feeds.feedburner.com/dhr-news-<?php echo $sf_request->getParameter('sf_culture', 'fr') ?>"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/img-rss.png" /></a></li>
<?php else: ?>
    <li><a href="<?php echo url_for('@feeds_posts?sf_culture='.$sf_request->getParameter('sf_culture', 'fr')) ?>"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/img-rss.png" /></a></li>
<?php endif; ?>
	<!-- <li><a href="http://grooveshark.com/#!/user/Da+Heard+It+Records/18463163"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/grooveshark.png" alt="Grooveshark"/></a></li> -->
	<li><a href="https://www.facebook.com/dahearditrecords"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/img-facebook.png" alt="Facebook"/></a></li>
	<li><a href="http://twitter.com/#!/daheardit"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/img-twitter.png" alt="Twitter"/></a></li>
	<li><a href="http://freemusicarchive.org/label/Da__Heard_It_Records/"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/fma.png" alt="Free Music Archives"/></a></li>
	<!-- <li><a href="http://www.last.fm/label/Da%2520!%2520Heard%2520It%2520Records?ac=da%20heard%20it%20records"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/img-lastfm.png" alt="Last Fm"/></a></li>
	<li><a href="http://soundcloud.com/daheardit-records"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/soundcloud.png" /></a></li>
	<li><a href="http://www.youtube.com/dahearditrecords"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/youtube.png" /></a></li>
 	<li><a href="http://vimeo.com/dahearditrecords"><img src="<?php echo $sf_request->getRelativeUrlRoot() ?>/frontend/pics/icon/img-vimeo.png" alt="Vimeo"/></a></li>
-->