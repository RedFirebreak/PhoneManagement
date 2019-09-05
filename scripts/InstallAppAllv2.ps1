$devices = Import-Csv -Path ".\config\devices.csv"
$scrcpyport = 27101
foreach ($device in $devices ) {
    $Name = $device.('devicename')
    $IP = $device.('deviceip')
    $Port = $device.('deviceport')
    $scrcpyport++

    $deviceconnect = $IP + ':' + $Port

    Write-Output "Restarting $Name ($deviceconnect)"
    .\scrcpy\adb.exe -s $deviceconnect install -r $h.Get_Item("AppInstall")
    Write-Output '*'

    #You may want to slow it down a bit if you are experiencing lag while starting the devices
    Start-Sleep -s 0.2
    # Do loopyloop
}
#Done with the loopyloop, inform user and exit:)
Start-Sleep -s 2
Clear-Host
Write-Output "Done! Exiting ConnectAll"