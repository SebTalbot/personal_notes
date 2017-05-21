<?php
	require_once("action/CommonAction.php");

	class AjaxAction extends CommonAction {
		public $result = "ERR_100";
	
		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC);			
		}
	
		protected function executeAction() {

			if (!empty($_POST["type"])) {
				if ($_POST["type"] === "fetch-emails") {
					
					if (!empty($_POST["username"]) && $_POST["username"] === "john" && $_POST["password"] == "AAAaaa111") {
						$this->result = rand(0, 100);
					}
					else {
						$this->result = "ERR_102";
					}
				}
			}
			else {
				$this->result = "ERR_101";
			}
		}
	}


	
	
	
	
	
	