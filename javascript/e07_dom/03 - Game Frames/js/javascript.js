var gameState = 1;

window.onload = function () {
    document.getElementById("frame-" + gameState).style.display = "block";
}

document.onkeyup = function (e) {
    if ( e.which == 13) {
        document.getElementById("frame-" + gameState).style.display = "none";
        gameState++;

        if (gameState == 4) {
            gameState =1;
        }
        document.getElementById("frame-" + gameState).style.display = "block";
    }
}
