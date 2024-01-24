First install the DJTSatlib.dll!
If this is not done, Satellite Fun will not run !

64 bit : Right click on register_DJTSatLib.ps1 and run in powershell

32 bit : Right click on register_djtsatlib.bat and run as administrator


If the above does not work for some reason:

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
This can be done by first opening a cmd window (Start/All Programs/Accessories).
On W7 cmd must be opened as admin so Right click and Select “Run as Administrator”
In the cmd window that has just opened, change folder to Windows/System32
by typing :

cd C:\Windows\System32

Now type:

regsvr32 DJTSatlib.dll

Important Note:

Windows 7/8/10 users must be administrators to successfully register the dll.