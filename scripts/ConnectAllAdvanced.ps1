$workdirectory = "D:\Stack\Rmdrenthe\0-Connect"
Set-Location $workdirectory

$devices = Import-Csv -Path "D:\Stack\Rmdrenthe\0-Connect\scripts\devices.csv"
foreach ($device in $devices ) {
    $Name = $device.(devicename)
    $IP = $device.(deviceip”)
    $Port = $device.(deviceport)
    $deviceconnect = $IP + ':' + $Port

    Write-Output $Name
    Write-Output $deviceconnect

    Start-Process powershell ".\scrcpy.exe -b 4M -m1024 -s $Name':'$deviceconnect --window-title $Name -p 27101"
    # Do loopyloop
}
#Done with the loopyloop, inform user and exit:)
Start-Sleep -s 2
Clear-Host
Write-Output "Done! Exiting ConnectAll"