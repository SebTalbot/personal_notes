		</div>
		<footer style="text-align: center">
			<?php
				$currentPage = basename($_SERVER['PHP_SELF']);
				if($currentPage !== "contact.php") {
					?>
					<a href="contact.php">Contactez-nous</a>
					<?php
				}
				else {
					?>
						<a href="index.php">Index</a>
					<?php
				}
			?>
		</footer>
    </body>
</html>