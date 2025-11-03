# Satellite-FUN
<img width="1939" height="1276" alt="image" src="https://github.com/user-attachments/assets/f6bcbb25-4242-47e1-8011-79c10f6e7c1a" />

VERSION 1v457
- Improved SatDump FTT adding averaging , zoom-in etc
- Added SatDump's channel_id and path_id parameters to favorites.txt .In the BladeRF and LimeSDR cases, for example channel_id 0 could be used for L band and channel_id 1 for X band and so on. Similarly path_id selects LNAL,LNAH,LNAW in the LimeSDR case.
- Now different AZ/EL offsets can be entered per satellite in favorites.txt selecting between default_ant_offset and ant_offset1,2,3,4,5. Useful when there are multiple feeds in the focus. When adjusting AZ/EL offsets on the fly during a pass any changes will be saved to the corresponding offsets in config.txt
- Also besides the fixed gains per SDR used so far (as defined in config.txt) , now different SDR gain per satellite can also be defined in favorites.txt.
- Bug fixes 


Previous release info can be found in release_info.txt

GETTING STARTED:

Satellite FUN is a hobby project written in C# which predicts satellite passes, tracks satellites, automatically starts RF recording (HDSDR/SatDump), post-processing (SatDump) etc.
Pictures and data are automatically stored in dedicated folders.
The main goal is unattended Weather/ Earth observation satellite reception on L,S and X band.


Some features :

- It supports the SPID Rot2Prog protocol (RAS/BIG-RAS standard resolution but also high resolution HR), other rotators through HamLib and e-Callisto in X/Y configuration.

- There is a favorite satellite list (favorites.txt) with Satellite TX frequency,  Recording sampling rate, polarization , decoder, SDR gain, antenna az/el offset, channel_id, path_id etc

- A passlist is calculated for the satellites in the list and the calculation takes into account number of days, min mid pass elevation but also Azimuth and Elevation tracking limits. E.g on my balcony I can only track eastern passes so I just enable tracking eastern passes within the specified AZ/EL limits.

- Tracks the whole pass-list enabling automatic recording (HDSDR/SatDump) and postprocessing (SatDump). Pictures and data are automatically stored in dedicated folders.

- In manual mode,one can automatically launch HDSDR/SatDump with the proper settings per satellite, program the Kuhne LO MKU (54-13000MHz),switch polarization .

- It also supports fixed LO downconverters and operation without a converter (just passing the frequency to the SDR)

- There is also a dsn_favorite.txt file where DSN objects ,frequency etc are stored. These objects can then be tracked automatically downloading position from Horizons. 

- AZ/EL can be calculated using RA/dec info. X/Y coordinates are calculated in the e-Callisto controller case and 2 DiseQc motors in X/Y config.

- SDRs currently supported are a subset of what is supported by SatDump: AIRSPY R2/Mini, LimeSDR, RTLSDR. Recently added Bladerf and SDRplay

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


A typical config.txt file:
MyLat 37.9
MyLong 23.6
MyHeight 40
minAZ 0
maxAZ 360
minEL 10
maxEL 100
AZoffset 0.00
ELoffset 0.00
RefreshPosition_ms 100
SendPosition_ms_Hamlib 1500
SendPosition_ms_DirectCOM 500
MinTrackingStepDegrees 0.1
Controller_prog Rot2Prog_0.5_Deg
AntControllerComport COM6
ComKuhneLO COM3
HDSDR_PATH C:\Program Files (x86)\HDSDR
HAMLIB_BIN_PATH C:\Program Files\hamlib-w64-4.6.3\bin
MinRotatorStepDegrees 0.5
AntControllerComportBAUDRATE 600
MinMidPassEL 10
MaxMidPassEL 90
NumberOfDays 2
EastChecked 1
WestChecked 1
SDR_IF 1701.3
CCW_degrees 180
CW_degrees 180
AllowOverTravel 1
ApplyDoppler 1
LO_HIGH_SIDE 1
AZ_PARK_POSITION 25
EL_PARK_POSITION 90.5
RecordHDSDR 1
AutoLaunch_HDSDR_SATDUMP_Recorder 1
PrintDebugMessages 1
AutoLOprogramming 0
MIN_REC_ELEVATION 1
PlaySoundAOS 0
RECORDINGS_PATH C:\Recordings
AllowLimeReset 0
FIXED_LO_HZ 9600
LO_TYPE NO_CONVERTER
LimeDcSwith_Polarization_Comport COM3
FillPassListAtStartup 0
AllowLimePowerCycling 0
SATDUMP_RESULTS_PATH C:\Results
AutoLaunch_SATDUMP_Decoder 1
UpdateTLEs 0
SATDUMP_PATH_NEW C:\Program Files\SatDump\bin
LimeGain 48
AirspyGain 21
ParkOnExit 1
AIRSPY_SERIAL_NUMBER default
LIME_SERIAL_NUMBER default
AutoSwitchPolarization 0
ConnectAntenna 1
SATDUMP_FFT_SERVER_ON 1
SATDUMP_FFT_SERVER_IP 127.0.0.1/api
TLE_TIME_OFFSET_MINS 0
TLE_TIME_OFFSET_SECS 1
ParkBetweenPasses 1
BladeRFGain 12
RtlsdrGain 14
SdrplayGain 15
Ant_offset1_az 0.00
Ant_offset1_el 0.00
Ant_offset2_az 0.00
Ant_offset2_el 0.00
Ant_offset3_az 0.00
Ant_offset3_el 0.00
Ant_offset4_az 0.00
Ant_offset4_el 0.00
Ant_offset5_az 0.00
Ant_offset5_el 0.00

