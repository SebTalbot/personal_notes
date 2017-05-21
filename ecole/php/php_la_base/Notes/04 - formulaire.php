<?php
	$showBox = false;
	if (!empty($_GET["info"])) {
		$var = $_GET["info"];
		$showBox = true;
	}
?>
<!DOCTYPE html>
<html lang="fr">
	<head>
		<title>Les formulaires</title>
		<meta charset="utf-8" />
	</head>
	<body>
		<?php
			if ($showBox) {
				?>
				<font color="red"><?= strlen($var)?></font>
			<?php
			}
		?>
		<form action="04 - formulaire.php" method="get">
			<div>
				Info : <input type="text" name="info" />
			</div>
			<div>
				<input type="submit" value="Go!" />
			</div>
		</form>
	</body>
</html>