<?php
	require_once("action/DAO/AnswerDAO.php");   
	require_once("action/CommonAction.php");

	class IndexAction extends CommonAction {
		
		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC);
		}

		protected function executeAction() {
			$this->table = AnswerDAO::getTable();

			if (!empty($_GET["delete-id"])) {
				AnswerDAO::deleteMessage($_GET["delete-id"]);
				header("location:index.php");
				exit();
			}

			if (!empty($_POST["author"])) {
				AnswerDAO::insertInTable($_POST["author"], $_POST["description"]);
				header("location:index.php");
				exit();
			}
		}
	}	
