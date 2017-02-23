class Monster {
	constructor(id) {
		this.id = id;
		this.node = document.getElementById(this.id);
		this.x = this.node.offsetLeft;
		this.y = this.node.offsetTop;
		this.speedX = 1;
		this.speedY = 1;
		this.VitesseMax = 8;
		this.Velocity = 0.1;
	}

	tick(){
		var angle = getElementAngle(this.x,this.y,mousePosX,mousePosY);
		rotateElement(this.node, angle);

		// Vitesse A TERMINER!!!!
		this.speedX += this.Velocity;
		this.speedY += this.Velocity;

		if (this.speedX > this.VitesseMax) {
			this.speedX = this.VitesseMax;
		}

		if (this.speedY > this.VitesseMax) {
			this.speedY = this.VitesseMax;
		}

		if(this.x > mousePosX) {
			this.speedX = -this.speedX/2;
		}

		if(this.y > mousePosY) {
			this.speedY = -this.speedY/2;
		}

		// Position
		this.x += this.speedX;
		this.y += this.speedY;

		this.node.style.top = this.y + "px";
		this.node.style.left = this.x + "px";
	}
}
