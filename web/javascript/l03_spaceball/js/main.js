var ctx = null;
var spriteList = [];
var img = new Image();
var rightPushed = false;
var leftPushed = false;
var spacePushed = false;

window.onload = function () {
    ctx = document.getElementById("canvas").getContext("2d");

    img.src = "images/landscape.jpg";
        if (img.complete) {
            ctx.drawImage(img,0,0);
        }

    spriteList.push(new Player());
    spriteList.push(new Platform(1,5,2));
    spriteList.push(new Platform(4,5,1));
    spriteList.push(new Platform(7,5,2));
    spriteList.push(new Platform(10,5,1));

    tick();
}

document.onkeydown = function (e) {
    if (e.which == 65) leftPushed = true;
    else if (e.which == 68) rightPushed = true;
    else if (e.which == 32) spacePushed = true;
}

document.onkeyup = function (e) {
    if (e.which == 65)       leftPushed = false;
    else if (e.which == 68) rightPushed = false;
    else if (e.which == 32) spacePushed = false;
};

function tick(){
    if (img.complete) {
            ctx.drawImage(img,0,0);
        }
    for(var i = 0;i < spriteList.length;i++){
        var alive = spriteList[i].tick();

        if(!alive){
            spriteList.splice(i,1);
            i--;
            genPlatform();
        }
    }

    window.requestAnimationFrame(tick);
};

function genPlatform() {
    var randY = Math.round(Math.random() * (5-3) + 3);
    var randW = Math.random() * (3-1) + 1;
    spriteList.push(new Platform(10,randY, randW));
}

class Platform {
    constructor (posX, posY, width) {
        this.posX = posX * 50;
        this.posY = posY * 50;
        this.width = width * 50;
        this.height = 25;
    }

    tick() {
        var alive = this.posX >= -this.width;
        this.posX -= 1;

        ctx.fillStyle = "#FF0000";
        ctx.fillRect(this.posX, this.posY, this.width, this.height);

        return alive;
    }
};

class Player {
    constructor () {
        this.posX = 0;
        this.posY = 0;
        this.speedX = 0;
        this.velocityX = 0.05;
        this.speedY = 1;
        this.velocityY = 0.2;
    }

    gravity() {

        if (this.posY < 300) {
            this.speedY += this.velocityY;
            this.posY += this.speedY;
        }

        this.posX -=1;
        this.posX += this.speedX;

        if(rightPushed) {
            console.log("sadf");
            if(this.speedX < 1) {
                this.speedX += this.velocityX*4;
            }
            else {
                this.speedX += this.velocityX;
            }
        }

        if(leftPushed) {
            if(this.speedX > 1) {
                this.speedX -= this.velocityX*4;
            }
            else {
                this.speedX -= this.velocityX;
            }
        }

        if(!leftPushed && !rightPushed){
            if(this.speedX > 0) {
                this.speedX -= this.velocityX*2;
            }
            else if(this.speedX < 0){
                this.speedX += this.velocityX*2;
            }
        }

        if(this.posX <= 0) {
            this.posX = 0;
        }
        else if(this.posX >= 475) {
            this.posX = 475;
        }
    }

    collision() {
        for(var i = 1;i < spriteList.length;i++){
            // X
            if(this.posX+25 > spriteList[i].posX && this.posX - spriteList[i].posX < spriteList[i].width) {
                // Y
                if( spriteList[i].posY - this.posY < 25 ) {
                        console.log(this.posY)
                        this.posY = spriteList[i].posY - 25;
                        this.speedY = 0;
                }
            }
        }
    }

    tick() {
        if(spacePushed && this.speedY == 0) this.speedY = -9;
        this.gravity();
        this.collision();
        var alive = this.posY < 300;

        ctx.fillStyle = "#00ff00";
        ctx.fillRect(this.posX, this.posY, 25, 25);

        return alive;
    }
}
