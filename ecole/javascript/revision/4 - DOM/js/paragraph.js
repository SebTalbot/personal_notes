class Paragraph {
    constructor() {
		this.container = document.getElementsByClassName("main-content");
        this.node = document.createElement("p");
		var text = document.createTextNode("Top Luigi");

		this.node.appendChild(text);
        this.container[0].appendChild(this.node);
		console.log(this);

		this.node.onclick = function() {
			//this.container[0].removeChild(this.node);
			console.log(this.parent);
		}
    }
}
