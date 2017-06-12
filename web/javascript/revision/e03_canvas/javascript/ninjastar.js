class Star {
    constructor(x,y) {
        this.x = x;
        this.y = y;
        this.speedX = 14;
        
    }
    tick() {
            ctx.drawImage(img2,this.x,this.y);
            this.y -= this.speedX;

            var alive = this.y > 0;

            return alive;
    }

}