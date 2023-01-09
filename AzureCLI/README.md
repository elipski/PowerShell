Easy way to quickly build a webapp in Azure in one command. Creates the resource group, and App Service Plan too. First git clone code into the directory and then then from the same directory run the az web up command. 

Bash
```bash
az webapp up --location eastus --name edQuickWebApp323 -html
```

Powershell
```powershell
New-AzWebApp -ResourceGroupName Default-Web-EastUS -Name "edQuickWebApp323" -Location "EastUS" -AppServicePlan "EdWebAppServicePlan"
```

Reference:
https://docs.microsoft.com/en-us/powershell/module/az.websites/new-azwebapp?view=azps-7.2.0