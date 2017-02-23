function generate() {
	var zoneChoix = document.getElementById("nbLuigi");
	var nombre = zoneChoix.options[zoneChoix.selectedIndex].value;

	for (var i = 0; i < nombre; i++) {
		var container = document.getElementsByClassName("main-content");
        var node = document.createElement("p");
		var text = document.createTextNode("Top Luigi");

		node.appendChild(text);
        container[0].appendChild(node);

		node.onclick = function() {
			container[0].removeChild(this);
		}
	}
}
