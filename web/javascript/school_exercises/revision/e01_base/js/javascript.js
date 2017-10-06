$(document).ready(function () {
    $("p").click(function(){
        $(this).animate({
            opacity: 0.5
        },2000,function() {
            $(this).delay(2000).animate({
                opacity:1
            },2000);
        });
    });
});


function validateData(){
    var prenom = document.getElementById("firstName").value;
    var nom = document.getElementById("lastName").value;
    if(prenom != "" && nom != ""){
        window.location.href =" http://perdu.com ";
        
    }

    return false;
}