#Robert Jr Vendette
#Jeudi 24 novembre 2016
#Création des DFS
#À exécuter sur le serveur membre (SV2)

$domaine= "MiddleEarth.pro"

Install-WindowsFeature RSAT-DFS-Mgmt-Con

new-item -ItemType directory C:\DFSRoots\Departementale
new-item -ItemType directory C:\DFSRoots\Gestionnaires

#Création des partages pour les espaces de nom
New-SmbShare -Name DFS_Gest `
             -Path C:\DFSroots\Gestionnaires `
             -CachingMode None `
             -FullAccess "Tout le monde"

New-SmbShare -Name DFS_Dept `
             -Path C:\DFSroots\Departementale `
             -CachingMode None `
             -FullAccess "Tout le monde" `

#Création des espaces de nom
New-DfsnRoot -TargetPath C:\DFSroots\Gestionnaires `
             -Type DomainV2 `
             -EnableAccessBasedEnumeration $True `
             -Path "\\$domaine\DFS_Gestionnaires"

New-DfsnRoot -TargetPath C:\DFSroots\Departementale `
             -Type DomainV2 `
             -EnableAccessBasedEnumeration $True `
             -Path "\\$domaine\DFS_Departementale"

#Création des dossier de l'espace de nom
New-DfsnFolder -Path "\\$domaine\DFS_Departementale\Analyse" `
               -TargetPath \\$domaine\\Analyse

New-DfsnFolder -Path "\\$domaine\DFS_Departementale\Integration" `
               -TargetPath \\Gondor\Integration

New-DfsnFolder -Path "\\$domaine\DFS_Departementale\Programmation" `
               -TargetPath \\Gondor\_CEGAT_PRO\Programmation

New-DfsnFolder -Path "\\$domaine\DFS_Departementale\TEST" `
               -TargetPath \\Mordor\_CEGAT_PRO\TEST

New-DfsnFolder -Path "\\$domaine\DFS_Gestionnaires\Profils" `
               -TargetPath \\$domaine\DFS_Gest\Profils

New-DfsnFolder -Path "\\$domaine\DFS_Gestionnaires\Dossiers_perso" `
               -TargetPath \\$domaine\DFS_Gest\"Dossiers Personnels"

#Créé un dossier qui mène vers la DFS départementale
New-DfsnFolder -Path "\\$domaine\DFS_Gestionnaires\Dept" `
               -TargetPath \\$domaine\DFS_Departementale

