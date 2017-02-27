<?php
	$showBox = false;
	$var = "";
	if (!empty($_GET["searchBox"])) {
		$var = $_GET["searchBox"];
		$showBox = true;
	}
?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>String stats</title>
        <meta charset="utf-8" />
		<link href="css/global.css" rel="stylesheet" />
	</head>
	<body>
		<div>
			<div id="analyze-icon">
			</div>
			<div id="analyze-result">
				Entrez une chaîne de caractères et appuyez sur analyser <?php
				if ($showBox) {
					?>
					<div>
						Input: <font color="blue"><?= $var?></font>
						Longueur: <font color="red"><?= strlen($var)?></font>
					</div>
				<?php
				}
			?>
			</div>
			<div id="search-line">
				<form action="index.php" method="get">
					<div>
						<input type="text" value="<?= $var ?>" name="searchBox" placeholder="Texte à analyser" />
					</div>
					<div class="btn">
						<input type="submit" value="Analyser"/>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>