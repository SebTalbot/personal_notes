<html>
	<head>
		<title>
			Oups, désolé !
		</title>
		<meta charset="utf-8">
	</head>
	<body>
		<h1>
		<?php
			if ($_GET["code"] == 403) {
				?>
				Accès refusé
				<?php
			}
			else if ($_GET["code"] == 404) {
				?>
				Oh my god they found me... <br/>I don't know how but they found me... <br/>run for it Marty !
				<?php
			}
			else if ($_GET["code"] == 500) {
				?>
				Aye, erreur interne
				<?php
			}
		?>
		</h1>
	</body>
</html>

