New-Item -Path \\B64HV1\C$\_PERSO2\U2 -ItemType directory

New-SmbShare -Name Perso2$ `
             -Path C:\_Perso2 `
             -CachingMode None `
             -FolderEnumerationMode AccessBased `
             -FullAccess "Tout le monde" `
             -cimSession "B64HV1"


#Remove-Item -Path \\B64HV1\C$\_PERSO2\U2 -Force -Recurse


icacls.exe \\B64HV1\C$\_PERSO2\U2 /inheritance:r
icacls.exe \\B64HV1\C$\_PERSO2\U2 /grant "Administrateurs:(OI)(CI)(F)"
icacls.exe \\B64HV1\C$\_PERSO2\U2 /grant "B64\TECH:(OI)(CI)(F)"
icacls.exe \\B64HV1\C$\_PERSO2\U2 /grant "Système:(OI)(CI)(F)"
icacls.exe \\B64HV1\C$\_PERSO2\U2 /grant "B64\Utilisateurs du domaine:(M)"
icacls.exe \\B64HV1\C$\_PERSO2\U2 /grant "Createur proprietaire:(OI)(CI)(RX)"

set-Aduser -identity U2 -HomeDirectory "\\B64HV1\Perso2$\U2" -HomeDrive "J:"
