    $devices = Import-Csv -Path ".\config\devices.csv"

    Write-Output "Please input the name of the device you want to use"
    Write-Output ""

    foreach ($device in $devices ) {
        $Name = $device.('devicename')
        $IP = $device.('deviceip')
        $Port = $device.('deviceport')

        $deviceconnect = $IP + ':' + $Port

        Write-Output "[DEVICE] $Name ($deviceconnect)"

        # Do loopyloop
    }

    #Get device name from user
    Write-Output ""
    $devicename = Read-Host 'Please specify devicename: '

    Clear-Host
    Write-Output "You selected [DEVICE] $devicename"
    Write-Output ""
    
    #open 
    $devicescsv = Import-Csv -Path ".\config\devices.csv"
    if ($devicescsv.Where({$PSItem.devicename -eq "$devicename"}).deviceip ){
        $specifiedIP = $devicescsv.Where({$PSItem.devicename -eq "$devicename"}).deviceip
        $specifiedPort = $devicescsv.Where({$PSItem.devicename -eq "$devicename"}).deviceport
        $specifieddeviceconnect = $specifiedIP + ':' + $specifiedPort

        function Show-Menu
        {
            Write-Host 'Connecting to Device'
            .\scrcpy\adb.exe connect $specifieddeviceconnect
            Clear-Host
            Write-Host "================ Phone Management Menu ================"
            Write-Output "[Connected!] Please select what you want to do with $devicename "
            Write-Host "1: Press '1' to view device screen using scrcpy"
            Write-Host "2: Press '2' to send a reboot signal"
            Write-Host "3: Press '3' to install"$h.Get_Item("AppInstall")
            Write-Host "4: Press '4' for info on device (Temp, CPU)"
            Write-Host " "
            Write-Host "Q: Press 'Q' to quit."
        }
        do
        {
            Show-Menu
            $input = Read-Host "Please make a selection"
            switch ($input)
            {
             '1' {
                    Clear-Host
                        Clear-Host
                        Write-Host 'Controlling Device'
                        Start-Process powershell ".\scrcpy\scrcpy-noconsole.exe -b 4M -m1024 -s $specifieddeviceconnect --window-title $devicename"
                        Write-Host 'Returning to device menu'
                        Start-Sleep -s 2
            } '2' {
                    Clear-Host
                        Write-Host 'Rebooting all connected devices'
                        .\scrcpy\adb.exe -s $specifieddeviceconnect reboot
                        Write-Host 'Returning to device menu'
                        Start-Sleep -s 2
            } '3' {
                    Clear-Host
                        Write-Host 'Installing' $h.Get_Item("AppInstall") 'all connected devices'
                        .\scrcpy\adb.exe -s $specifieddeviceconnect install -r $h.Get_Item("AppInstall")
                        Write-Host 'Returning to device menu'
                        Start-Sleep -s 2
            } '4' {
                    Clear-Host
                        Write-Host 'Checking temps on all connected devices'
                        Write-Output "CPU: ";.\scrcpy\adb.exe -s $specifieddeviceconnect shell "cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq"
                        Write-Output "TEMP: "; .\scrcpy\adb.exe -s $specifieddeviceconnect shell "cat /sys/devices/virtual/thermal/thermal_zone0/temp"
                        Write-Output ""
                        Write-Output ""
                        Write-Output "We are gonna pause here so you can check the temps"

                        Write-Output "Reminder: 384000 cpu = 384 Mhz"
                        Write-Output "Reminder: 38000 temp = 38 Degrees"
                    pause
            } 'q' {
            .\scrcpy\adb.exe disconnect
            return
            }
        }
        Start-Sleep -s 0.5
    }
    until ($input -eq 'q')
    } Else {
        Write-Host "Yikes! It looks like I can't find that device. Please try again"
        Pause
    }