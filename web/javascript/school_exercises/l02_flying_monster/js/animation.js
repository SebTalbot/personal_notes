var mousePosX= 0;
var mousePosY = 0;
var spriteList = [];

window.onload = function() {
	document.getElementById("main").onmousemove = function (event) {
		mousePosX = event.pageX;
		mousePosY = event.pageY;
		spriteList.push(new Monster("monster1"));
		console.log(mousePosX + "," + mousePosY);
	}
	tick();
}

function tick () {
		for(var i=0; i<spriteList.length; i++){
			spriteList[i].tick();
		}
		window.requestAnimationFrame(tick);
}

