Installation is done as an administrator.
Copy the unzipped folder to your C drive.
You first need to install and register the DJTSatlib.dll. 
Follow the instructions further down below.
Once the dll is installed, run the program as an ADMINISTRATOR, hit yes to the "Update keps" pop-up message, edit your lat/long etc. 
One can also edit the config.txt file directly.
For the new settings to take effect , it is best to save the config.txt file and then restart the program.


Rot2Prog SPID:

	Depending on your SPID rotator RAS / BIG-RAS  / BIG-RAS HR , select in the GUI from the pop down list
	Rot2Prog_1.0_Deg  /  Rot2Prog_0.5_Deg /Rot2Prog_0.1_Deg  respectively
	Edit COM PORT (e.g COM4) and BAUD Rate (e.g 600) in the GUI or in config.txt
	Click "Connect".
	Note: I have only tested BIG-RAS and BIG-RAS HR and they both work OK.
	######################################################

HAMLIB:
	You first need to edit your HAMLIB_BIN_PATH  in config.txt .
	Then you also need to edit the rotator.bat file.
	For example , for my old Rot2Prog BIG RAS controller , I just have 2 lines:

	rotctld -m 901 -r COM4 -s 600
	PAUSE

	For SPID BIG RAS HR (MD-02):
	rotctld -m 903 -r COM4 -s 19200
	PAUSE

	Once the above are correct and match corresponding settings on the controller, 
	click "Run rotator.bat" and it should open a command window. Check for any error messages.

	#####################################################################
	
	
The program does not automatically connect to your rotator. 
After connecting , try to read back antenna position to see that it works.
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