A typical favorites.txt file:
Comma separated settings per satellite.
Each satellites needs 19 comma-separated settings.
This file is normally created by hitting the "Add Selected to favorites.txt" button but can also be manually edited.

#########################################################################################
Below is each item explained:
1. Satellite Name: must be exactly as in keplerian elements file

2. Folder under /Keps where TLEs for the satellite above are stored [active|amateur|geo|noaa|satnogs|visual|weather]

3. SAT_freq, Satellite Downlink Frequency in MHz (not including Doppler shift)

4. Recording Rate in MSPS , must be supported by HDSDR ExtIO dll or SATDUMP

5. SDR/HDSDR/SATDUMP/LIVE or REC combination :[AIRSPY_HDSDR_REC|LIME_HDSDR_REC|LIME_JL_HDSDR_REC|AIRSPY_SATDUMP_LIVE|LIME_SATDUMP_LIVE|AIRSPY_SATDUMP_REC|LIME_SATDUMP_REC| etc]

6. IF_Freq: HSDR/SATDUMP tuning frequency. Is only used when KUHNE_MKU Local oscillator is used . Then if LOSide (see below) is High_Side, then KUHNE_MKU LO will be at  SAT_TX_FREQ+IF_freq otherwise it will be at SAT_freq-IF_freq

7. Polarization: [LHCP|RHCP] . Polarization can be switched with a serial port.

8. LOType:[KUHNE_MKU|FIXED|NO_CONVERTER] . If KUHNE_MKU selected , LO will be programmed over serial port. If FIXED is selected , LO frequency below is used. If NO_CONVERTER is used the SDR

9. FIXEDLO [e.g Converter LO frequency 1200.1 in MHz, only used for IF/HDSDR tuning frequency calculation.

10. LOSide:[High_Side|Low_Side] . This affects Doppler sign / KUHNE LO tuning / HDSDR tuning in FIXED mode .

11. SatDump's Decoder name ,e.g noaa_hrpt or metop_ahrpt etc. See file available_decoders.txt

12. SatDump's DC block parameter: [0:1] . If 0 , digital DC notch is not engaged.

13. SatDump's I/Q swap paramter: [0:1] . If 0, I/Q are not swapped.

14. SatDump's decimation parameter: [1 up 100] 

15. SatDump's channel_id parameter: [0:1] . Used to select active channel e.g on LimeSDR or BladeRF. Channel_id 0 can be used for L band , Channel_id 1  for X band satellites etc

16. SatDump's path_id paramter: [0:1:2:3] . Used to select active path, e.g on LimeSDR path_id 3 selects the LNAW input

17. Antenna AZ/EL offset set. [default_ant_offset | ant_offset2 | ant_offset3 | ant_offset4 | ant_offset5 | ant_offset6] . When there are multiple feeds in the focus, different offsets can be used per band See also config.txt where theser are stored.

18. SatDump SDR gain parameter  :[default_gain | or e.g 12 ] If default_gain is entered gains per SDR as defined in config.txt are used. Otherwise type the gain in dB to be s

19. PASSLIST: [0:1] 0 means satellite will not appear in PassList. So you don't have to delete it from this file, but it will not show up.


ISS (ZARYA),active,2395,10,LIME_SATDUMP_REC,1701.3,RHCP,NO_CONVERTER,9600,High_Side,none,1,0,1,0,3,default_ant_offset,default_gain,0
METOP-B,weather,1701.3,6,LIME_SATDUMP_LIVE,1701.3,RHCP,NO_CONVERTER,9600,High_Side,metop_ahrpt,1,0,1,0,3,default_ant_offset,default_gain,1
METOP-C,weather,1701.3,6,LIME_SATDUMP_LIVE,1701.3,RHCP,NO_CONVERTER,9600,High_Side,metop_ahrpt,1,0,1,0,3,default_ant_offset,default_gain,1
METEOR-M2 3,weather,1700.0,6,LIME_SATDUMP_LIVE,1700.0,RHCP,NO_CONVERTER,9600,High_Side,meteor_hrpt,1,0,1,0,3,default_ant_offset,default_gain,1
METEOR-M2 4,weather,1700.0,6,LIME_SATDUMP_LIVE,1700.0,RHCP,NO_CONVERTER,9600,High_Side,meteor_hrpt,1,0,1,0,3,default_ant_offset,default_gain,1
