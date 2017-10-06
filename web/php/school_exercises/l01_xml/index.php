<?php
	require_once("action/IndexAction.php");

	$action = new IndexAction();
	$action->execute();

	require_once("partial/header.php");
?>

	<div class="logo"></div>
	
	<div class="searchStart">
		<form action="index.php" method="get">
			<input type="text" style="width:200px" name="url" /> <input type="submit" value="Lire" />
		</form>
	</div>
	<div>
		<!-- Results here -->
	</div>

<?php
	include("partial/footer.php");