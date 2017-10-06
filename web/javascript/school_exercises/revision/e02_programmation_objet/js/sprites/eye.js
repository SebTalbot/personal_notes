class Eye {
    constructor(x, y) {
        this.node = document.createElement("div");
        this.node.setAttribute("class", "eye");
        this.node.style.top = y + "px";
        this.node.style.left = x + "px";

        this.opacity = 1;

        document.body.appendChild(this.node);
    }

    tick() {
        var alive = this.opacity > 0;
        this.opacity -= 0.008;

        if(!alive) {
            document.body.removeChild(this.node);
        }

        this.node.style.opacity = String(this.opacity);

        return alive;
    }

}
