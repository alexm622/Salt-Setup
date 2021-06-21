./sudo.cmd Powershell -Command "Set-ExecutionPolicy RemoteSigned"
$path = "$(Get-Location)/install_salt.ps1"
$logpath = "$(Get-Location)/log.txt"
Write-Output $path
./sudo.cmd Powershell -File $path > $logpath
./sudo.cmd Powershell -Command "Set-ExecutionPolicy Restricted"
Get-Content $logpath
Remove-Item $logpath
Write-Output "Done!"
Pause
