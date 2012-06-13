$(document).ready(function () {
	
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
