<?php
	require_once("action/indexAction.php"); // Controleur

	$showError = execute();

	// Header
	require_once("partial/header.php");
?>

			<h1>
				Authentification nécessaire
			</h1>
			<?php
				if ($showError) {
					?>
					<div style="margin-bottom:15px;color:red;text-align:center;">
						Authentification erronee
					</div>
				<?php
				}
			?>
			<form action="index.php" method="post">
				<div class="formLabel"><label for="courriel"> Courriel : </label></div>
				<div class="formInput"><input type="text" name="champCourriel" /></div>
				<div class="formSeparator"></div>
				
				<div class="formLabel"><label for="pwd"> Mot de passe : </label> </div>
				<div class="formInput"><input type="password" name="champMotDePasse" /></div>
				<div class="formSeparator"></div>
				
				<div class="formLabel">&nbsp;</div>
				<div class="formInput"><input type="image" src="images/submit.png" /></div>
				<div class="formSeparator"></div>
			</form>
<?php
	// Footer
	require_once("partial/footer.php");
?>