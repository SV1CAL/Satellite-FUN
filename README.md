# Satellite-FUN
<img width="1939" height="1276" alt="image" src="https://github.com/user-attachments/assets/f6bcbb25-4242-47e1-8011-79c10f6e7c1a" />

TO DO:
- Simplify layout, hide settings behind a tab etc

VERSION 1v470

- Antenna offsets are now active for on-the-fly changes in non-tracking mode as well e.g when pointing at a GEO satellite by pressing the button HIT TO GO to ...
- AZ_sat+az_offset  , EL_sat+el_offset --> Must be < AZ/EL limits . Up until now , large offsets would move dish beyond limits. Now offsets are taken into account.
- Drifting GEOs can now be automatically tracked adding them to the dsn_favorites.txt list. Line format is the same as in favorites.txt. Satellite Name is looked up in TLE folder specified 
and corresponding TLEs are passed to Horizons which returns AZ/EL in 1 min intervals.


VERSION 1v469

- Download keps in CSV format (see update_keps.ps1), convert to TLE internally. Fake NORAD number in new TLE file when > 69999.  Minimum download interval 2 hours.

VERSION 1v468

- Auto-decode bug fix when SatDump v2.0 is used

VERSION 1v467

- Now supporting SatDump v2.0 

  Added SATDUMP_ISVERSION2  parameter to config.txt

- If you use SatDump v2.0, you need to have the following in config.txt:

  SATDUMP_ISVERSION2 1

- If you use SatDump 1.2.2 , you need to have the following in config.txt:

  SATDUMP_ISVERSION2 0


VERSION 1v466

- To run version 1v466, just add the following lines to the end of your config.txt. No need to edit confit.txt from scratch.

  SdrplayIFGain 33
  
  SATDUMP_BASEBAND_FORMAT cs8




- Fixed bug where decoder was not correctly set in case there was only a single satellite in the passlist
- Fixed bug where lna_gain and if_gain were not correctly programmed in the SDRPLAY case. Now lna_gain is defined in the config.txt file as SdrplayGain and if_gain is defined as SdrplayIFGain.
In favorites.txt , this if_gain can also be separately defined per satellite. For lna_gain the global setting in config.txt is used for all satellites that use SDRPLAY SDR.
- Added SATDUMP_BASEBAND_FORMAT parameter to config.txt . By default this is set to cs8.




VERSION 1v464
- Fixed overtravel bug

VERSION 1v458
- Improved automatic post-processing recorded files. 
- Files recorded are stored in all_recorded_files.txt. 
- Files to be automatically processed are kept in pending_files.txt with all data needed. 
- Files done are stored in processed_files.txt
- Added Box where SatDump decoder output is shown. The same messages are also stored in SatDumpMessages.txt.
- Added option to turn antenna to AOS position two minutes before pass start.
- Bug fixes 


Previous release info can be found in release_info.txt

GETTING STARTED:

Satellite FUN is a hobby project written in C# which predicts satellite passes, tracks satellites, automatically starts RF recording (HDSDR/SatDump), post-processing (SatDump) etc.
Pictures and data are automatically stored in dedicated folders.
The main goal is unattended Weather/ Earth observation satellite reception on L,S and X band.


Some features :

- It supports the SPID Rot2Prog protocol (0.1/0.5/1 deg resolution), e-Callisto in X/Y configuration and other rotators through HamLib.

- Important Settings are saved to config.txt.

- There is a favorite satellite list stored in favorites.txt with Satellite TX frequency, sampling rate, polarization, decoder, SDR gain, antenna az/el offset, channel_id, path_id etc

- There is also a dsn_favorite.txt file where DSN objects ,frequency etc are stored. These objects can then be tracked automatically downloading position from Horizons. 

- A passlist is calculated for the satellites in the list and the calculation takes into account number of days, min mid pass elevation but also Azimuth and Elevation tracking limits. E.g on my balcony I can only track eastern passes so I just enable tracking eastern passes within the specified AZ/EL limits.

- Tracks the whole pass-list enabling automatic recording (HDSDR/SatDump) and postprocessing (SatDump). Pictures and data are automatically stored in dedicated folders.

- Antenna pointing offsets can be changed on the fly. Up to 6 different antenna offsets can be stored in case e.g multiple feeds are in the parabola focus at different offsets.

- Time offsets in seconds/minutes can be changed on the fly (look ahead TLE tuning).

- In manual mode, one can automatically launch HDSDR/SatDump with the proper settings per satellite, program the Kuhne LO MKU (54-13000MHz),switch polarization .

- It also supports fixed LO downconverters and operation without a converter (just passing the frequency to the SDR)

- AZ/EL can be calculated using RA/dec info. X/Y coordinates are calculated in the e-Callisto controller case and 2 DiseQc motors in X/Y config.

- SDRs currently supported are a subset of what is supported by SatDump: AIRSPY R2/Mini, LimeSDR, RTLSDR, Bladerf and SDRplay

- When SatDump is used for recording/live processing, it can show the FFT spectrum and statistics in a window. This is useful when e.g adjusting antenna pointing in real time.
 
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

- 64 bit : Right click on register_DJTSatLib.ps1 and then click on Run with PowerShell

- 32 bit : Right click on register_djtsatlib.bat and then click on Run as administrator

If the above does not work for some reason, follow the steps in README_to_install_DJTSatLib_dll.txt

NOTES:
- The dot is used as the decimal point symbol in config.txt and in the graphical interface.
- If you use this software, please check regularly back as I am constantly working on any bugs found/reported.

In the link below you will find more instructions and a basic user guide. Please read it:

	https://sv1cal.com/satellite-fun-software/
	
Last but not least !

YOU NEED TO RUN SATELLITE FUN AS AN ADMINISTRATOR (right click and hit run as administrator)
