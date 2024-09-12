# Satellite-FUN
![image](https://github.com/SV1CAL/Satellite-FUN/assets/3455238/5a1d983a-11a6-43a7-a2b1-4dcf5e4b01c1)

VERSION 1v452
- Fixed SatDump FFT support.Latest SatDump v1.2.0 is now supported. Command line argument was changed from s8 to cs8 and this caused troubles. 

Previous release info can be found in release_info.txt

GETTING STARTED:

Satellite FUN is a hobby project written in C# which predicts satellite passes, tracks satellites, automatically starts RF recording (HDSDR/SatDump) , post-processing (SatDump) etc.
Pictures and data are automatically stored in dedicated folders.
The main goal is unattended Weather/ Earth observation satellite reception on L,S and X band.


Some features :

- It supports the SPID Rot2Prog protocol (RAS/BIGRAS standard resolution but also high resolution HR), other rotators through HamLib and e-Callisto in X/Y configuration.

- There is a favorite satellite list (favorites.txt) with Satellite TX frequency,  Recording sampling rate, polarization , postprocessing pipelines etc

- A passlist is calculated for the satellites in the list and the alculation takes into account Azimuth and Elevation tracking limits. 

E.g on my balcony I can only track eastern passes so I just enable tracking eastern passes within the specified AZ limits.

- Tracks the whole pass-list enabling automatic recording (HDSDR/SatDump) and postprocessing (SatDump). 

Pictures and data are automatically stored in dedicated folders.

- In manual mode , one can automatically launch HDSDR/SatDump or program the Kuhne LO MKU (54-13000MHz)  with the proper settings per satellite.

- It also supports fixed LO downconverters and operation without a converter (just passing the frequency to the SDR)

- SDRs currently supported are a subset of what is supported by SatDump: AIRSPY R2/Mini, LimeSDR, RTLSDR. Recently added Bladerf and SDRplay but these have not yet been tested.

- When SatDump is used for recording/live processing shows the FFT spectrum and statistics in a window. This is useful when e.g adjusting antenna pointing in real time.
 
- Antenna pointing offsets can be changed on the fly.

- Time offsets in seconds/minutes can be changed on the fly (look ahead TLE tuning).

- Can reset Lime's driver or power-cycle it using the RTS signal of a COM port. This is useful when Lime occasionally hangs . With this feature it will be restarted just before the satellite becomes visible.

- Switches antenna polarization using the DTR signal of a COM port. This signal can go to a coaxial switch and select RHCP/LHCP.

In the link below you will find more instructions and a basic user guide. Please read it:

	https://sv1cal.com/satellite-fun-software/


I have included the Airspy ExtIO dll, RTS SDR dll and 2 ExtIO dlls for the LimeSDR.The official one (ExtIO_LimeSDR_1.07.dll) supports sampling rates up to 30 MSPS.
Jean-Luc Milette kindly granted permission to include his custom dll (ExtIO_LimeSDR_WxSats_to_share.dll )  which supports rates up to 60 MSPS.  
Many thanks Jean-Luc for providing these! These dlls should be pasted to the HDSDR folder.


INSTALLATION INSTRUCTIONS:

Unzip the downloaded folder to a location with read/write privileges. You must first register the dll ! If this not done, the program will not run!

Windows 7/8/10/11 users must be administrators to successfully register the dll.

- 64 bit : Right click on register_DJTSatLib.ps1 and run in powershell

- 32 bit : Right click on register_djtsatlib.bat and run as administrator

If the above does not work for some reason, follow the steps in README_to_install_DJTSatLib_dll.txt


NOTES:
- The dot is used as the decimal point symbol in config.txt and in the graphical interface.
- If you use this software, please check regularly back as I am constantly working on any bugs found/reported.

