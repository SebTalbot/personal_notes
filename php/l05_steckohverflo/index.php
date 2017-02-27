<?php
	require_once("action/IndexAction.php");

    $action = new IndexAction();

    $action->execute();
?>
<!DOCTYPE html>
	<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Javascript | StackOhVurFlo</title>
		<link href="css/global.css" rel="stylesheet" />
	</head>
	<body>
		<header>
			StackOhVurFlo, là où on répond à toutes vos questions!
		</header>
		<div class="container">
			<div class="pub2"></div>
			<div class="question">
				<h1>Pourquoi mon code JavaScript ne fonctionne-t'il pas?</h1>
				<div class="question-text">
					<p>
						Je ne comprends pas... j'ai tout essayé et mon code JavaScript ne fonctionne simplement pas... j'ai joujours des erreurs... 
					</p>
<pre>
document.getElementById("elem").onclick = test(event);

function test(e) {
	this.style.display = "none";
}
</pre>
					<p>
						Est-ce que quelqu'un pourrait m'aider?
					</p>
					<p>
						par : Fédérik Tério
					</p>
				</div>
				<div class="cols">
					<div class="left">
						<h2>Réponses</h2>
						<?php 
							foreach ($action->table as $row) {
								?>
								<div class="answer" onclick="window.location.href='index.php?delete-id= <?= $row["ID"]?>'">
									<div class="text">
										<?= $row["DESCRIPTION"] ?>
									</div>
									<div class="author">
										<?= $row["AUTHOR"]?>
									</div>
								</div>
								<?php
							}

						?>

						<div class="answer">
							<strong>Vous avez la réponse? Aidez-le !</strong>
							<form action="index.php" method="post">
								<div class="text">
									<textarea required name="description" placeholder="Votre réponse"></textarea>
								</div>
								<div class="author">
									<input name="author" type="text" required placeholder="Votre nom">
								</div>
								<div class="send-btn">
									<input type="submit" value="Envoyer">
								</div>
							</form>
						</div>

					</div>
					<div class="right">
						<div class="pub"></div>
						<h3>Autres questions</h3>
						<ul>
							<li>
								<a href="javascript:void(0)">
									Est-ce que jQuery fonctionne avec PHP?
								</a>
							</li>
							<li>
								<a href="javascript:void(0)">
									Du PHP dans une JS ne fonctionne pas, pourquoi?
								</a>
							</li>
							<li>
								<a href="javascript:void(0)">
									Pourquoi mon petit frère ne comprend pas mes blagues?
								</a>
							</li>
							<li>
								<a href="javascript:void(0)">
									Je veux inventer une intelligence artificielle, mais je n'y arrive pas... aide s.v.p.!
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>