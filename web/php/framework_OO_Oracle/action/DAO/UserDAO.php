<?php
	
	class UserDAO {

		public static function authenticate($username, $password) {
			$visibility = CommonAction::$VISIBILITY_PUBLIC;
			$connection = Connection::getConnection();

			$statement = $connection->prepare("SELECT * FROM USERS WHERE USERNAME = ?");
			$statement->bindParam(1, $username);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			if ($row = $statement->fetch()) {
				if (password_verify($password, $row["PASSWORD"])) {
					$visibility = $row["VISIBILITY"];
				}
			}

			return $visibility;
		}

		public function updateProfile() {
			$connection = Connection::getConnection();
			// ...
			// ...
		}

	}