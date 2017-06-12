<?php
	require_once("utils/morse-utils.php");

	function execute() {
		$input = "";
		if (!empty($_GET["inputAscii"])) {
			$input = encodeMorse($_GET["inputAscii"]);
		}
		else if (!empty($_GET["inputMorse"])){
			$input = decodeMorse($_GET["inputMorse"]);
		}
	return $input;
	}