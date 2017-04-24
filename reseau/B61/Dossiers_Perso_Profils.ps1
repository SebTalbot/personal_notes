#Robert Jr Vendette
#Lundi 21 novembre
#Création des dossiers personnels et de profils
#À exécuter sur le serveur membre

$usagers = Import-Csv "C:\PROG.csv" -Delimiter ";"
$domaine = "MiddleEarth"
$serveur1 = "B64HV1"
$serveur2 = "Gondor"


New-Item C:\_CEGAT_PRO\"Dossiers Personnels" -ItemType directory
New-Item C:\_CEGAT_PRO\Profils -ItemType directory

#Création des dossiers du département
New-Item C:\_CEGAT_PRO\ANALYSE -ItemType directory
New-Item C:\_CEGAT_PRO\INTEGRATION -ItemType directory
New-Item C:\_CEGAT_PRO\PROGRAMMATION -ItemType directory
New-Item -ItemType directory -Path \\$serveur1\C$\_CEGAT_PRO\TEST

foreach($usager in $usagers)
{
    $nom = $usager.Nom +", " +$usager.Prenom
    $displayName = $usager.Prenom + " " + $usager.Nom
    Write-Host $nom
    #Créer les dossier personnels
    New-Item -Path C:\_CEGAT_PRO\"Dossiers Personnels"\$nom -ItemType directory    


    #Créer les dossiers de profils
    new-item C:\_CEGAT_PRO\Profils\$displayName.v4 -ItemType directory

    #Modifie les droits pours les dossiers personnels
    icacls.exe C:\_CEGAT_PRO\"Dossiers Personnels"\$nom /inheritance:r
    icacls.exe C:\_CEGAT_PRO\"Dossiers Personnels"\$nom /grant "Administrateurs:(OI)(CI)(F)"
    icacls.exe C:\_CEGAT_PRO\"Dossiers Personnels"\$nom /grant "Système:(OI)(CI)(F)"
    icacls.exe C:\_CEGAT_PRO\"Dossiers Personnels"\$nom /grant "${domaine}\Gestionnaires:(RX)"
    icacls.exe C:\_CEGAT_PRO\"Dossiers Personnels"\$nom /grant "Createur proprietaire:(OI)(CI)(RX)"
    icacls.exe C:\_CEGAT_PRO\"Dossiers Personnels"\$nom /grant "${domaine}\${displayName}:M"
    
    #Modifie les droits pour les dossier de profils
    icacls.exe C:\_CEGAT_PRO\"Profils"\$nom /inheritance:r
    icacls.exe C:\_CEGAT_PRO\"Profils"\$nom /grant "${domaine}\${displayName}:M" 
    
    set-Aduser -identity $displayName -HomeDirectory "C:\_CEGAT_PRO\Dossiers Personnels\$nom" -HomeDrive "P:"
    
}   
    
Get-SmbShare -Name ANALYSE | Remove-SmbShare -Force
Get-SmbShare -Name INTEGRATION | Remove-SmbShare -Force
Get-SmbShare -Name PROGRAMMATION | Remove-SmbShare -Force
Get-SmbShare -Name _CEGAT_PRO | Remove-SmbShare -Force
Get-SmbShare -Name TEST -CimSession B64HV1 | Remove-SmbShare -Force


$partages = "ANALYSE", "INTEGRATION", "PROGRAMMATION", "_CEGAT_PRO"
foreach($item in $partages){
    $nom = $item
    New-SmbShare -Name $nom `
                 -Path C:\_CEGAT_PRO\$nom `
                 -CachingMode None `
                 -FolderEnumerationMode AccessBased `
                 -FullAccess "Tout le monde" `
}

New-SmbShare -Name TEST `
                 -Path C:\_CEGAT_PRO\TEST `
                 -CachingMode None `
                 -FolderEnumerationMode AccessBased `
                 -FullAccess "Tout le monde" `
                 -CimSession $serveur1
