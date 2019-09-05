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
Write-Output '* Disconnecting all devices'

Write-Output ''
Write-Output '--- Pre check complete. ---'

 ###
 ###    End Config
 ###

.\adb.exe disconnect
Clear-Host

Write-Output "* Controlling $gl6"
.\adb.exe connect $ipgl6':'$adb
Write-Output '*'

Write-Output "* Controlling $gl6b"
.\adb.exe connect $ipgl6b':'$adb
Write-Output '*'

Write-Output "* Controlling $a5b"
.\adb.exe connect $ipa5b':'$adb
Write-Output '*'

Write-Output "* Controlling $a5g"
.\adb.exe connect $ipa5g':'$adb
Write-Output '*'

Write-Output "* Controlling $a5p"
.\adb.exe connect $ipa5p':'$adb
Write-Output '*'

Write-Output "* Controlling $mm"
.\adb.exe connect $ipmm':'$adb
Write-Output '*'

Write-Output "* Controlling $nt3"
.\adb.exe connect $ipnt3':'$adb
Write-Output '*'

Write-Output "* Controlling $s4l"
.\adb.exe connect $ips4l':'$adb
Write-Output '*'

Write-Output "* Controlling $tv1"
.\adb.exe connect $iptv1':'$adb
Write-Output '*'

Write-Output "* Controlling $op2"
.\adb.exe connect $ipop2':'$adb
Write-Output '*'

Write-Output "* Controlling $tv2"
.\adb.exe connect $iptv2':'$adbdef
Write-Output '*'

Write-Output "* Controlling $px"
.\adb.exe connect $ippx':'$adb 
Write-Output '*'

Write-Output "* Controlling $tv3"
.\adb.exe connect $iptv3':'$adbdef
Write-Output '*'

Write-Output "* End of ConnectAll.ps1"