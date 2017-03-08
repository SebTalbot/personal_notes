<?php
	require_once("action/IndexAction.php");

	$action = new IndexAction();
	$action->execute();

	require_once("partial/header.php");
?>

<div style="text-align:center">
		
	<h1>
		Que cherchez-vous?
	</h1>

	<form action="index.php" method="get">
		<input type="text" name="search" value="<?= $action->previousValue ?>">
	</form>

</div>

<?php
	require_once("partial/footer.php");