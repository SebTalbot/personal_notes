<?php   
	require_once("action/IndexAction.php");
	require_once("action/DAO/ContentDAO.php");


    $action = new IndexAction();

    $action->execute();

	require_once("partial/header.php");
?>
<div id="page-index">
	<img src="images/water-drop.png" alt= ""/>
	
	<p>
		<?= ContentDAO::getContent(); ?>
	</p>

</div>
<?php
	require_once ("partial/footer.php");
?>