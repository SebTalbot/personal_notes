#Robert Jr Vendette
#Le lundi 14 novembre 2016
#Script Hyper-V B61
#À exécuter sur le serveur réel

###Script de Création###

$disqueVHDX = "C:\_VIRTUEL\Disque"
$ordiVHDX = "C:\_VIRTUEL\Ordi"

#Installation de Hyper-V et du gestionnaire
Install-WindowsFeature -name Hyper-V -ComputerName 407P15 -IncludeManagementTools -Restart

###Création des dossiers pour Hyper-V###
New-Item -Path C:\_VirDisque -ItemType directory
New-Item -Path C:\_VirOrdi -ItemType directory

###Installation des nouvelles cartes réseau###

#Carte externe
New-VMSwitch -Name Externe -NetAdapterName Externe

#Carte privée
New-VMSwitch -Name Privé -SwitchType private

#Comment modifier le chemin de l'ordinateur virtuel
Set-VMHost -VirtualMachinePath $ordiVHDX

#Comment modifier le chemin du disque dur virtuel
Set-VMHost -VirtualHardDiskPath $disqueVHDX

###Création des ordinateurs virtuels###
New-VM -Name B61-Serveur1 `
       -BootDevice IDE `
       -Confirm:$False `
       -Generation 1 `
       -MemoryStartupBytes 4096MB `
       -VHDPath "$disqueVHDX\SERV1.vhdx" `
       -SwitchName Privé

New-VM -Name B61-Serveur2 `
       -BootDevice IDE `
       -Confirm:$False `
       -Generation 1 `
       -MemoryStartupBytes 4096MB `
       -VHDPath "$disqueVHDX\SERV2.vhdx" `
       -SwitchName Privé
       
New-VM -Name B61-Routeur `
       -BootDevice IDE `
       -Confirm:$False `
       -Generation 1 `
       -MemoryStartupBytes 512MB `
       -SwitchName Externe `
       -VHDPath "$disqueVHDX\pfSense_2.3.2.vhdx" `
 
#Ajout de la carte privée dans les paramètres du routeur pfSense      
Add-VMSwitch -Name Privé -ComputerName B61-Routeur


