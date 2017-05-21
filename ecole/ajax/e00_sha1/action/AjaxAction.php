<?php
	require_once("action/CommonAction.php");

	class AjaxAction extends CommonAction{
		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC);
		}

		protected function executeAction() {
			if (!empty($_POST["field"])) {
				$this->result = sha1($_POST["field"]);
			}
			else {
				$this->result = "";
			}
		}
	}