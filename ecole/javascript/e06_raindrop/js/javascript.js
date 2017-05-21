var ctx = null;
var spriteList = [];
var img = new Image();
window.onload = function () {
    ctx = document.getElementById("canvas").getContext("2d");
    
    img.src = "images/landscape.png";

        if (img.complete) {
            ctx.drawImage(img,0,0);
        } 
    tick();
}
function tick(){
    if (img.complete) {
            ctx.drawImage(img,0,0);
        } 
    if(Math.random() <= 0.9){
            spriteList.push(new Square(getRandomInt(1, 500),0,getRandomInt(2, 9)));
        }
    for(var i = 0;i < spriteList.length;i++){
        var alive = spriteList[i].tick();

        if(!alive){
            spriteList.splice(i,1);
            i--;
        }
    
    }
    window.requestAnimationFrame(tick);
}
class Square {
    constructor(x, y, size) {
        this.x = x;
        this.y = y;
        this.size = size;
        
    }

    tick() {
        console.log(this.x);
        var alive = true;
        ctx.fillStyle = "red";
        if (this.y > 300) {
            alive = false;
        }
        var speed = this.size * 0.6;
        ctx.fillRect(this.x,this.y,this.size,this.size);
        this.y += speed;
        return alive;
        
    }

}
function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min;
}

