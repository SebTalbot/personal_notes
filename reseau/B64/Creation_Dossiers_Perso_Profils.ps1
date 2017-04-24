#Lundi 21 novembre
#Création des dossiers personnels et de profils
#À exécuter sur le contrôleur de domaine

$usagers = Import-Csv "C:\PROG.csv" -Delimiter ";"
$domaine = "MiddleEarth"
$serveur1 = "Mordor"
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
    $matricule = $usager.Matricule
    $displayName = $usager.Prenom + " " + $usager.Nom
    Write-Host $nom
    #Créer les dossier personnels
    New-Item -Path C:\_CEGAT_PRO\"Dossiers Personnels"\$matricule -ItemType directory    


    #Créer les dossiers de profils
    new-item C:\_CEGAT_PRO\Profils\$displayName.v4 -ItemType directory

    #Modifie les droits pours les dossiers personnels
    icacls.exe C:\_CEGAT_PRO\"Dossiers Personnels"\$matricule /inheritance:r
    icacls.exe C:\_CEGAT_PRO\"Dossiers Personnels"\$matricule /grant "Administrateurs:(OI)(CI)(F)"
    icacls.exe C:\_CEGAT_PRO\"Dossiers Personnels"\$matricule /grant "Système:(OI)(CI)(F)"
    icacls.exe C:\_CEGAT_PRO\"Dossiers Personnels"\$matricule /grant "${domaine}\Gestionnaires:(RX)"
    icacls.exe C:\_CEGAT_PRO\"Dossiers Personnels"\$matricule /grant "Createur proprietaire:(OI)(CI)(RX)"
    icacls.exe C:\_CEGAT_PRO\"Dossiers Personnels"\$matricule /grant "${domaine}\${displayName}:M"
    
    #Modifie les droits pour les dossier de profils
    icacls.exe C:\_CEGAT_PRO\"Profils"\$matricule /inheritance:r
    icacls.exe C:\_CEGAT_PRO\"Profils"\$matricule /grant "${domaine}\${displayName}:M" 
    
    set-Aduser -identity $displayName -HomeDirectory "C:\_CEGAT_PRO\Dossiers Personnels\$matricule" `
                                      -HomeDrive "P:" `
                                      -ProfilePath "C:\_CEGAT_PRO\Profils\$matricule"
    
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

#Attribution des droits NTFS sur les dossiers
icacls.exe C:\CEGAT_PRO /grant "Administrateurs:(OI)(CI)(F)"
icacls.exe C:\CEGAT_PRO /grant "Systeme:(OI)(CI)(F)"
icacls.exe C:\CEGAT_PRO /grant "grGestionnaires:(OI)(CI)(F)"

icacls.exe C:\CEGAT_PRO\INTEGRATION /grant "grDesigners:(OI)(CI)(M)"
icacls.exe C:\CEGAT_PRO\INTEGRATION /grant "Utilisateurs du domaine:(OI)(CI)(RX)"

icacls.exe C:\CEGAT_PRO\PROGRAMMATION /grant "gr.NET:(OI)(CI)(M)"
icacls.exe C:\CEGAT_PRO\PROGRAMMATION /grant "Utilisateurs du domaine:(OI)(CI)(RX)"

icacls.exe C:\CEGAT_PRO\ANALYSE /grant "grIntegrateurs:(OI)(CI)(M)"
icacls.exe C:\CEGAT_PRO\ANLAYSE /grant "Utilisateurs du domaine:(OI)(CI)(RX)"

icacls.exe C:\CEGAT_PRO\TEST /grant "gr.NET:(OI)(CI)(M)"
icacls.exe C:\CEGAT_PRO\TEST /grant "Utilisateurs du domaine:(OI)(CI)(RX)"