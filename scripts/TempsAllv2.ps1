$devices = Import-Csv -Path ".\config\devices.csv"
$scrcpyport = 27101
foreach ($device in $devices ) {
    $Name = $device.('devicename')
    $IP = $device.('deviceip')
    $Port = $device.('deviceport')
    $scrcpyport++

    $deviceconnect = $IP + ':' + $Port

    Write-Output "[INFO] $Name ($deviceconnect)"
    Write-Output "CPU: ";.\scrcpy\adb.exe -s $deviceconnect shell "cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq"
    Write-Output "TEMP: "; .\scrcpy\adb.exe -s $deviceconnect shell "cat /sys/devices/virtual/thermal/thermal_zone0/temp"
    Write-Output '*'

    #You may want to slow it down a bit if you are experiencing lag while starting the devices
    Start-Sleep -s 0.2
    # Do loopyloop
}
#Done with the loopyloop, inform user and exit:)
Start-Sleep -s 2
Write-Output ""
Write-Output ""
Write-Output "We are gonna pause here so you can check all the temps"

Write-Output "Reminder: 384000 cpu = 384 Mhz"
Write-Output "Reminder: 38000 temp = 38 Degrees"

pause
Clear-Host
Write-Output "Done! Exiting ConnectAll"