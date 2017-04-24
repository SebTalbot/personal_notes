$fichier = Import-Csv "Y:\B64_UO.csv" -Delimiter ";"
$domaine = ",DC=B64,DC=LOCAL"

New-ADOrganizationalUnit -Name B64 -OtherAttributes @{c="CA";co="Canada";countryCode=124} -Path "DC=B64,DC=LOCAL"

foreach($ligne in $fichier)
{
    $nom = $ligne.aOu
    $path = $ligne.aParent + $domaine
    
    New-ADOrganizationalUnit -Name $nom `
							 -Path $path `
							 -Description $ligne.aDesc `
							 -ProtectedFromAccidentalDeletion $false
                             
    
    
    #write-host "***************" -ForegroundColor green
}

