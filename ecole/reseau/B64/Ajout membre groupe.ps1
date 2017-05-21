$admin = (Get-ADPrincipalGroupMembership "Administrateur").name

(Get-ADUser -Identity "Administrateur" -Properties MemberOf).MemberOf

New-ADUser -Name B64MiniMoi -GivenName Mini -Path "OU=B64,DC=B64,DC=LOCAL" -Surname Moi

$groupe = (Get-ADPrincipalGroupMembership "Administrateur").name

foreach($item in $groupe)
{
    $utilisateur = "B64MiniMoi"
    Add-ADGroupMember -Identity $item -Members $utilisateur
}

get-adPrincipalGroupMembership B64BOIBE

Get-ADUser -Filter {memberOf ‑RecursiveMatch "CN=Admins du domaine,CN=Users,DC=B64,DC=LOCAL"} `
           -SearchBase "CN=B64BOIBE,OU=Directeurs,OU=Magasins,OU=B64,DC=B64,DC=LOCAL"

$group_info = (Get-ADGroup "Admins du domaine").DistinguishedName
$user_info  = (Get-ADUser B64BOIBE).DistinguishedName
Get-ADUser -Filter {memberOf -RecursiveMatch $group_info} -SearchBase $user_info

$group_info = (Get-ADGroup "Admins du domaine").DistinguishedName
Get-ADUser -LDAPFilter "(&(Name=B64BOIBE)(memberOf:1.2.840.113556.1.4.1941:=$group_info))"

#Ajouter une groupe enfant dans un groupe parent
$goupe_enfant = Get-ADGroup -Identity gTEST
$groupe_parent = Get-ADGroup -Identity "Admins du domaine"
Add-ADGroupMember $groupe_parent $groupe_enfant