
$fileName = "C:\temp\AS2Outbound\P21WSTest\P21WSDEV_850.edi"

$Url = "http://p21wsdev.centralus.cloudapp.azure.com/api/DocumentActivity/ReceiveDocument/"

$Token ='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJzb2EiLCJhdWQiOiIiLCJQMjEuU2Vzc2lvbklkIjoiNTQwMGM4ODYtYmJlYy00NGZhLTg0ZjItNWZkOGMwNDU5N2JkIiwibmJmIjoxNTk3MjUxNTY0LCJleHAiOjE1OTczMzc5NjQsImlhdCI6MTU5NzI1MTU2NCwiaXNzIjoiUDIxLlNvYSJ9.V_ykB3f0b-4NnMBli5PqGOMADgZHg8a3IpDciZIJ1mM'

$fileContent = get-content $fileName
$fileContentBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)
$fileContentEncoded = [System.Convert]::ToBase64String($fileContentBytes)

$body = @{
    'TenantId' = 'blr-davinci.emea.epicor.net:3443'
    'FileName' = 'POTESTFILENAME.edi'
    'Content' = $fileContentEncoded
}

$Response = Invoke-WebRequest -Method 'Post' -Uri $url -Body  $body -Headers @{ 'Authorization' =  'Bearer ' + $Token}

Write-Output $Response.StatusCode
Write-Output $Response