# Satellite-FUN
<img width="1939" height="1276" alt="image" src="https://github.com/user-attachments/assets/f6bcbb25-4242-47e1-8011-79c10f6e7c1a" />

VERSION 1v457
- Improved SatDump FTT adding averaging , zoom in etc
- Added channel_id and path_id parameter to favorites.txt . For example, channel_id 0 can be used for L band and channel_id 1 for X band. Similarly path_id selects LNAL,LNAH,LNAW in LimeSDR.
- Now different AZ/EL offsets can be entered per satellite in favorites.txt selecting between default_ant_offset and ant_offset1,2,3,4,5. Useful when there are multiple feeds in the focus
- Also different SDR gain per satellite can be defined in favorites.txt instead of having a commpon gain per SDR. 
- Bug fixes 


Previous release info can be found in release_info.txt

GETTING STARTED:

Satellite FUN is a hobby project written in C# which predicts satellite passes, tracks satellites, automatically starts RF recording (HDSDR/SatDump), post-processing (SatDump) etc.
Pictures and data are automatically stored in dedicated folders.
The main goal is unattended Weather/ Earth observation satellite reception on L,S and X band.


Some features :

- It supports the SPID Rot2Prog protocol (RAS/BIG-RAS standard resolution but also high resolution HR), other rotators through HamLib and e-Callisto in X/Y configuration.

- There is a favorite satellite list (favorites.txt) with Satellite TX frequency,  Recording sampling rate, polarization , postprocessing pipelines etc

- A passlist is calculated for the satellites in the list and the calculation takes into account number of days, min mid pass elevation but also Azimuth and Elevation tracking limits. E.g on my balcony I can only track eastern passes so I just enable tracking eastern passes within the specified AZ/EL limits.

- Tracks the whole pass-list enabling automatic recording (HDSDR/SatDump) and postprocessing (SatDump). Pictures and data are automatically stored in dedicated folders.

- In manual mode,one can automatically launch HDSDR/SatDump with the proper settings per satellite, program the Kuhne LO MKU (54-13000MHz),switch polarization .

- It also supports fixed LO downconverters and operation without a converter (just passing the frequency to the SDR)

- There is also a dsn_favorite.txt file where DSN objects ,frequency etc are stored. These objects can then be tracked automatically downloading position from Horizons. 

- AZ/EL can be calculated using RA/dec info. X/Y coordinates are calculated in the e-Callisto controller case and 2 DiseQc motors in X/Y config.

- SDRs currently supported are a subset of what is supported by SatDump: AIRSPY R2/Mini, LimeSDR, RTLSDR. Recently added Bladerf and SDRplay but these have not yet been tested.

- When SatDump is used for recording/live processing shows the FFT spectrum and statistics in a window. This is useful when e.g adjusting antenna pointing in real time.
 
- Antenna pointing offsets can be changed on the fly.

- Time offsets in seconds/minutes can be changed on the fly (look ahead TLE tuning).

- Can reset Lime's driver or power-cycle it using the RTS signal of a COM port. This is useful when Lime occasionally hangs . With this feature it will be restarted just before the satellite becomes visible.

- Switches antenna polarization using the DTR signal of a COM port. This signal can go to a coaxial switch and select RHCP/LHCP.

- Recording could be programmed to start when Elevation is above a defined limit.

- So far, in the LimeSDR and Airspy cases , a serial number can be passed to SatDump. This is useful when more than one SDR is connected to the PC e.g using one for DSN and the other one for WX sats etc.

- When tracking the pass list, between two passes parks the antenna to a predefined position. Antenna parks also on program exit.

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

In the link below you will find more instructions and a basic user guide. Please read it:

	https://sv1cal.com/satellite-fun-software/
	
Last but not least !

YOU NEED TO RUN SATELLITE FUN AS AN ADMINISTRATOR (right click and hit run as administrator)
