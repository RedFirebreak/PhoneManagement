# PhoneManagement
This little powershell application will help you manage your phones better with the help of adb (and scrcpy).

![screenshot](assets/menu.png)

Right now the script is able to:

 - **Connecting** (PMM can connect to all your devices over adb)
 - **srcpy** (PMM can use srcpy to view your devices screens)
 - **rebooting** (PMM can reboot all of the connected devices)
 - **Device info** (PMM can check device info like temperature and cpu speed)

 ### Windows
 Right now this script is designed for windows 10 and to be run with powershell.

 ### Setup/configuration
 **1. Config file**  
 - Copy config.example.ini to config.ini and fill out the WorkDirectory setting.
 - (example: WorkDirectory=C:\PhoneManagement)

 **2. Devices file**  
 - Copy devices.example.csv to devices.csv and fill out like below:
 ![screenshot](assets/devices.png)  
 **Please make sure the csv file uses "," as the delimiter.**  
 - (You can also change this when opening the file with a text editor.)  

  **3. Scrcpy**  
    We recommend scrcpy for adb and opening the phone's screen.  
    - You can download the files [here](https://github.com/Genymobile/scrcpy)  
    Make sure to download the windows zip files and put them in the scrcpy folder.  
    **Adb and scrcpy** should be accessable from:
    ```
    \PhoneManagement\scrcpy\adb.exe
    ```

**4. Making a shortcut to start the script from anywhere (Optional)**  
Windows:
  - Right click where you want your shortcut.
  - Go to new -> Shortcut.
  - In the shortcut target box, paste and edit both the paths to your file locations: 
  ```bash
    powershell.exe -noexit -ExecutionPolicy Bypass -File "c:\path\PhoneManagement\Start.ps1"
  ```
  - Name the shortcut. **we are not done!**
  - Right click the shortcut you just made.
  - Properties.
  - Find "start in", empty the line and fill in the path of PMM:
  ```bash
  "c:\path\PhoneManagement\"
  ```
  - Hit apply and close the box.
  - Now we're done! Enjoy your easy shortcut from anywhere.

# Using PMM

Here's a small instruction manual for using PMM  

**1. Connecing all the devices**
Before you can start managing your devices, you need to connect to your devices first. If you filled out the config and devices files correctly, you can use the first option in PMM to connect to all of your devices.  
**2. Using scrcpy to view screens**  
scrcpy is used for viewing your devices screens, if you downloaded scrcpy and put it in the right place, you will be able to view all of your connected screens.  
**WARNING:** This will open a flood of powershell windows, especially with many devices this can lag your computer for a bit.  
**3. Rebooting all of your devices**  
Usefull. After connecting will go by each device and send a reboot signal.  
**4. Installing an app**  
This one is usefull for pushing a new app to all devices. To push an app:
 - Download the apk from the app and place it in the ``\PhoneManagement`` directory
 - Go to your config.ini and fill in only exact name of the apk (including .apk)
 - Start PMM, now you can use the install app setting  
**5. Getting info of all devices**  
Handy for checking temperature and cpu speed.  

