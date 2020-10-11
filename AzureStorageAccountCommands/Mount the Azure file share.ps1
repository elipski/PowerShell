#   This script sets up an Azure storage shared file into the local VM file system 
#
#   PowerShell script from Micorosoft documentaion:
#   https://docs.microsoft.com/en-us/azure/storage/files/storage-how-to-use-files-windows
#   https://docs.microsoft.com/en-us/powershell/azure/manage-subscriptions-azureps?view=azps-3.0.0

Test-NetConnection -ComputerName epicorxdxfilearchive.file.core.windows.net -Port 445

$resourceGroupName = "EpicorVAN"                            #"<your-resource-group-name>"
$storageAccountName = "epicorxdxfilearchive"                #"<your-storage-account-name>"
$fileShareName = "sharedfiles"                              #"<your-file-share-name>"
$subscription = "e5838590-1dc5-4a22-9fe7-1445301cd3f2"      #"<your-subscription>"

#Set subscription context
$context = Get-AzSubscription -SubscriptionId $subscription 
Set-AzContext $context

# These commands require you to be logged into your Azure account, run Login-AzAccount if you haven't
# already logged in.
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName
$storageAccountKeys = Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName
$fileShare = Get-AzStorageShare -Context $storageAccount.Context | Where-Object { 
    $_.Name -eq $fileShareName -and $_.IsSnapshot -eq $false
}

if ($fileShare -eq $null) {
    throw [System.Exception]::new("Azure file share not found")
}

# Save the password so the drive will persist on reboot
Invoke-Expression -Command "cmdkey /add:$([System.Uri]::new($storageAccount.Context.FileEndPoint).Host) /user:AZURE\$($storageAccount.StorageAccountName) /pass:$($storageAccountKeys[0].Value)"

# Mount the drive
$password = ConvertTo-SecureString -String $storageAccountKeys[0].Value -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential -ArgumentList "AZURE\$($storageAccount.StorageAccountName)", $password
New-PSDrive -Name Z -PSProvider FileSystem -Root "\\epicorxdxfilearchive.file.core.windows.net\sharedfiles" -Credential $credential -Persist