#List local Administrators
Get-LocalGroupMember -Group "Administrators"

#List the AD Domian 
Get-ADDomain | Select-Object DistinguishedName, Name, Forest
 
#List AD built in Administrators
Get-ADGroupMember -Identity "Domain Admins" -Recursive | ForEach-Object{Get-ADUser -Identity $_.distinguishedName} | Select-Object DistinguishedName, Name

#List AD Enterprise Administrators
Get-ADGroupMember -Identity "Enterprise Admins" -Recursive | ForEach-Object{Get-ADUser -Identity $_.distinguishedName} | Select-Object DistinguishedName, Name