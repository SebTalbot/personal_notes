<!DOCTYPE html>
<html lang="fr">
    <head>
        <link href="css/global.css" rel="stylesheet" />
		<title>StarCVM coffees</title>
		<meta charset="utf-8" />
    </head>
    <body>
		<div class="header">
				<div class="site-title-section">
					<h2>StarCVM Coffees</h2>
				</div>
				<div class="username-section">
					Bonjour, <?= $action->getUsername() ?> !
					<?php
						if ($action->isLoggedIn()) {
							?>
							[<a href="?logout=true">Logout</a>]
							<?php		
						}
					?>
				</div>
				<div class="clear"></div>
				
				<div class="menu">
					<ul>
						<li><a href="index.php">Accueil du site</a></li>
						<?php
							if (!$action->isLoggedIn()) {
								?>
								<li><a href="login.php">Se connecter</a></li>
								<?php
							}
							else {
								?>
								<li><a href="home.php">Mon accueil perso</a></li>
								<li><a href="profile.php">Mon profil</a></li>
								<?php
							}
						?>
					</ul>
				</div>
			</div>
	
		<div class="container">
			
		