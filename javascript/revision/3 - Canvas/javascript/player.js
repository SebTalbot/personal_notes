class Player {
    constructor(id) {
        this.id = id;
        this.x = 10;
        this.y = 180;
        this.speedX = 7;
        
    }
    tick() {
        ctx.clearRect(0,0,400,300);
        ctx.drawImage(img,this.x,this.y);
        if (leftPushed == true) {
            this.x -= this.speedX;
        } 
        if (rightPushed == true) {
            this.x += this.speedX;
        } 
        if (spacePushed == true) {
            chiasse.push(new Star(this.x,this.y));
        }
    }

}