var ctx = null;

window.onload = function () {
	ctx = document.getElementById("canvas").getContext("2d");

	afficherRectangle(20, 30, 200, 100);
}

function afficherRectangle(x, y , w, h) {
	ctx.fillStyle = "#00FFCC"; // Couleur
	ctx.fillRect(x, y, w, h);

	ctx.strokeStyle = "#000000";
	ctx.strokeRect(x, y, w, h);
}

document.onkeyup = function (e) {
	// which trouve le ASCII du event
	if (e.which == 32) {
		ctx.clearRect(0, 0, 650, 650);
	}
}
