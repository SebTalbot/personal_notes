<?php
	session_start();

	function execute() {
		$hasError = false;

		if (!empty($_POST["champCourriel"])) {
			if ($_POST["champCourriel"] === "john@wick.com" &&
				$_POST["champMotDePasse"] === "a") {

				$_SESSION["email"] = $_POST["champCourriel"];
			
				header("location:prive.php");
				exit;
			}
			else {
				$hasError = true;
			}
		}

		return $hasError;
	}