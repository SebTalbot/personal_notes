class Ball {
    constructor(id) {
        this.id = id;
        this.node = document.getElementById(this.id);
        this.node.style.top = (Math.random() * 60 + 10) + "px";
		this.node.style.left = (Math.random() * 60 + 15) + "px";
        this.y = this.node.offsetTop;
		this.x = this.node.offsetLeft;
		this.speedY = Math.random() * 10;
        this.speedX = Math.random() * 10;
        this.velocityY = 0.5;
    }

    tick() {
        this.speedY += this.velocityY;
        this.y += this.speedY;

		this.x += this.speedX;

        if(this.y >= 220) {
            this.y = 220;
            this.speedY = -this.speedY/1.5;
			this.speedX -= this.speedX/2;
        }

		if(this.x >= 390) {
			this.x = 390;
			this.speedX = -this.speedx/1.5;
		}

        if (Math.abs(this.speedY) < 1) {
            this.speedY = 1;
            this.velocityY = 0.5;
        }

        this.node.style.top = this.y + "px";
		this.node.style.left = this.x + "px";
		
    }
}
