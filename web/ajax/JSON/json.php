<?php
	// $variable =  json_decode($jsonVariable);
	$amiDeJohnW = json_encode(array("Dog", "Russe", "Unknown", "Marcus"));
?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>JSON</title>
	</head>
	<body>
		
		<script>
			// JSON.parse(); // decode
			// JSON.stringify(); // encode
			var monTableau = '<?= $amiDeJohnW ?>';
			monTableau = JSON.parse(monTableau);
		</script>
	</body>
</html>