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

	// Media player
	if ($('.open_releases_playlist li a')) {
		// Build playlist
		var playlist = [];
		$('.open_releases_playlist li a').each(function() {
			playlist.push({
				mp3: $(this).attr('href'),
				title: $(this).text(),
			});
		});

		// Media player
		new jPlayerPlaylist(null, playlist, {
			solution: 'flash, html', 
			swfPath: dhrUriRoot + "/frontend/js/jQuery.jPlayer.2.1.0/"
		});
	}

	// Top menu
	$('#menu-main li a').click(function() {
		$.scrollTo($($(this).attr('href')), 1000);
		return false;
	});

	$('.infos_button_top a').click(function() {
		$.scrollTo($('#top'), 1000);
		return false;
	});

	// Carousels
	$('a.carousel-nav').click(function() {
		// Vimeo
		if ($(this).attr('href').match(/.*vimeo.*/)) {
			$('#carousel-iframe').remove();
			$('.calque_artists_pictures').hide();
			var iframe = $('<iframe id="carousel-iframe" src="http://player.vimeo.com/video/'+ $(this).attr('href').match(/.*\/(\d+)/)[1] +'" width="460" height="460" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>')
			$('#carousel-current').hide();
			iframe.insertAfter('#carousel-current');
		} else {
			// Images
			$('.calque_artists_pictures').show();
			$('#carousel-current').show();
			$('#carousel-iframe').hide();
			$('#carousel-current').attr('src', $(this).attr('href'));
		}

		// Navigation
		$('a.carousel-nav img').each(function() {
			$(this).attr('src', dhrUriRoot + '/frontend/pics/button/caroussel-release.png');
		});
		$(this).find('img').attr('src', dhrUriRoot + '/frontend/pics/button/caroussel-release-hover.png');
		return false;
	});

	// Track releases download count
	// @see https://developers.google.com/analytics/devguides/collection/gajs/eventTrackerGuide
	$('a.release-download').click(function() {
		_gaq.push(['_trackEvent', 'Releases', 'Archive Downloaded - ' + $(this).data('dhr-archive-format'), $(this).data('dhr-release-slug')]);
	});

	// Track releases streaming activity
	$("#jquery_jplayer_1").bind($.jPlayer.event.play, function(event) {
		trackInfos = event.jPlayer.status.src.match(/^.*\/(dhr\d+)_(\d+)\.mp3$/);
		_gaq.push(['_trackEvent', 'Releases', 'Track Played - ' + trackInfos[2], trackInfos[1]]);
	});

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
	*/
});
