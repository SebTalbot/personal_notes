#B64 - Script à rouler sur le Contrôleur de domaine (SV1)

#Installation du rôle de l'Active Directory

Install-windowsfeature -name AD-Domain-Services "IncludeManagementTools"

#Pour installer une nouvelle forêt dans l'AD

Install-ADDSForest -DomainName "MiddleEarth.PRO"

#Création des UO dans l'AD

$domaine = "MiddleEarth.PRO"
$path = "DC=MiddleEarth,DC=PRO"

$UO = "Designers Web", "Developpeurs", "Integrateurs", "Ordinateurs", "Testeurs"
$sousGroupesDev = ".NET", "3D"
$sousGroupesTest = "Jeux", "Outils"

 New-ADOrganizationalUnit -Name "Programmation"`
							 -Path $path `
							 -Description "L'unité d'organisation Programmation est directement sour le domaine" `
							 -ProtectedFromAccidentalDeletion $false


foreach($item in $UO)
{
    
    New-ADOrganizationalUnit -Name $item `
                             -Path "OU=Programmation,$path" `
                             -Description "$item est sous l'OU Programmation" `
                             -ProtectedFromAccidentalDeletion $false
                                                             
}

foreach($item in $sousGroupesDev)
{
    
    New-ADOrganizationalUnit -Name $item `
                             -Path "OU=Programmation,OU=Developpeurs,$path" `
                             -Description "$item est sous l'OU Developpeurs" `
                             -ProtectedFromAccidentalDeletion $false
                                                             
}

foreach($item in $sousGroupesTest)
{
    
    New-ADOrganizationalUnit -Name $item `
                             -Path "OU=Programmation,OU=Testeurs,$path" `
                             -Description "$item est sous l'OU Testeurs" `
                             -ProtectedFromAccidentalDeletion $false
                                                             
}

#Création des groupes dans l'AD

$groupes = "Programmation", "Developpeurs", "Integrateurs", "Designer", "Testeurs", "Gestionnaires", ".NET", "3D", "Jeux", "Outils"
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

#Script de création des groupes et des utilisateurs dans l'AD

$domaine = "DC=MiddleEarth,DC=PRO"

$utilisateurs = Import-Csv C:\PROG.csv -Delimiter ";" 

foreach ($item in $utilisateurs) {
	$Displayname = $item.Prenom + " "+ $item.Nom
    
	
$prenom = $item.Prenom
	$nom = $item.Nom
	$matricule = $item.Matricule
	$adresse = $item.Adresse
	$ville = $item.Ville
	$codePostal = $item.CodePostal
	$Tel1 = $item.Tel1
	$Tel2 = $item.Tel2
	$Tel3 = $item.Tel3

    #Write-Host $Displayname, $nom, $prenom, $matricule

	$OU = "OU=Programmation"
	$Description = "Le groupe utilisateurs est sous l'OU Programmation"
	$groupe = "Utilisateurs"
	$Password = "AAAaaa111"

	if ($matricule -ge 10000 -And $matricule -le 19999) {
		$Description = "Membre du groupe Developpeurs 3D";
		$OU = "OU=3D,OU=Developpeurs," + $OU
		$groupe = "gr3D"
		if ($matricule -eq 10000) {
			$Description = "Gestionnaire du groupe Developpeurs 3D";
		}
	}

	elseif ($matricule -ge 20000 -And $matricule -le 29999) {
		$Description = "Membre du groupe Developpeurs .Net";
		$OU = "OU=.Net,OU=Developpeurs," + $OU + $domaine
		$groupe = "gr.Net"
		 if ($matricule -eq 20000) {
			$Description = "Gestionnaire du groupe Developpeurs .Net";
		}
	}

	elseif ($matricule -ge 30000 -And $matricule -le 39999) {
		$Description = "Membre du groupe Integrateurs";
		$OU = "OU=Integrateurs," + $OU + $domaine
		$groupe = "grIntegrateurs"
		if ($matricule -eq 30000) {
			$Description = "Gestionnaire du groupe Integrateurs";
		}
	}
	elseif ($matricule -ge 40000 -And $matricule -le 49999) {
		$Description = "Membre du groupe Designers Web";
		$OU = "OU=Designers Web," + $OU + $domaine
		$groupe = "grDesigners"
		if ($matricule -eq 40000) {
			$Description = "Gestionnaire du groupe Designers Web";
		}
	}
	elseif ($matricule -ge 50000 -And $matricule -le 59999) {
		$Description = "Membre du groupe Testeurs d'Outils";
		$OU = "OU=Outils,OU=Testeurs," + $OU + $domaine
		$groupe = "grOutils"
		if ($matricule -eq 50000) {
			$Description = "Gestionnaire du groupe Testeurs d'Outils";
		}
	}
	elseif ($matricule -ge 60000 -And $matricule -le 69999) {
		$Description = "Membre du groupe Testeurs de Jeux";
		$OU = "OU=Jeux,OU=Testeurs," + $OU + $domaine
		$groupe = "grJeux"
		if ($matricule -eq 60000) {
			$Description = "Gestionnaire du groupe Testeurs de Jeux";
		}
	}

	New-ADUser -DisplayName $prenom `
		-Name $matricule `
		-GivenName $prenom `
		-Surname $nom `
		-Description $Description `
		-HomePhone $Tel1 `
		-StreetAddress $adresse `
		-City $City `
		-Country 124 `
		-PostalCode $codePostal `
		-otherAttributes @{'otherTelephone'= $tel2, $tel3 } `
		-AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) `
		-Enabled $true `
		-ChangePasswordAtLogon $false `
		–PasswordNeverExpires $true `
		-Path $OU + $domaine`


	# Ajouter utilisateurs dans le groupe utilisateurs
	Add-ADGroupMember "grUtilsateurs" $matricule

	# Ajouter utilisateurs dans son groupe de metier
	Add-ADGroupMember $groupe $matricule

	# Ajouter les gestionnaires dans le groupe gestionnaire
	if ($matricule -eq 10000 -OR $matricule -eq 20000 -OR $matricule -eq 30000 -OR $matricule -eq `
        40000 -OR $matricule -eq 50000 -OR $matricule -eq 60000) {
		$groupe = "grGestionnaires"
		Add-ADGroupMember $groupe $matricule
	}
	 
}


#Création des dossiers personnels et de profils

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