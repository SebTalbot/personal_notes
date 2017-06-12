window.onload = function(){
    document.getElementById("memo-input").onkeyup = function(e) {
        if(e.which == 13 && this.value != ""){
            ajouter(this);
            this.value = "";
        }
    };
};

function ajouter(element) {
    var liste = document.getElementById("memo-list");

    var node = document.createElement("div");
    node.setAttribute("class", "memo-entry");
    node.onclick = function() {
        liste.removeChild(this);
    };

    var txt = document.createTextNode(element.value);
    node.appendChild(txt);

    liste.appendChild(node);
}
