####################################################################
Installation is done as an administrator.
Copy the unzipped folder it to your C drive.
You first need to install and register the DJTSatlib.dll. 
Follow the instructions further down below.
Once the dll is installed, start the program, hit yes to the "Update keps" pop-up message, edit your lat/long etc. 
One can also edit the config.txt file directly.
For the new settings to take effect , it is best to save the config.txt file and then restart the program.

For HAMLIB use , you need to edit rotator.bat
For example , for my old Rot2Prog BIG RAS controller , I just have 2 lines.
rotctld -m 901 -r COM4 -s 600
PAUSE

For SPID BIG RAS HR (MD-02), just these 2 lines are needed after editing your com port and connection speed:
rotctld -m 903 -r COM4 -s 19200
PAUSE

The program does not automatically connect to your rotator. 
Connect to your rotator either directly using SPID_DIRECT or using HamLib (launching rotator.bat)
Then try to read back its position to see that it works.
You can use the GO TO AZ/EL buttons to check it goes where instructed.
To track a satellite , once it is visible , hit the auto-tracking button.



####################################################################
Follow the instructions below to install the DJTSatlib.dll.

On 64 bit systems:

First copy the DJTSatlib.dll to your Windows\SysWOW64 folder and 
register the dll being in that folder. This can be done as follows :
Open a cmd window as Administrator --> Start/All Programs/Accessories .
Then Right click and Select “Run as Administrator”.
Then change folder to Windows/SysWow64 by typing :

cd C:\Windows\SysWOW64

Now type:

 regsvr32 DJTSatlib.dll


On 32 bit systems:

Enter the unzipped folder and double-click on “install djtsatlib.bat”. 
This is only needed once, when the program is installed for the first time.
If this does not work try the following:
Copy/paste the dll into Windows/System32 folder and register the dll in there.
This can be done by first opening a cmd window   (Start/All Programs/Accessories). 
On W7 cmd must be opened as admin so Right click and Select “Run as Administrator”
In the cmd window that has just opened, change folder to Windows/System32 
by typing :

cd C:\Windows\System32

Now type:

 regsvr32 DJTSatlib.dll

Important Note:

Windows 7/8/10 users must be administrators to successfully register the dll.
####################################################################################