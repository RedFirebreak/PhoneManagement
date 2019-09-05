#Make sure nothing is connected to prevent errors
.\scrcpy\adb.exe disconnect
Start-Sleep -s 2

$devices = Import-Csv -Path ".\config\devices.csv"
foreach ($device in $devices ) {
    $Name = $device.('devicename')
    $IP = $device.('deviceip')
    $Port = $device.('deviceport')
    $deviceconnect = $IP + ':' + $Port

    Write-Output "* Connecting to $Name"
    .\scrcpy\adb.exe connect $deviceconnect
    Write-Output '*'
    # Do loopyloop
}
#Done with the loopyloop, inform user and exit:)

Write-Output "Done! Exiting."
Start-Sleep -s 10
Clear-Host