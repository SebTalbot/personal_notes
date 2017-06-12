<?php
	session_start();
	function execute() {
		if(empty($_SESSION["email"])) {
			header("location:index.php");
			exit;
		}

		$list = array();

		$list[] = "Ethan Bradberry"; // Push
		$list[] = "Ethan Klein";
		$list[] = "Ethan Hunt";


		return $list;
	}