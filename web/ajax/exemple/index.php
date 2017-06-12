<?php
	require_once("action/IndexAction.php");

	$action = new IndexAction();
	$action->execute();
?>
<!DOCTYPE html>
<html>
	<head>
			<title>Mon engin de courriels</title>
			<meta charset="utf-8">
			<link rel="stylesheet" href="css/global.css">
			<script src="js/jquery.min.js"></script>
			<script>
				var posX = null;

				function checkEmails() {
					var user = "john";

					$.ajax({
						type : "POST",
						url : "ajax.php",
						data : {
							type : "fetch-emails", // $_POST["type"]
							username : user,		// $_POST["username"]
							password : "AAAaaa111" // $_POST["password"]
						}
					})
					.done(function (data) { // quand le résultat arrive, exécute cette fonction
						//document.getElementById("contenantCourriels").innerHTML = data;
						$("#contenantCourriels").html(data)
						var html = $("#contenantCourriels").html()
						console.log(html)
					})
					.fail(function (data) { // lorsque erreur côté serveur, 404, 500, ...
						alert("Whaaa?")
					})
					.always(function (data) { // Dans tous les cas

					})
				}		

			</script>
	</head>
	<body>
		<div class="container">
			<h1>Mes courriels</h1>
	
			<p>Vous avez actuellement</p>
			<div id="contenantCourriels">--</div> 
			<p>nouveaux courriels.</p>

			<div class="refresh-section">
				<button onclick="checkEmails()">
					<img src="images/refresh.png" alt="Rafraîchir">
				</button>
			</div>
		</div>
	</body>
</html>
