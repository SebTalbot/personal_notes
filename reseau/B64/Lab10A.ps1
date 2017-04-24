###Version Richard Jean###

Clear-Host

#-------------------------------------------------------------------

# Fonction qui modifie les autorisations NTFS d'un dossier racine
function GRANT_NTFS ($racine)
{
  # "Désactiver l’héritage" et "Supprimer toutes les autorisations héritées de cet objet"
  icacls.exe $racine /inheritance:r
  
  # Ajout des autorisations NTFS
  icacls.exe $racine /grant "B64\TECH:(CI)(OI)(F)"
  icacls.exe $racine /grant "system:(CI)(OI)(F)"
  icacls.exe $racine /grant "administrateurs:(CI)(OI)(F)"
}

# Fonction qui crée un partage sur un dossier sur un ordinateur
function NEW_SHARE_COMPUTER ($partage, $dossier, $ordinateur)
{
 New-SMBShare -Name $partage `
              -Path "C:\_B64_$dossier" `
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
$ordi="B64HV1"
$chemin="\\" + $ordi + "\c$\_B64_"

# Supprime les anciens partages sur le serveur 1
Get-SmbShare -Name B64_* -CimSession $ordi | Remove-SmbShare -Force

# Supprime les anciens dossiers sur le serveur 1
Remove-Item -Path $chemin"*" -Force -Recurse

# Création des dossiers sur le serveur 1
$repertoires = "Clients", "Inventaire", "Publicite", `
               "Publicite\B64BOIBE", "Publicite\B64CHECA", "Publicite\B64CHRDO","Publicite\B64CUEEM"

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
  icacls.exe $chemin"Publicite\B64BOIBE"  /grant "B64BOIBE:(CI)(OI)(M)"
  icacls.exe $chemin"Publicite\B64CHECA"   /grant "B64CHECA:(CI)(OI)(M)"
  icacls.exe $chemin"Publicite\B64CHRDO" /grant "B64CHRDO:(CI)(OI)(M)"
  icacls.exe $chemin"Publicite\B64CUEEM" /grant "B64CUEEM:(CI)(OI)(M)"

# Les nouveaux partages sur le serveur 1
$hash = @{"Clients" = "B64_Cli"; "Inventaire" = "B64_InvB"; `
          "Publicite" = "B64_Pub"}

foreach ($h in $hash.GetEnumerator())
{
 NEW_SHARE_COMPUTER $h.value $h.name $ordi
}

#-------------------------------------------------------------------
# Le "Serveur 2"
#
$ordi="B64HV2"
$chemin="\\" + $ordi + "\c$\_B64_"

# Supprime les anciens partages sur le "Serveur 2"
Get-SmbShare -Name B64_* -CimSession $ordi | Remove-SmbShare -Force

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
  #icacls.exe $chemin"Production" /grant "Pierre:(CI)(OI)(M)"

# Les nouveaux partages sur le serveur 1
$hash = @{"Commande" = "B64_CMD"; "Inventaire" = "B64_InvA"; `
          "Production" = "B64_Prod"; "Web" = "B64_WebA" }

foreach ($h in $hash.GetEnumerator())
{
 NEW_SHARE_COMPUTER $h.value $h.name $ordi
}
