$(document).ready(function () {
	$('#menu-main li a').click(function () {
		$.scrollTo($($(this).attr('href')), 1000);
		return false;
	});
});