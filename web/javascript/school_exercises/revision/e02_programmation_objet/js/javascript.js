
var spriteList = [];
var eyeList = [];

window.onload = function(){

    spriteList.push(new Zombie("zombie1"));
    spriteList.push(new Zombie("zombie2"));
    tick();
}

document.onmousedown = function(e) {
    eyeList.push(new Eye(e.pageX-75, e.pageY-75));
}


function tick(){
    for(var i = 0; i < spriteList.length; i++){
        spriteList[i].tick();
    }
    for(var i = 0; i < eyeList.length; i++){
        var alive = eyeList[i].tick();

        if (!alive) {
            eyeList.splice(i,1);
            i--;
            console.log("dead")
        }
    }

    window.requestAnimationFrame(tick);
}
