$command = "./programs/Salt-Installer.exe /S /minion-name=? /master=salt.remi-it.com"

$serialnumber = $(wmic.exe bios get serialnumber) 
#$serialnumber = "$(Get-Content ./extras/wmic.txt)"
$serialnumber = $serialnumber -replace "SerialNumber"
$serialnumber = $serialnumber.TrimStart() 
Write-Output $serialnumber > log.txt
$serialnumber = "remi-$serialnumber"
$serialnumber = $serialnumber.Trim()

$command = $command -replace "\?","$serialnumber" -replace "  "

Write-Output $command >> log.txt

Invoke-Expression $command
