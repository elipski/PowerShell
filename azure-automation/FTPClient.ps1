$sourceuri = "ftp://13.86.112.65/TEST.XSL"
$targetpath = "\"
$username = "ftpuser2"
$password = "Ftphauser#2"

# Create a FTPWebRequest object to handle the connection to the ftp server
$ftprequest = [System.Net.FtpWebRequest]::create($sourceuri)

# set the request's network credentials for an authenticated connection
$ftprequest.Credentials =
    New-Object System.Net.NetworkCredential($username,$password)

$ftprequest.Method = [System.Net.WebRequestMethods+Ftp]::DownloadFile
$ftprequest.UseBinary = $true
$ftprequest.KeepAlive = $false
$ftprequest.EnableSsl = $true
$response=$null

# send the ftp request to the server
$ftpresponse = $ftprequest.GetResponse()

# get a download stream from the server response
$responsestream = $ftpresponse.GetResponseStream()

# create the target file on the local system and the download buffer
$targetfile = New-Object IO.FileStream ($targetpath,[IO.FileMode]::Create)
[byte[]]$readbuffer = New-Object byte[] 1024

# loop through the download stream and send the data to the target file
do{
    $readlength = $responsestream.Read($readbuffer,0,1024)
    $targetfile.Write($readbuffer,0,$readlength)
}
while ($readlength -ne 0)

$targetfile.close()