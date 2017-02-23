
$(document).ready(function () {
	setTimeout(function () {
		$("#you-circle").fadeIn('slow', function () {
			$("#you-arrow").fadeIn('slow', function () {
				$("#you-text").fadeIn(6000);
			});
		});
	}, 2000);
});