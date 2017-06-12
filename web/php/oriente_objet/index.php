<?php
	class User {
		private $firstName;
		private $lastName;
		public static $count = 0;

		public function __construct($firstName, $lastName) {
			$this->firstName = $firstName;
			$this->lastName = $lastName;
			User::$count++;
		}

		public function getName() {
			return $this->firstName . " " . $this->lastName;
		}
	}

	class Student extends User {
		private $matricule;

		public function __construct($firstName, $lastName, $matricule) {
			parent::__construct($firstName, $lastName);
			$this->matricule = $matricule;
		}

		public function getName() {
			return parent::getName() . " " . $this->matricule;
		}

	}

	$user = new User("John", "Wick");

	echo $user->getName();
	
	$user = new Student("John", "Wick2", "243234");

	echo $user->getName();

	echo "count : " . User::$count;