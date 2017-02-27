<?php   
	require_once("action/AdminIndexAction.php");

    $action = new AdminIndexAction();

    $action->execute();

	require_once("partial/header.php");
?>
<div id="page-index">
	<form action="adminIndex.php" method="post">
		Modifier page index:<br>
		<textarea name="input" id="inputAdminIndex"rows="10" cols="80" value="test"></textarea><br>
		<script type="text/javascript">
			document.getElementById("inputAdminIndex").defaultValue = <?= '"'.ContentDAO::getContent().'"'?>;
		</script>

	  	<input type="submit" value="Enregistrer">
	</form>
</div>
<?php
	require_once ("partial/footer.php");
?>