# PhoneManagement
This little powershell application will help you manage your phones better with the help of adb (and scrcpy).

![screenshot](assets/menu.png)

Right now the script is able to:

 - **Connecting** (PMM can connect to all your devices over adb)
 - **srcpy** (PMM can use srcpy to view your devices screens)
 - **rebooting** (PMM can reboot all of the connected devices)
 - **Device info** (PMM can check device info like temperature and cpu speed)

 ### Windows
 Right now this script is designed for windows 10 and to be run with powershell

 ### Setup/configuration
 **Config file**  
 - Copy config.example.ini to config.ini and fill out the WorkDirectory setting
 - (example: WorkDirectory=C:\PhoneManagement)

 **Devices file**  
 - Copy devices.example.csv to devices.csv and fill out like below:
 ![screenshot](assets/devices.png)  
 **Please make sure the csv file uses "," as the delimiter.**  
 - (You can also change this when opening the file with a text editor.)