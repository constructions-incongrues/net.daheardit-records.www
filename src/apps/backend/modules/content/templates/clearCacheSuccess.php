<div class="container-fluid">
	<h1>Invalidation du cache</h1>

	<form action="" method="post">
		<input type="submit" value="Invalider" />
	</form>

<?php if (count($results)): ?>
<p>
	<pre><?php echo implode("\n", $sf_data->getRaw('results')) ?></pre>
</p>
<?php endif; ?>
</div>