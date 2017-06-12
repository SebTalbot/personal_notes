		</div>
		<footer>
			<?php
				$currentPage = basename($_SERVER['PHP_SELF']);
				if($currentPage !== "index.php") {
					?>
					<a href="index.php">Post-It</a>
					<?php
				}
				else {
					?>
						<a href="consulter.php">Consulter</a>
					<?php
				}
			?>
			<a href="suprimer.php">Suprimer</a>
		</footer>
    </body>
</html>