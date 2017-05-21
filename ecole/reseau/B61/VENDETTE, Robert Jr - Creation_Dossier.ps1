#Robert Jr Vendette
#Le 17 novembre 2016
#Script Création des dossiers B61
#À exécuter sur le contrôleur de domaine

$dept = "WEBDEPTPRO", "WEBSECPRO", "FTPDEPTPRO", "FTPADPRO_BIDON"

foreach($item in $dept)
{
    New-item C:\_CEGAT_PRO\$item -ItemType directory
}

New-Item C:\_CEGAT_PERSO -ItemType directory

for($i = 0; $i -lt 10; $i++)
{
    New-Item C:\_CEGAT_PERSO\FTP0+$i -ItemType directory
}

New-Item C:\_CEGAT_PERSO\FTP10 -ItemType directory

New-SmbShare -Name PERSO$ `
             -Path C:\_CEGAT_PERSO `
             -FullAccess "Tout le monde"

