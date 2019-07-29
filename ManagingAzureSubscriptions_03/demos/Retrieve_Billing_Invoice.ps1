#Login-AzureRmAccount

$inv=Get-AzureRmBillingInvoice -Latest
Invoke-WebRequest -Uri $inv.downloadurl -outfile ('c:\billing\' + $inv.name + '.pdf')