# Satellite-FUN
VERSION 1v34:

- Added Park on Exit option

VERSION 1v33:

- Corrected IF frequency calculation in the FIXED LO case.

VERSION 1v32:

- Bug fix related to TRACK SAT button

VERSION 1v31:

- Added DSN / Horizons tracking
- Fixed a bug that was preventing favorites from getting printed in the pass list

INSTALLATION:

- Unzip the downloaded folder to a location with read/write privileges. Register the dll (see below) and then run the exe file.
- In the link below you can find more installation instructions and a basic user guide. Please read it:

	https://sv1cal.com/satellite-fun-software/

NOTES:

- The DJTSatLib.dll needs to be registered first (see below).
- The dot is used as the decimal point symbol.
- If you use this software, please check regularly back as I am constantly working on any bugs found/reported.


DLL installation:

Windows 7/8/10/11 users must be administrators to successfully register the dll.

- On 64 bit systems:

	First copy the DJTSatlib.dll to your Windows\SysWOW64 folder and 
	register the dll being in that folder. This can be done as follows :
	Open a cmd window as Administrator --> Start/All Programs/Accessories .
	Then Right click and Select “Run as Administrator”.
	Then change folder to Windows/SysWow64 by typing :

	cd C:\Windows\SysWOW64

	Now type:

	 regsvr32 DJTSatlib.dll


- On 32 bit systems:

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
	 


MORE INFO:

Satellite FUN is a hobby project written in C# which predicts satellite passes, tracks satellites, automatically starts RF recording (HDSDR/SatDump) , post-processing (SatDump) etc.
The main goal is unattended Weather/ Earth observation satellite reception on L,S and X band.

It supports the SPID Rot2Prog protocol including the HR version , HamLib and e-Callisto (X/Y).


![image](https://github.com/SV1CAL/Satellite-FUN/assets/3455238/75381b61-a813-4372-8a1b-3a755b82b32a)


Some features :

- One can automatically launch HDSDR/SatDump with the proper settings per satellite.

- It programs the 54 MHz -13 GHz Kuhne MKU Local Oscillator.

- Antenna pointing offsets can be changed on the fly.

- Time offsets in seconds/minutes can be changed on the fly (TLE tuning)

- There is a favorite satellite list with Satellite TX frequency,  Recording sampling rate etc

- Tracks the whole pass-list enabling automatic recording with HDSDR or SatDump . 

- Automatically launches the appropriate SatDump demodulator/decoder and stores resulting files in a dedicated folder.

- Can reset Lime's driver or power-cycle it using the RTS signal of a COM port. This is useful when Lime occasionally hangs . With this feature it will be restarted just before the satellite becomes visible.

- Switches antenna polarization using the DTR signal of a COM port. This signal can go to a coaxial switch and select RHCP/LHCP.



I have included the Airspy ExtIO dll and 2 ExtIO dlls for the LimeSDR.The official one (ExtIO_LimeSDR_1.07.dll) supports sampling rates up to 30 MSPS.
Jean-Luc Milette  kindly granted permission to include his custom dll (ExtIO_LimeSDR_WxSats_to_share.dll )  which supports rates up to 60 MSPS.  
Many thanks Jean-Luc for providing these! These dlls should be pasted to the HDSDR folder .
