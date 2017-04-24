###Version Richard Jean###

Clear-Host

#-------------------------------------------------------------------

# Fonction qui modifie les autorisations NTFS d'un dossier racine
function GRANT_NTFS ($racine)
{
  # "Désactiver l’héritage" et "Supprimer toutes les autorisations héritées de cet objet"
  icacls.exe $racine /inheritance:r
  
  # Ajout des autorisations NTFS
  icacls.exe $racine /grant "B61\TECH:(CI)(OI)(F)"
  icacls.exe $racine /grant "system:(CI)(OI)(F)"
  icacls.exe $racine /grant "administrateurs:(CI)(OI)(F)"
}

# Fonction qui crée un partage sur un dossier sur un ordinateur
function NEW_SHARE_COMPUTER ($partage, $dossier, $ordinateur)
{
 New-SMBShare -Name $partage `
              -Path "C:\_B61_$dossier" `
              -FullAccess "Tout le monde" `
              -CachingMode none `
              -CIMSession $ordinateur
}

#------------------------------------------------------
#------------------------------------------------------
#------------------------------------------------------
#
# Le serveur1 est le contrôleur de domaine
#
$ordi="B61HV1"
$chemin="\\" + $ordi + "\c$\_B61_"

# Supprime les anciens partages sur le serveur 1
Get-SmbShare -Name B61_* -CimSession $ordi | Remove-SmbShare -Force

# Supprime les anciens dossiers sur le serveur 1
Remove-Item -Path $chemin"*" -Force -Recurse

# Création des dossiers sur le serveur 1
$repertoires = "Clients", "Inventaire", "Publicite", `
               "Publicite\Clara", "Publicite\Paul", "Publicite\Pierre", "Web"

foreach ($repertoire in $repertoires)
{
  new-item -itemtype directory -path $chemin"$repertoire"  
}

# Modification des autorisations NTFS sur des dossiers sur le serveur 1
$repertoires = "Clients", "Inventaire", "Publicite", "Web"

foreach ($repertoire in $repertoires)
{
  GRANT_NTFS $chemin"$repertoire"
}

# Ajout des autorisations NTFS spéciales
  icacls.exe $chemin"Publicite" /grant "Directeurs:(RX)"

# Ajout des autorisations NTFS pour les utilisateurs
  icacls.exe $chemin"Publicite\Clara"  /grant "Clara:(CI)(OI)(M)"
  icacls.exe $chemin"Publicite\Paul"   /grant "Paul:(CI)(OI)(M)"
  icacls.exe $chemin"Publicite\Pierre" /grant "Pierre:(CI)(OI)(M)"

# Les nouveaux partages sur le serveur 1
$hash = @{"Clients" = "B61_Cli"; "Inventaire" = "B61_InvB"; `
          "Publicite" = "B61_Pub"; "Web" = "B61_WebB" }

foreach ($h in $hash.GetEnumerator())
{
 NEW_SHARE_COMPUTER $h.value $h.name $ordi
}

#-------------------------------------------------------------------
# Le "Serveur 2"
#
$ordi="B61HV2"
$chemin="\\" + $ordi + "\c$\_B61_"

# Supprime les anciens partages sur le "Serveur 2"
Get-SmbShare -Name B61_* -CimSession $ordi | Remove-SmbShare -Force

# Efface les vieux dossiers sur le "Serveur 2"
Remove-Item -Path $chemin"*" -Force -Recurse

# Création des dossiers sur le serveur 1
$repertoires = "Commande", "Inventaire", "Production", "Web"

foreach ($repertoire in $repertoires)
{
  new-item -itemtype directory -path $chemin"$repertoire"  
}

# Modification des autorisations NTFS sur des dossiers sur le serveur 2
foreach ($repertoire in $repertoires)
{
  GRANT_NTFS $chemin"$repertoire"
}


# Ajout des autorisations NTFS
  icacls.exe $chemin"Commande" /grant "Directeurs:(CI)(OI)(M)"

# Ajout des autorisations NTFS
  icacls.exe $chemin"Production" /grant "Pierre:(CI)(OI)(M)"

# Les nouveaux partages sur le serveur 1
$hash = @{"Commande" = "B61_CMD"; "Inventaire" = "B61_InvA"; `
          "Production" = "B61_Prod"; "Web" = "B61_WebA" }

foreach ($h in $hash.GetEnumerator())
{
 NEW_SHARE_COMPUTER $h.value $h.name $ordi
}
