$(document).ready(function () {
	$('#menu-main li a').click(function () {
		console.log($($(this).attr('href')));
		$.scrollTo($($(this).attr('href')), {duration: 500});
		return false;
	});
});