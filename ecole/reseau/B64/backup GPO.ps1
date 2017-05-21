﻿
Backup-GPO -name L8C -Path C:\temp\backup_gpo

[xml]$docXML = Get-Content C:\temp\backup_gpo\Manifest.xml
$ListeNoms=$xml_1.GetElementsByTagName("GPODisplayName")

foreach ($Nom in $ListeNoms)
{
  $Nom.InnerText
}

##Pour importer toutes les GPO du domaine
$FilePath = "C:\temp\backup_gpo\manifest.xml"
$ListeNoms=$xml_1.GetElementsByTagName("GPODisplayName")

foreach($nom in $ListeNoms)
{
    $nom = $nom.InnerText
    import-gpo -BackupGpoName $nom -TargetName $nom -path C:\temp\backup_gpo
}