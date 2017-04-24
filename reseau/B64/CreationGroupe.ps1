#Robert Jr Vendette
#Le lundi 14 novembre 2016
#Script Création de groupe B64
#À exécuter sur le contrôleur de domaine

$groupes = "Programmation", "Developpeurs", "Integrateurs", "Designer", "Testeurs",
"Gestionnaires", ".NET", "3D", "Jeux", "Outils"
$domaine = (Get-ADDomain).DistinguishedName

write-host "OU=Programmation,$domaine"

foreach($groupe in $groupes)
{
    $name = $groupe
    
    New-ADGroup -Name $name `
                -GroupCategory Security `
                -GroupScope Global `
                -Path "OU=Programmation,$domaine"
}