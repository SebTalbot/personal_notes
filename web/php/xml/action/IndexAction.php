<?php

require_once("action/CommonAction.php");
require_once("action/dao/RSSDAO.php");

class IndexAction extends CommonAction {
	private $rssResult;
	
	public function __construct() {
		parent::__construct($VISIBILITY_PUBLIC = 0);
	}
	
	public function executeAction() {
		if (isset($_GET["url"]) && strlen($_GET["url"]) > 0) {
			$this->rssResult = RSSDAO::readRSS($_GET["url"]);
		}
	}
	
	public function getRssResult() {
		return $this->rssResult;
	}
}
