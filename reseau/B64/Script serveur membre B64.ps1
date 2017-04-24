#Script Serveur membre B64 (SV2)

#Création des DFS
$domaine= "MiddleEarth.pro"

Install-WindowsFeature -Name FS-DFS-Namespace -IncludeManagementTools 

new-item -ItemType directory C:\DFSRoots\DEPT
new-item -ItemType directory C:\DFSRoots\GEST

#Création des partages pour les espaces de nom
New-SmbShare -Name DFS_Gest `
             -Path C:\DFSroots\GEST `
             -CachingMode None `
             -FullAccess "Administrateurs" `
             -ReadAccess "Tout le monde"

New-SmbShare -Name DFS_Dept `
             -Path C:\DFSroots\DEPT `
             -CachingMode None `
             -FullAccess "Administrateurs" `
             -ReadAccess "Tout le monde"

#Création des espaces de nom
New-DfsnRoot -TargetPath \\Mordor\DFS_Gest `
             -Type DomainV2 `
             -EnableAccessBasedEnumeration $True `
             -Path "\\$domaine\DFS_GEST"

New-DfsnRoot -TargetPath \\Mordor\DFS_Dept `
             -Type DomainV2 `
             -EnableAccessBasedEnumeration $True `
             -Path "\\$domaine\DFS_DEPT"

#Création des dossiers de l'espace de nom
New-DfsnFolder -Path "\\$domaine\DFS_DEPT\Analyse" `
               -TargetPath \\Gondor\Analyse

New-DfsnFolder -Path "\\$domaine\DFS_DEPT\Integration" `
               -TargetPath \\Gondor\Integration

New-DfsnFolder -Path "\\$domaine\DFS_DEPT\Programmation" `
               -TargetPath \\Gondor\Programmation

New-DfsnFolder -Path "\\$domaine\DFS_DEPT\TEST" `
               -TargetPath \\Mordor\TEST

New-DfsnFolder -Path "\\$domaine\DFS_GEST\Profils" `
               -TargetPath \\Gondor\Profils$

New-DfsnFolder -Path "\\$domaine\DFS_GEST\Dossiers_perso" `
               -TargetPath \\Gondor\Perso$

#Créé un dossier qui mène vers la DFS départementale
New-DfsnFolder -Path "\\$domaine\DFS_GEST\Dept" `
               -TargetPath \\$domaine\DFS_DEPT
