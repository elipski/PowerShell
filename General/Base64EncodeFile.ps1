

$fileName = "C:\temp\AS2Outbound\P21WSTest\P21WSDEV_850.edi"
$fileContent = get-content $fileName
$fileContentBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)
$fileContentEncoded = [System.Convert]::ToBase64String($fileContentBytes)


Write-Output $fileContentEncoded
Out-File -FilePath "C:\temp\AS2Outbound\P21WSTest\P21WSDEV_850.txt" -InputObject $fileContentEncoded -Encoding ASCII