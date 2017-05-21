# Robert Jr Vendette
# 17 Novembre 2016
# Script de créations des groupes et utilisateurs
# À Executer le contrôleur de domaine

$domaine = "DC=B64,DC=LOCAL"

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

	$OU = "OU=Programmation,DC=B64,DC=LOCAL"
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
		$OU = "OU=.Net,OU=Developpeurs," + $OU
		$groupe = "gr.Net"
		 if ($matricule -eq 20000) {
			$Description = "Gestionnaire du groupe Developpeurs .Net";
		}
	}

	elseif ($matricule -ge 30000 -And $matricule -le 39999) {
		$Description = "Membre du groupe Integrateurs";
		$OU = "OU=Integrateurs," + $OU
		$groupe = "grIntegrateurs"
		if ($matricule -eq 30000) {
			$Description = "Gestionnaire du groupe Integrateurs";
		}
	}
	elseif ($matricule -ge 40000 -And $matricule -le 49999) {
		$Description = "Membre du groupe Designers Web";
		$OU = "OU=Designers Web," + $OU
		$groupe = "grDesigners"
		if ($matricule -eq 40000) {
			$Description = "Gestionnaire du groupe Designers Web";
		}
	}
	elseif ($matricule -ge 50000 -And $matricule -le 59999) {
		$Description = "Membre du groupe Testeurs d'Outils";
		$OU = "OU=Outils,OU=Testeurs," + $OU
		$groupe = "grOutils"
		if ($matricule -eq 50000) {
			$Description = "Gestionnaire du groupe Testeurs d'Outils";
		}
	}
	elseif ($matricule -ge 60000 -And $matricule -le 69999) {
		$Description = "Membre du groupe Testeurs de Jeux";
		$OU = "OU=Jeux,OU=Testeurs," + $OU
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
		-Path $OU `


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
#>