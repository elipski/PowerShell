#Login-AzureRmAccount

Get-AzureRmResourceProvider 

Get-AzureRmResourceProvider –ListAvailable | `
?{$_.ProviderNamespace -eq "Microsoft.BotService"} 

Register-AzureRmResourceProvider -ProviderNamespace 'Microsoft.BotService‘

Get-AzureRmResourceProvider –ListAvailable | `
?{$_.ProviderNamespace -eq "Microsoft.BotService"} 
