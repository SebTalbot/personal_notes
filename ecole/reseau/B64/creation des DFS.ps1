#Robert Jr Vendette
#Jeudi 24 novembre 2016
#Création des DFS
#À exécuter sur le serveur membre (SV2)

$domaine= "MiddleEarth.pro"

new-item -ItemType directory C:\DFSRoots\Departementale
new-item -ItemType directory C:\DFSRoots\Gestionnaires

#Création du partage
New-SmbShare -Name MiddleEarth_DFS_Gest `
             -Path C:\DFSroots\Gestionnaires `
             -CachingMode None `
             -FullAccess "Tout le monde"

New-SmbShare -Name MiddleEarth_DFS_Dept `
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
               -TargetPath \\Gondor\Analyse

New-DfsnFolder -Path "\\$domaine\DFS_Departementale\Integration" `
               -TargetPath \\Gondor\Integration

New-DfsnFolder -Path "\\$domaine\DFS_Departementale\Programmation" `
               -TargetPath \\Gondor\Programmation

New-DfsnFolder -Path "\\$domaine\DFS_Departementale\TEST" `
               -TargetPath \\Mordor\TEST

New-DfsnFolder -Path "\\$domaine\DFS_Gestionnaires\Profils" `
               -TargetPath \\Gondor\_CEGAT_PRO\Profils

New-DfsnFolder -Path "\\$domaine\DFS_Gestionnaires\Dossiers_perso" `
               -TargetPath \\Gondor\_CEGAT_PRO\"Dossiers Personnels"

New-DfsnFolder -Path "\\$domaine\DFS_Gestionnaires\Dept" `
               -TargetPath \\$domaine\DFS_Departementale

