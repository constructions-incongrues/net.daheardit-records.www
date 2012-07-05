$(document).ready(function () {
	// Paypal add to cart links
	$('a.paypal').click(function() {
		$('#paypal_id').val($(this).data('paypalid'));
		$('form#paypal').submit();
		return false;
	});

	// Paypal view cart
	$('a.paypal-cart').click(function() {
		$('form#paypal-view-cart').submit();
		return false;
	});

	// Build playlist
	var playlist = [];
	$('.open_releases_playlist li a').each(function() {
		playlist.push({
			mp3: $(this).attr('href'),
			title: $(this).text(),
			free: true
		});
	});


	new jPlayerPlaylist({solution: 'flash, html', swfPath: dhrUriRoot + "/frontend/js/jQuery.jPlayer.2.1.0/"}, playlist);


	/*
	// Handles animation of content area
	$('#content_async').on('pjax:end', function () {
		$('#content_async').slideDown('slow', function () {
			$.scrollTo($('#release'));
		});
	});

	// Handles closing of content area
	$('a.close').live('click', function () {
		console.log($(this).data('close'));
		$($(this).data('close')).slideUp('slow');
		return false;
	});

	// Handles clicks on releases titles and images
	$('.releases_discography h1 a, .releases_discography h2 a, .releases_discography p a').click(function() {
		$('#content_async').hide();
		var link = $(this);
		$.scrollTo($('#discography'), 1000, {onAfter:function() {
			$.pjax({
				url: link.attr('href'),
				container: link.data('pjax')
			});
		}});

		return false;
	});

	// Handles navigation between releases
	$('a.previous, a.next').live('click', function() {
		$.pjax({
			url: $(this).attr('href'),
			container: $(this).data('pjax')
		});	

		return false;
	});

	$('.infos_button_top a').click(function() {
		$.scrollTo($('#top'), 1000);
		return false;
	});
	*/
});
