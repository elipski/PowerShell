$resourceGroupName = "EdVSPResourceGroup"
$storageAccountName = "edvspresourcegroupdiag"


$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName 

Test-NetConnection -ComputerName ([System.Uri]::new($storageAccount.Context.FileEndPoint).Host) -Port 445