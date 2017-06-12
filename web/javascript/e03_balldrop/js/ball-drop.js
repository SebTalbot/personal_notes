var spriteList = [];

window.onload = function () {
    spriteList.push(new Ball("ball_1"));
    spriteList.push(new Ball("ball_2"));
    tick();
}

function tick () {
    for (var i = 0; i < spriteList.length; i++) {
        spriteList[i].tick();
    }
    window.requestAnimationFrame(tick);
}
