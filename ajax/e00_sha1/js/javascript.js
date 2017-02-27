$(function () {
	$("#texte").keyup(function (e) {
		var txt = this.value // $("#texte").val()

		$.ajax({
			type : "POST",
			url : "ajax.php",
			data : {
				field : txt
			}
		})
		.done(function (response) {
			var result = JSON.parse(response);

			var node = "<div>" + result + "</div>";

			$("#result").append(node);
		})
	});
})