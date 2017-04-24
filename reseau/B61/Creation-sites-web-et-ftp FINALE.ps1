#Robert Jr Vendette
#Lundi 21 novembre 2016
#Création des sites web et ftp
#À exécuter sur le serveur membre



#Installe le module IIS.
Install-WindowsFeature  -Name  web-server  -IncludeManagementTools

#Créé et ajoute le contenu des sites web dans les fichiers

if (!(test-path -path "C:\_CEGAT_PRO\WEBDEPTPRO"))
{
  New-Item -Path "C:\_CEGAT_PRO\WEBDEPTPRO" -ItemType directory  
}

$fichier = "C:\_CEGAT_PRO\WEBDEPTPRO\index.html"

$contenu = `
 "<html>
    <head>
		<title>Site web DEPT PRO</title>
	</head>
	<body>
		<p>Robert Jr Vendette</p>

		<p>Site par adresse DEPT PRO pour MiddleEarth.PRO</p>

		<p>Adresse IP: 192.168.1.20</p>

		<p>Port 80</p>
	</body>
</html>"

Set-Content -Path $fichier -Value $contenu

#Création du deuxième site web
if (!(test-path -path ""C:\_CEGAT_PRO\WEBSECPRO"))
{
  New-Item -Path "C:\_CEGAT_PRO\WEBSECPRO -ItemType directory  
}

$fichier = "C:\_CEGAT_PRO\WEBSECPRO\index.html"

$contenu = `
 "<html>
    <head>
		<title>Site web SEC PRO</title>
	</head>
	<body>
		<p>Robert Jr Vendette</p>

		<p>Site par adresse SEC PRO pour MiddleEarth.PRO</p>

		<p>Adresse IP: 192.168.1.20</p>

		<p>Port 443. Connexion SSL exigée</p>
	</body>
</html>"

Set-Content -Path $fichier -Value $contenu

#Création des site webs dans la console IIS
New-website –name WEBDEPTPRO –ipaddress 192.168.1.20 –port 80 -physicalpath C:\_CEGAT_PRO\WEBDEPTPRO
New-website –name WEBSECPRO –ipaddress 192.168.1.20 –port 443 -physicalpath C:\_CEGAT_PRO\WEBSECPRO -Ssl

#Créé et ajoute le contenu des sites FTP dans les fichiers
add-content -path C:\_CEGAT_PRO\FTPDEPTPRO\FTPDEPTPRO.txt -value "Robert Jr Vendette", "`nFTPDEPTPRO.MiddleEarth.PRO", "`nAdresse IP: 192.168.1.20", "`nPort: 21"

for($i = 1; $i -le 3; $i++)
{
    add-content -path C:\_CEGAT_PRO\FTPADPRO_BIDON\FTP0$i.txt -value "FTP0$i", "`nFTPADPRO.MiddleEarth.PRO", "`nAdresse IP: 192.168.1.21", "`nPort: 21"
}

#Création du dossier pour le site FTP ADPRO
New-Item C:\_CEGAT_PRO\FTPADPRO_BIDON -ItemType directory

#Créé et ajouter le contenu dans chacun des dossiers des utilisateurs de _CEGAT_PERSO\FTP
for($i = 1; $i -le 3; $i++)
{
    New-Item C:\_CEGAT_PERSO\FTP0$i -ItemType directory
    add-content -path C:\_CEGAT_PERSO\FTP0$i\FTP0$i.txt -value "FTP0$i", "`nFTPADPRO.MiddleEarth.PRO", "`nAdresse IP: 192.168.1.21", "`nPort: 21"
}

#Création des sites FTP dans la console IIS
New-WebFtpSite -Name FTPDEPTPRO `
               -IPAddress 192.168.1.20 `
               -PhysicalPath C:\_CEGAT_PRO\FTPDEPTPRO  `
               -Port 21 

#Authentification FTP
Set-ItemProperty -Path "IIS:\Sites\FTPDEPTPRO" `
				 -Name ftpServer.security.authentication.anonymousAuthentication `
				 -Value $true

Set-ItemProperty -Path "IIS:\Sites\FTPDEPTPRO" `
                 -Name ftpServer.security.authentication.basicAuthentication.enabled `
				 -Value $true

#Règles d'autorisations				 
Add-WebConfiguration -Filter "/system.ftpServer/security/authorization" `
                     -Value @{accessType="Allow";users="*";permissions=1} `
					 -PSPath IIS:\ `
					 -Location "FTPDEPTPRO"

# "Tous les utilisateurs anonymes"
# Autorisations = Lecture				 
Add-WebConfiguration -Filter "/system.ftpServer/security/authorization" `
                     -Value @{accessType="Allow";users="?";permissions=1} `
					 -PSPath IIS:\ `
					 -Location "FTPDEPTPRO"


# Autorisations = Lecture et Écriture"					 
Add-WebConfiguration -Filter "/system.ftpServer/security/authorization" `
                     -Value @{accessType="Allow";roles="Administrateurs";permissions=3} `
					 -PSPath IIS:\ `
					 -Location "FTPDEPTPRO"				 

Restart-WebItem "IIS:\Sites\FTPDEPTPRO"	











New-WebFtpSite -Name FTPADPRO -IPAddress 192.168.1.21 -PhysicalPath C:\_CEGAT_PRO\FTPDADPRO_BIDON -Port 21

#Changement des paramètres du site FTP au niveau du type d'isolation
Set "User Isolation"

Set-ItemProperty -Path "C:\_CEGAT_PRO\FTPADPRO_BIDON" `
                 -Name ftpserver.userisolation.mode `
                 -Value 2 #valeur pour isolation dans l'Active directory

##=====================================##

Set-ItemProperty -Path "IIS:\Sites\FTPADPRO" `
				 -Name ftpServer.security.authentication.anonymousAuthentication `
				 -Value $true

Set-ItemProperty -Path "IIS:\Sites\FTPADPRO" `
                 -Name ftpServer.security.authentication.basicAuthentication.enabled `
				 -Value $true

#Règles d'autorisations				 
Add-WebConfiguration -Filter "/system.ftpServer/security/authorization" `
                     -Value @{accessType="Allow";users="*";permissions=1} `
					 -PSPath IIS:\ `
					 -Location "FTPADPRO"

# "Tous les utilisateurs anonymes"
# Autorisations = Lecture				 
Add-WebConfiguration -Filter "/system.ftpServer/security/authorization" `
                     -Value @{accessType="Allow";users="?";permissions=1} `
					 -PSPath IIS:\ `
					 -Location "FTPADPRO"


# Autorisations = Lecture et Écriture"					 
Add-WebConfiguration -Filter "/system.ftpServer/security/authorization" `
                     -Value @{accessType="Allow";roles="Administrateurs";permissions=3} `
					 -PSPath IIS:\ `
					 -Location "FTPADPRO"

Add-WebConfiguration -Filter "/system.ftpServer/security/authorization" `
                     -Value @{accessType="Allow";users="grFTP";permissions="Read, Write"} `
					 -PSPath IIS:\ `
					 -Location "FTPADPRO"					 

Restart-WebItem "IIS:\Sites\FTPADPRO"