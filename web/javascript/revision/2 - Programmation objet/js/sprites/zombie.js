
class Zombie {
    constructor(id){
        this.id = id;
        this.x = 500;
        this.y = 100;
        this.destinationX = (Math.random() * 800 + 100);
        this.destinationY = (Math.random() * 100 + 50);
        this.node = document.getElementById(this.id);
        this.node.style.top = this.y + "px";
		    this.node.style.left = this.x + "px";
        this.speedX = 1;
        this.speedY = 1;
        this.velocityGapX = 0.1;
        this.velocityGapY = 0.1;
        this.minSpeed = -5;
        this.maxSpeed = 5;
    }


    tick() {
        if(Math.abs(this.x - this.destinationX) > this.maxSpeed) {
            if(this.x > this.destinationX) {
                if(this.speedX > this.minSpeed) {
                    this.speedX -= this.velocityGapX;
                }
            }
            else {
                if(this.speedX < this.maxSpeed) {
                    this.speedX += this.velocityGapX;
                }
            }
        }
        else {
            this.destinationX = (Math.random() * 800 + 100);
        }

        if(Math.abs(this.y - this.destinationY) > this.maxSpeed) {
            if(this.y > this.destinationY) {
                if(this.speedY > this.minSpeed) {
                    this.speedY -= this.velocityGapY;
                }
            }
            else {
                if(this.speedY < this.maxSpeed) {
                    this.speedY += this.velocityGapY;
                }
            }
        }
        else {
            this.destinationY = (Math.random() * 200 + 50);
        }

        this.x += this.speedX;
        this.y += this.speedY;
        this.node.style.top = this.y +"px";
		    this.node.style.left = this.x + "px";
    }
}
