<?php
	require_once("action/indexAction.php");
	$input = execute();

	require_once("partial/header.php");

	if(empty($input)) {
			?>
			<form action="index.php" method="get">
			Chaine à convertir en morse:<br>
			<textarea name="inputAscii" rows="10" cols="80" ></textarea><br>

		  	Chaine à convertir en ASCII:<br>
		  	<textarea name="inputMorse" rows="10" cols="80" ></textarea><br>

		  	<input type="submit" value="Convertir">
			</form>
			<?php
	}
	else {
		?>
		<div><?= $input ?></div>
		<a href="index.php">Reessayer</a>
		<?php
	}
	require_once("partial/footer.php");
?>