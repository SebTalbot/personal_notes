function verifReponse() {
	var reponseUser = document.getElementById('reponse').innerHTML

	$.ajax({
		type: "POST",
		url: "ajax.php",
		data: {
			reponse : reponseUser
		}
	})

	.done( function(msg){
		// document.getElementByClass('sectionAnswer')[0].innerHTML = msg;
	})
}
