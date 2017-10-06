<?php
	
	class AnswerDAO {

		public static function insertInTable($author, $description) {
			$connection = Connection::getConnection();

			$statement = $connection->prepare("INSERT INTO l05_answer (author, description) VALUES ( ?, ?)");
			$statement->bindParam(1, $author);
			$statement->bindParam(2, $description);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();
		}

		public static function getTable() {
			$connection = Connection::getConnection();

			$statement = $connection->prepare("SELECT * FROM l05_answer");
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			return $statement->fetchAll();
		}

		public static function deleteMessage($id) {
			$connection = Connection::getConnection();

			$statement = $connection->prepare("DELETE FROM l05_answer WHERE ID = ?");
			$statement->bindParam(1, $id);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();
		}
	}