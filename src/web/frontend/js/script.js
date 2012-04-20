$(document).ready(function () {
	$('#menu-main li a').click(function () {
		$.scrollTo($($(this).attr('href')), 1000);
		return false;
	});

	$('a[data-pjax]').pjax();
	$('#content_async').on('pjax:end', function () {
		$('#content_async').show();
		$.scrollTo($('#release'));	
	});

	$('a[data-close]').live('click', function () {
		$($(this).data('close')).hide();
		return false;
	})
});