<!DOCTYPE html>
<html lang="fr">
	<head>
		<title>Boucles</title>
		<meta charset="utf-8" />
	</head>
	<body>
		<h1>Champs radio</h1>
		<?php 
			for ($i=0; $i<100; $i++) {
				?>
				<div>
					<input name="age" type="radio" value="<?= $i ?>"> <?= $i ?>
				</div>
			<?php
			}
		?>
	</body>
</html>
