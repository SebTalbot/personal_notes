function validate() {
    var patternNom =/^[a-zA-Z]{2,20}$/;
    var patternMail = /^[a-zA-Z]{1,}[@]{1}[a-z]{1,}[.]{1}.$/
    var patternMdp = /^.{6,}$/
		var prenom = document.getElementById("prenom");
		var nom = document.getElementById("nom");
    var courriel = document.getElementById("courriel");
    var mdp = document.getElementById("mdp");
    var success = true;

    if(!patternNom.test(prenom.value)) {
        alert("Prenom n'est pas valide. (20 chars max)");
    }
    else if(!patternNom.test(nom.value)) {
        alert("Nom n'est pas valide. (20 chars max)");
    }
    else if(!patternMail.test(courriel.value)) {
        alert("Le courriel n'est pas valide");
    }
    else if(!patternMdp.test(mdp.value)) {
        alert("Le mot de passe n'est pas valide");
    }

    console.log(patternNom.test(nom.value));

    return success;
}
