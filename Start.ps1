#Doing checks:
     #Do some fancy coloring for dramatic effect
     $host.UI.RawUI.ForegroundColor = "DarkGreen"
     $host.UI.RawUI.BackgroundColor = "Black"

     # Starting the adb service if it isn't started yet
     .\scrcpy\adb.exe devices -l > $null
     # Checking how many devices are connected right now

     # Always start with a clean slate
     Clear-Host

     # Getting config file list
     Get-Content "./config/config.ini" | foreach-object -begin {$h=@{}} -process { $k = [regex]::split($_,'='); if(($k[0].CompareTo("") -ne 0)-and ($k[0].StartsWith("[") -ne $True)) { $h.Add($k[0], $k[1]) } }

     # Setting the work directory from config
     Set-Location $h.Get_Item("WorkDirectory")

# Start!
function Show-Menu
{
     $adbdevicescheck = .\scrcpy\adb.exe devices -l | find "device product" | measure-object -line | Select-Object -ExpandProperty Lines
     Clear-Host
     Write-Host "PMM -" $h.Get_Item("Version")
     Write-Host 'ALPHA STATE'
     Write-Host 'Config File:' $h.Get_Item("State")

     Write-Host "================ Phone Management Menu ================"
     Write-Host "Connected devices:"$adbdevicescheck
     Write-Host ""
    
     Write-Host "1: Press '1' for Connecting to all the devices "
     Write-Host "2: Press '2' for scrcpy on all devices"
     Write-Host "3: Press '3' for a reboot on all devices"
     Write-Host "4: Press '4' for install of"$h.Get_Item("AppInstall")"on all devices "
     Write-Host "5: Press '5' for info on all devices (Temp, CPU)"
     Write-Host "6: WIP WIP Press '6' individual management "

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
                    Write-Host 'Connecting to all the devices'
                    Write-Host ' '
                    Invoke-Expression './scripts/ConnectAllv2.ps1'
                    Write-Host ' '
                    Write-Host 'Done! Please check for any errors'
                    

           } '2' {
            Clear-Host
                    Clear-Host
                    Write-Host 'Controlling all connected devices'
                    Get-Location
                    Write-Host ' '
                    Invoke-Expression './scripts/ControlAllv2.ps1'
                    Write-Host ' '
                    Write-Host 'Done! Please check for any errors'
                    
           } '3' {
                    Clear-Host
                    Write-Host 'Rebooting all connected devices'
                    Write-Host ' '
                    Invoke-Expression './scripts/RestartAllv2.ps1'
                    Write-Host ' '
                    Write-Host 'Done! Please check for any errors'
               
           } '4' {
                    Clear-Host
                    Write-Host 'Installing' $h.Get_Item("AppInstall") 'all connected devices'
                    Write-Host ' '
                    Invoke-Expression './scripts/InstallAppAllv2.ps1'
                    Write-Host ' '
                    Write-Host 'Done! Please check for any errors'
           } '5' {
                    Clear-Host
                    Write-Host 'Checking temps on all connected devices'
                    Write-Host ' '
                    Invoke-Expression './scripts/TempsAllv2.ps1'
                    Write-Host ' '
                    Write-Host 'Done! Please check for any errors'
          
           } 'q' {
                return
           }
     }

     Start-Sleep -s 0.5

}
until ($input -eq 'q')