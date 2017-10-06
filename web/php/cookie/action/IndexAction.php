<?php
	require_once("action/CommonAction.php");

	class IndexAction extends CommonAction{
		public $previousValue;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC);
		}

		protected function executeAction() {
			if (!empty($_GET["search"])) {
				setcookie("previous", $_GET["search"], time() + 3600);
			}

			$this->previousValue = "";

			if (!empty($_COOKIE["previous"])) {
				$this->previousValue = $_COOKIE["previous"];
			}
		}
	}