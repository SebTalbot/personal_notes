#get-dfsnroot -Path \\B64.local\B64_DFSvendeurs | format-list

###Création d'un nouvel espace de nom DFS###

##Création du dossier pour le partage##
New-Item -Path C:\DFSRoots\B64_DFSadmin -ItemType directory

##Création du partage##
New-SmbShare -Name B64_DFSadmin `
             -Path C:\DFSRoots\B64_DFSadmin `
             -CachingMode None `
             -FullAccess "Administrateurs" `
             -ReadAccess "Tout le monde"

##Création de l'espace de nom##
New-DfsnRoot -TargetPath \\B64HV2\B64_DFSadmin `
             -Type DomainV2 `
             -EnableAccessBasedEnumeration $True `
             -Path \\B64.LOCAL\B64_DFSadmin

##Création des dossier de l'espace de nom##
New-DfsnFolder -Path "\\B64.LOCAL\B64_DFSadmin\Partage corporatif" `
               -TargetPath \\B64.LOCAL\netlogon

New-DfsnFolder -Path "\\B64.LOCAL\B64_DFSadmin\Disque C sur CD" `
               -TargetPath \\B64HV1\C$

New-DfsnFolder -Path "\\B64.LOCAL\B64_DFSadmin\Disque C sur serveur 2" `
               -TargetPath \\B64HV2\C$

##Afficher les informations des DFS##
Get-DfsnFolderTarget -Path "\\B64.LOCAL\B64_DFSadmin\Partage corporatif" `
                     -TargetPath \\B64.LOCAL\NETLOGON | Format-List Path, TargetPath

Get-DfsnFolderTarget -Path "\\B64.LOCAL\B64_DFSadmin\Disque C sur CD" `
                     -TargetPath \\B64HV1\C$ | Format-List Path, TargetPath

Get-DfsnFolderTarget -Path  "\\B64.LOCAL\B64_DFSadmin\Disque C sur serveur 2" `
                     -TargetPath \\B64HV2\C$ | Format-List Path, TargetPath
