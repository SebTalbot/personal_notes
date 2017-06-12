<?php


class RSSDAO {
	
	public static function readRSS($url) {
		// http://rss.cbc.ca/lineup/topstories.xml
		$xml = new SimpleXMLElement($url, NULL, TRUE);
		
		$result = array();
		
		foreach ($xml->channel->item as $item) {
			$result[] = $item;
		}
		
		return $result;
	}
}