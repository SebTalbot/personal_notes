<?php
	class ContentDAO {

		public static function setContent($content) {
			$content = str_replace(array("\n", "\r"), '<br/>', $content);
			file_put_contents("index.txt", $content);
		}

		public static function getContent() {
			return file_get_contents("index.txt");

		}

	}