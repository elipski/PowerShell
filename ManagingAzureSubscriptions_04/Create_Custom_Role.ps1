# Login-AzureRmAccount
# Get-AzureRmSubscription
 
$customrole = Get-AzureRmRoleDefinition "Virtual Machine Contributor"
$customrole.Id = $null
$customrole.Name = "Virtual Machine Starter"
$customrole.Description = "Provides the ability to start a virtual machine."
$customrole.Actions.Clear()
$customrole.Actions.Add("Microsoft.Storage/*/read")
$customrole.Actions.Add("Microsoft.Network/*/read")
$customrole.Actions.Add("Microsoft.Compute/*/read")
$customrole.Actions.Add("Microsoft.Compute/virtualMachines/start/action")
$customrole.Actions.Add("Microsoft.Authorization/*/read")
$customrole.Actions.Add("Microsoft.Resources/subscriptions/resourceGroups/read")
$customrole.Actions.Add("Microsoft.Insights/alertRules/*")
$customrole.AssignableScopes.Clear()
$customrole.AssignableScopes.Add("/subscriptions/048b82ac-4519-403b-ab05-6b4305502109")
 
New-AzureRmRoleDefinition -Role $customrole 
