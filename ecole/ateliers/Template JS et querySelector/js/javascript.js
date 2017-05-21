var characters = [
	{
		name : "John",
		type : "Caster",
		hp : "123",
		def : "1"
	},
	{
		name : "Sonic",
		type : "Runner",
		hp : "15",
		def : "0"
	},
	{
		name : "Rino",
		type : "Rogue",
		hp : "25",
		def : "2"
	}
]

window.onload = function () {
	createCharacters();
}

function createCharacters() {
	document.getElementById("container").innerHTML = "";

	var template = document.querySelector("#template").innerHTML;

	for (var i = 0; i < characters.length; i++) {
		var div = document.createElement("div");
		div.innerHTML = template;
		div.setAttribute("data-id", i);
		div.querySelector("h2").innerHTML = characters[i].name;
		div.querySelector(".type").innerHTML = characters[i].type;
		div.querySelector(".hp").innerHTML = characters[i].hp;
		div.onclick = function () {
			alert(this.getAttribute("data-id"))
		}

		document.getElementById("container").appendChild(div);
	}
}