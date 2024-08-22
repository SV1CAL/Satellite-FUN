# Satellite-FUN
![image](https://github.com/SV1CAL/Satellite-FUN/assets/3455238/5a1d983a-11a6-43a7-a2b1-4dcf5e4b01c1)

VERSION 1v44:

Added register_DJTSatLib.ps1 and unregister_DJTSatLib.ps1 to easily install the DJTSatLib.dll.

Previous release info can be found in release_info.txt

INSTALLATION:

Unzip the downloaded folder to a location with read/write privileges. You must first register the dll ! If this not done, the program will not run!

Windows 7/8/10/11 users must be administrators to successfully register the dll.

- 64 bit : Right click on register_DJTSatLib.ps1 and run in powershell

- 32 bit : Right click on register_djtsatlib.bat and run as administrator

If the above does not work for some reason, follow the steps in README_to_install_DJTSatLib_dll.txt


NOTES:
- The dot is used as the decimal point symbol in config.txt and in the graphical interface.
- If you use this software, please check regularly back as I am constantly working on any bugs found/reported.


GETTING STARTED:

Satellite FUN is a hobby project written in C# which predicts satellite passes, tracks satellites, automatically starts RF recording (HDSDR/SatDump) , post-processing (SatDump) etc.
The main goal is unattended Weather/ Earth observation satellite reception on L,S and X band.
It supports the SPID Rot2Prog protocol including the HR version , HamLib and e-Callisto (X/Y).

In the link below you will find more instructions and a basic user guide. Please read it:

	https://sv1cal.com/satellite-fun-software/


![image](https://github.com/SV1CAL/Satellite-FUN/assets/3455238/75381b61-a813-4372-8a1b-3a755b82b32a)


Some features :
- Pass list takes into account Azimuth and Elevation tracking limits. E.g on my balcony I can only track eastern passes.

- One can automatically launch HDSDR/SatDump with the proper settings per satellite.

- It programs the 54 MHz -13 GHz Kuhne MKU Local Oscillator.

- Antenna pointing offsets can be changed on the fly.

- Time offsets in seconds/minutes can be changed on the fly (TLE tuning)

- There is a favorite satellite list with Satellite TX frequency,  Recording sampling rate etc

- Tracks the whole pass-list enabling automatic recording with HDSDR or SatDump . 

- Automatically launches the appropriate SatDump demodulator/decoder and stores resulting files/pictures in a dedicated folder.

- Can reset Lime's driver or power-cycle it using the RTS signal of a COM port. This is useful when Lime occasionally hangs . With this feature it will be restarted just before the satellite becomes visible.

- Switches antenna polarization using the DTR signal of a COM port. This signal can go to a coaxial switch and select RHCP/LHCP.


I have included the Airspy ExtIO dll and 2 ExtIO dlls for the LimeSDR.The official one (ExtIO_LimeSDR_1.07.dll) supports sampling rates up to 30 MSPS.
Jean-Luc Milette  kindly granted permission to include his custom dll (ExtIO_LimeSDR_WxSats_to_share.dll )  which supports rates up to 60 MSPS.  
Many thanks Jean-Luc for providing these! These dlls should be pasted to the HDSDR folder .
