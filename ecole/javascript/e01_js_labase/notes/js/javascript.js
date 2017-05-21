// JS pour E10
// On doit attendre le chargement de la page avant de manipuler des balises car sinon elles n'existent pas encore
window.onload = debuterTraitement;

function debuterTraitement () {
    var node = document.getElementById("paragraphe");
    node.style.color = "red";
}
