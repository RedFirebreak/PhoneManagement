Write-Output ''
Write-Output '-------------------------------------------------------'
Write-Output '--              Connecting to all phones             --'
Write-Output '-------------------------------------------------------'
Write-Output '--- Doing pre-check ---'

#----- WORKING DIRECTORY -----
$workdirectory = "D:\Stack\Rmdrenthe\0-Connect"

Set-Location $workdirectory

 ###
 ###    Start Config
 ###

Write-Output '* Loading configuration'
#---------- NAMES ----------
    $gl6 = 'Galaxy-S6'
    $gl6b = 'Galaxy-S6-Black'
    $a5b = 'Galaxy-A5-Black'
    $a5g = 'Galaxy-A5-Gold'
    $a5p = 'Galaxy-A5-Pink'
    $mm = 'Moto-Moto'
    $nt3 = 'Galaxy-Note 3'
    $s4l = 'Galaxy-S4'
    $tv1 = 'ATV-Box-1'
    $op2 = 'OnePlus2'
    $tv2 = 'ATV-Box-2'
    $px = 'Google-Pixel'
    $tv3 = 'ATV-Box-3'
# ---------- IP ----------
    $ipgl6 = '192.168.2.231'
    $ipgl6b = '192.168.2.232'
    $ipa5b = '192.168.2.233'
    $ipa5g = '192.168.2.234'
    $ipa5p = '192.168.2.235'

    $ipmm = '192.168.2.237'
    $ipnt3 = '192.168.2.238'

    $ips4l = '192.168.2.242'
    $iptv1 = '192.168.2.243'
    $ipop2 = '192.168.2.244'
    $iptv2 = '192.168.2.245'
    $ippx = '192.168.2.246'
    $iptv3 = '192.168.2.247'
#	Uses default adb port (5555
# ---------- IP ----------
 $adb = '5150'
 $adbdef = '5555'

Write-Output '* Configuration loaded'

Write-Output ''
Write-Output '--- Pre check complete. ---'

Clear-Host


 ###
 ###    End Config
 ###

Write-Output "* Connecting to $gl6"
Start-Process powershell ".\scrcpy.exe -b 4M -m1024 -s $ipgl6':'$adb --window-title $gl6 -p 27101"
Write-Output '*'
Start-Sleep -s 0.5

Write-Output "* Connecting to $gl6b"
Start-Process powershell ".\scrcpy.exe -b 4M -m1024 -s $ipgl6b':'$adb --window-title $gl6b -p 27102"
Write-Output '*'
Start-Sleep -s 0.5

Write-Output "* Connecting to $a5b"
Start-Process powershell ".\scrcpy.exe -b 4M -m1024 -s $ipa5b':'$adb --window-title $a5b -p 27103"
Write-Output '*'
Start-Sleep -s 0.5

Write-Output "* Connecting to $a5g"
Start-Process powershell ".\scrcpy.exe -b 4M -m1024 -s $ipa5g':'$adb --window-title $a5g -p 27104"
Write-Output '*'
Start-Sleep -s 0.5

Write-Output "* Connecting to $a5p"
Start-Process powershell ".\scrcpy.exe -b 4M -m1024 -s $ipa5p':'$adb --window-title $a5p -p 27105"
Write-Output '*'
Start-Sleep -s 0.5

Write-Output "* Connecting to $mm"
Start-Process powershell ".\scrcpy.exe -b 4M -m1024 -s $ipmm':'$adb --window-title $mm -p 27106"
Write-Output '*'
Start-Sleep -s 0.5

Write-Output "* Connecting to $nt3"
Start-Process powershell ".\scrcpy.exe -b 4M -m1024 -s $ipnt3':'$adb --window-title $nt3 -p 27107"
Write-Output '*'
Start-Sleep -s 0.5

Write-Output "* Connecting to $s4l"
Start-Process powershell ".\scrcpy.exe -b 4M -m1024 -s $ips4l':'$adb --window-title $s4l -p 27108"
Write-Output '*'
Start-Sleep -s 0.5

Write-Output "* Connecting to $tv1"
Start-Process powershell ".\scrcpy.exe -b 4M -m1024 -s $iptv1':'$adb --window-title $tv1 -p 27109"
Write-Output '*'
Start-Sleep -s 0.5

Write-Output "* Connecting to $op2"
Start-Process powershell ".\scrcpy.exe -b 4M -m1024 -s $ipop2':'$adb --window-title $op2 -p 27110"
Write-Output '*'
Start-Sleep -s 0.5

Write-Output "* Connecting to $tv2"
Start-Process powershell ".\scrcpy.exe -b 4M -m1024 -s $iptv2':'$adbdef --window-title $tv2 -p 27111"
Write-Output '*'
Start-Sleep -s 0.5

Write-Output "* Connecting to $px"
Start-Process powershell ".\scrcpy.exe -b 4M -m1024 -s $ippx':'$adb  --window-title $px -p 27112"
Write-Output '*'
Start-Sleep -s 0.5

Write-Output "* Connecting to $tv3"
Start-Process powershell ".\scrcpy.exe -b 4M -m1024 -s $iptv3':'$adbdef --window-title $tv3 -p 27113"
Write-Output '*'
Start-Sleep -s 0.5
