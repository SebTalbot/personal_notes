<?php
	require_once("action/consulterAction.php");
	execute();
	
	require_once("partial/header.php");
?>
<h1>Les memos</h1>
<ul>
<?php
	if(!empty($_SESSION["list"])) {
		foreach ($_SESSION["list"] as $liste){
			?>
			<li><?=$liste[0]?></li>
			<?php
		}
	}
	else {
		header("location:index.php");
		exit();
	}
?>
</ul>
<?php
	require_once("partial/footer.php");
?>