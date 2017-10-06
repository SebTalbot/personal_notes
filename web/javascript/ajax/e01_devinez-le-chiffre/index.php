<?php 
	require_once("action/IndexAction.php");

	$action = new IndexAction();
	$action->execute();	
?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>Riddles riddles</title>
        <link href="css/global.css" rel="stylesheet" />
        <script src="js/jquery.min.js"></script>
        <script src="js/javascript.js"></script>
        <meta charset="utf-8"/>
    </head>
    <body>
		<div class="sectionQuestion">Devinez à quel chiffre je pense?</div>
		<div class="sectionAnswer">
			<label for="texte"> Réponse : </label>
			<input type="text" id="reponse" />
			<button id="btn-valider" onclick="verifReponse()">Valider</button>
		</div>
    </body>
</html>
