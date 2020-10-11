 $paths = @("C:\P21Mapper\MAPS", "C:\P21Mapper\P21FFSchemas", "C:\P21Mapper\P21ExportDirectory", "C:\P21Mapper\P21FlatFileIN", "C:\P21Mapper\Data", "C:\P21Mapper\MFT", "C:\P21Mapper\Trace","C:\temp")

 foreach ($path in $paths) {
    if (-Not (Test-Path -Path $path)) {
        Write-Host "   Creating directory:" $path -ForegroundColor DarkCyan
        $t=New-Item -ItemType directory -Path $path
    }
}

    Write-Output($t)

