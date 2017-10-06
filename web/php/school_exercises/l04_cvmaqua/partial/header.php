<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>CVMAQUA</title>
        <link href="css/global.css" rel="stylesheet" type="text/css" media="screen" />   
        <link href="css/jquery.lightbox-0.5.css" rel="stylesheet" type="text/css" media="screen" />     
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/jquery.lightbox-0.5.min.js"></script>
    </head>
    <body>
		<div class="site-container">
		    <div class="page-container">
		    	<div class="site-header">
		    		<div class="page-title-section">
			    		<h1>CVMAQUA - Groupe de protection de l'eau</h1>
			    		<h2><?= $action->getPageName() ?></h2>
		    		</div>
		    		<div class="menu-section">
		    			<ul>
		    				<li><a href="index.php">Accueil</a></li>
		    				<li><a href="images.php">Galerie photos</a></li>
		    				<li><a href="contact.php">Contactez-nous</a></li>
		    				<?php
		    				if (!$action->isLoggedIn()) {
								?>
								<li><a href="login.php">Login</a></li>
								<?php
							}
							else {
								?>
								<li><a href="adminIndex.php">Admin</a></li>
								<li><a href="?logout=true">Logout</a></li>
								<?php
							}
							?>
		    			</ul>
		    		</div>
		    		<div class="clear"></div>
		    	</div>
		    	<div class="page-content">