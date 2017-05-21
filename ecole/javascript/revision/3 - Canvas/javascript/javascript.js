var ctx = null;
var spriteList = [];
var chiasse = [];
var rightPushed = false;
var leftPushed = false;
var spacePushed = false;
var img = new Image();
img.src = 'images/ninja.png';
var img2 = new Image();
img2.src = 'images/star.png';

window.onload = function() {
    var canvas = document.getElementById("canvas");
    ctx = canvas.getContext("2d");

    spriteList.push(new Player("joueur"));
    tick();
}

function tick() {

    for(var i = 0; i < spriteList.length;i++){
        spriteList[i].tick();
    }
    for(var i = 0; i < chiasse.length;i++){
        var luigi = chiasse[i].tick();

        if(!luigi){
            chiasse.splice(i,1);
            i--;
        }

    }
    window.requestAnimationFrame(tick);
}
document.onkeydown = function (e) {
    if (e.which == 65) leftPushed = true;
    else if (e.which == 68) rightPushed = true;
    else if (e.which == 32) spacePushed = true;
}

document.onkeyup = function (e) {
    if (e.which == 65) leftPushed = false;
    else if (e.which == 68) rightPushed = false;
    else if (e.which == 32) spacePushed = false;
}
