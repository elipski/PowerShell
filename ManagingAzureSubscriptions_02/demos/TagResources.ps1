#Login-AzureRmAccount

(Get-AzureRmResource -ResourceName "Ubuntu1" -ResourceGroupName "RG1").Tags

(Get-AzureRmResource -Tag @{Dept="IT"}).Name

Get-AzureRmResource -TagName Dept

#Get a reference to an Azure resource
$r = Get-AzureRmResource -ResourceName Ubuntu1 -ResourceGroupName RG1

#Retrieve existing resource tags, if any
$tags = (Get-AzureRmResource -Name Ubuntu1).Tags

#Add new tags to exiting tags
$tags += @{Dept="IT"; LifeCyclePhase="Testing"}

#Write new tags to an Azure resource
Set-AzureRmResource -ResourceId $r.Id -Tag $tags -Force

#Remove all tags
Set-AzureRmResource -Tag @{} -ResourceId $r.id -Force

#List tags and their number of occurences
Get-AzureRmTag