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
		<?php 
			if ($action->getRssResult() != null) {
				foreach ($action->getRssResult() as $item) {
					?>
					<div id="rss-box" onclick="window.location.href='<?= $item->link?>'">
						<div id="rss-title" ><?= $item->title ?></div>
						<div id="rss-content" >
							<?= $item->description ?>
						</div>
						<br/>
					</div>
					<?php 
				}
			}
		?>
	</div>

<?php
	include("partial/footer.php");