<?php
	function hasher($mot, $mot2 = null) {
		$hash = $mot;

		if(!empty($mot2)) {
			$hash .= $mot2;
		}

		return $hash;
	}
?>
<!DOCTYPE html>
<html lang="fr">
	<head>
		<title>Les fonctions</title>
		<meta charset="utf-8" />
	</head>
	<body>
		<h1>Création d'un hash</h1>
		<div>
			<?= hasher("allo")?>
		</div>
		<div>
			<?= hasher("allo", "toi")?>
		</div>
	</body>
</html>







