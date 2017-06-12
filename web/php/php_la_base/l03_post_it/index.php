<?php
	require_once("action/indexAction.php");
	execute();

	require_once("partial/header.php");
?>
<form action="index.php" method="post">
<div>
	Qu'avez-vous en tete : <input type="text" name="inString" />
	x: <input type="text" name="inX" value=<?='"'.rand(100,600).'"'?> />
	y: <input type="text" name="inY" value=<?='"'.rand(100,600).'"'?>/>
	<input type="submit" value="Ajouter"/>
</div>
</form>
<?php
	require_once("partial/footer.php");
?>