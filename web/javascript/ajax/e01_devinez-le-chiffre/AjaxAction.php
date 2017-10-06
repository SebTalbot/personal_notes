<?php
	require_once("action/CommonAction.php");

	class AjaxAction extends CommonAction {
		public $result = "ERR_100";
	
		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC);
			
		}
	
		protected function executeAction() {
			if(!empty($_POST["reponse"])) {
				$this->result = rand(0,100);

			}
		}
	}
