var ctx = null;

window.onload = function () {
	ctx = document.getElementById("canvas").getContext("2d");

	document.getElementById("canvas").onclick = function (e) {
		var x = e.pageX - this.offsetLeft; 
		var y = e.pageY - this.offsetTop; 

		afficherWindmill(x, y, 100, 50);
	}
}

function afficherWindmill(x, y , w, h) {
	x -= 25;
	y -= 25;
	ctx.fillStyle = "#f00"
	ctx.fillRect(x-50, y-50, 150, 150);

	ctx.fillStyle = "#FFF"
	ctx.arc(x+25, y+25, 50, 0, 2 * Math.PI, false);
	ctx.fill();

	ctx.fillStyle = "#000"; // Couleur
	ctx.fillRect(x+20, y, 10, 50);
	ctx.fillRect(x, y+20, 50, 10);
	ctx.fillRect(x, y, 10, 20);
	ctx.fillRect(x+30, y, 20, 10);
	ctx.fillRect(x, y+40, 20, 10);
	ctx.fillRect(x+40, y+30, 10, 20);
}

document.onkeyup = function (e) {
	// which trouve le ASCII du event
	if (e.which == 32) {
		ctx.clearRect(0, 0, 650, 650);
	}
}

