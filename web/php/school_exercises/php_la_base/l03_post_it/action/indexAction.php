<?php
	session_start();

	function execute(){
		ajouter();
		if(!empty($_SESSION["list"])){
			foreach ($_SESSION["list"] as $liste) {
				?>
				<div class= "postit" style="position: absolute; left: <?=$liste[1]?>; top: <?=$liste[2]?>"><?= $liste[0] ?></div>
				<?php
			}
		}
	}

	function ajouter(){
		if(!empty($_POST["inString"])) {
			$listeTemp[] = $_POST["inString"];
			$listeTemp[] = $_POST["inX"];
			$listeTemp[] = $_POST["inY"];

			$_SESSION["list"][] = $listeTemp;
		}
	}