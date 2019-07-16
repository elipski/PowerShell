#returns availability of storage account name
az storage account check-name -n "storage account name" -o json 

#Create storage account in Azure using resource group specified with the -g paragmeter
az storage account create -n "storage account name" -g "resouce group name" --kind StorageV2 -o json

#List storage accounts for given resouse group. Use query [].{} syntax to filter output to show only the storage account name
az storage account list -g "resource group name" -o json --query "[].{name: name}"

#to delele a storage account in azure
az storage account delete -g storage_course -n "storage account name"

#Shows all properties of a storage account
az storage account show -n "storage account name" -g "resource group name" -o json 

#show all properties of a storage account specified by the --query parameter
az storage account show -n storagecoursetest3 -g storage_course -o json --query "{name:name, accessTier:accessTier, enableHttpsTrafficOnly:enableHttpsTrafficOnly, tags:tags}"

#Update storage account attribiutes. This example updates the storage account access tier from Hot to Cool
az storage account update -n "storage account name" -g "resource group name" --access-tier Cool

#Update storage account attribiutes. This example updates the https access only to true
az storage account update -n "storage account name" -g "resource group name" --https-only true

#Update storage account attribiutes. This example adds two key/value pairs to the tags for this storage account
az storage account update -n "storage account name" -g "resource group name" --tags key1=value1 key2=value2

#Update storage account attribiutes. This example adds two keys to the tags for this storage account
az storage account update -n storagecoursetest3 -g storage_course --tags project1 TeamB