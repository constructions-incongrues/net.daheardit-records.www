<?php foreach ($release['tracks'] as $track): ?>
<?php if ($track['number'] < 10): ?>
  <?php $zero = '0'; ?>
<?php else: ?>
  <?php $zero = ''; ?>
<?php endif; ?>
<item>
    <!-- media:content is used as the clip URL -->
    <media:content url="http://www.daheardit-records.net/assets/releases/<?php echo $release['slug'] ?>/tracks/<?php echo str_replace('-', '', $release['slug']) ?>_<?php echo $zero ?><?php echo $track['number'] ?>.mp3" type="audio/mpeg" />

    <link><?php echo url_for('@release_show?slug='.$release['slug'], true) ?></link>

    <!-- media:thumbnail is used to set a splash image into the playlist. -->
    <media:thumbnail url="<?php echo sprintf($sf_request->getRelativeUrlRoot().'/assets/releases/%s/images/%s_1.png', $release['slug'], $release['slug']) ?>" />

    <!-- you can set flowplayer specific properties for the thumbnail using a fp:thumbnail element -->
    <fp:thumbnail scaling="orig" />

    <fp:clip autoPlay="true" captionUrl="<?php echo url_for('@release_track_show?sf_format=srt&slug='.$release['slug'].'&number='.$track['number']) ?>" />
</item>
<?php endforeach ?>
