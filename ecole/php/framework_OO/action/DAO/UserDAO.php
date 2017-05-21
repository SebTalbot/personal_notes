<?php
	
	class UserDAO {

		public static function authenticate($username, $password) {
			$visibility = CommonAction::$VISIBILITY_PUBLIC;

			if ($username === "john" && $password === "wick") {
				$visibility = CommonAction::$VISIBILITY_MEMBER;
			}

			return $visibility;
		}

	}