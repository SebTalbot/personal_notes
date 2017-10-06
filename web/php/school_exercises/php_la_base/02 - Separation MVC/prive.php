<?php
	require_once("action/priveAction.php");
	$ethanList = execute();

	require_once("partial/header.php");
?>
<h1>Liste des Ethan</h1>
<ul style="margin-left: 30px">
	<?php
		foreach ($ethanList as $ethan) {
			?>
			<li><?= $ethan ?></li>
			<?php
		}
	?>
</ul>
<a href="logout.php">Deconnexion</a>
<?php
	require_once("partial/footer.php");
?>