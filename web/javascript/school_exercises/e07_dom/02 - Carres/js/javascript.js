var spriteList = [];

window.onload = function() {
    // var canvas = document.createElement("canvas");
    // canvas.setAttribute("width", "650");
    // canvas.setAttribute("height", "650");
    // canvas.setAttribute("id", "canvas");

    // ctx = canvas.getContext("2d");
    tick();
}

document.onmousemove = function(e) {
    spriteList.push(new Square(e.pageX, e.pageY))
}

function tick() {
    for (var i=0; i < spriteList.length; i++) {
        var alive = spriteList[i].tick();

        if (!alive) {
            spriteList.splice(i,1);
            i--;
        }
    }

    window.requestAnimationFrame(tick);
}

// document.body

class Square{
    constructor(x, y) {
        this.node = document.createElement("div");
        this.node.setAttribute("class", "square");
        this.node.style.top = y + "px";
        this.node.style.left = x + "px";

        document.body.appendChild(this.node);

        this.y = y;
        this.x = x;
        this.speed = 0;
        this.velocityY = -0.02;
        this.color = 255;
    }

    tick() {
        var alive = this.y > 0;

        this.color -= 1;
        this.speed += this.velocityY;
        this.y += this.speed;
        this.node.style.top = this.y + "px";
        this.node.style.backgroundColor = "rgba(" + this.color + "," + this.color + "," + this.color + ",1)";

        if(!alive) {
            document.body.removeChild(this.node);
        }

        return alive;
    }
}
