# Satellite-FUN
If you use this software , please check regularly back as I am constantly working on any bugs found/reported.

Please follow the link below for installation instructions and a basic user guide:

https://sv1cal.com/satellite-fun-software/

Notes:
1) The DJTSatLib.dll need to be registered first according to the instructions published above.
2) The dot is used as the decimal point symbol. 

Satellite FUN is a C# application which predicts satellite passes , tracks satellites, automatically starts RF recording (HDSDR/SatDump) and post-processing (SatDump). The goal is mainly unattended Weather/ Earth observation satellite reception on L and X band . It supports the SPID BIG RAS  including the HR version through the  Rot2Prog protocol and other rotators through HamLib.

Satellite FUN is just a hobby project written to suit my own needs for satellite tracking , especially on X band , where accurate antenna positioning is very important. If you find it useful, please send me a message and report bugs etc ! THANKS !!!

Satellite position calculation is done using David Taylor’s DJTSatLib.dll

Regarding antenna tracking, in  the Rot2Prog protocol case ,  it writes commands directly to its serial port , which allows for faster position update. This mode is what I use on X band , allowing position update every 0.5s.

HamLib tracking is somewhat slower, as by default position update interval is set to 3s (can be further reduced though). 
This may already be more than enough for many applications though.

![image](https://user-images.githubusercontent.com/3455238/178921593-386c7918-85a1-42e5-98ef-9ca265f7c88b.png)


Some other features have been added to aid Weather/Earth observation Satellite RX  and enable unattended pass-list tracking / recording/decoding:

- One can automatically launch HDSDR/SatDump with the proper settings per satellite.

- It programs the 54 MHz -13 GHz Kuhne MKU Local Oscillator.

- Antenna pointing offsets can be changed on the fly.

- There is a favorite satellite list with Satellite TX frequency,  Recording sampling rate etc

- Tracks the whole pass-list enabling automatic recording with HDSDR . 

- Automatically launches the appropriate SatDump demodulator/decoder and stores resulting files in a dedicated folder.

- Can reset Lime's driver or power-cycle it using the RTS signal of a COM port. This is useful when Lime occasionally hangs . With this feature it will be restarted just before the satellite becomes visible.

- Switches antenna polarization using the DTR signal of a COM port. This signal can go to a coaxial switch and select RHCP/LHCP.

I have included the Airspy ExtIO dll and 2 ExtIO dlls for the LimeSDR.The official one (ExtIO_LimeSDR_1.07.dll) supports sampling rates up to 30 MSPS.
Jean-Luc Milette  kindly granted permission to include his custom dll (ExtIO_LimeSDR_WxSats_to_share.dll )  which supports rates up to 60 MSPS.  
Many thanks Jean-Luc for providing these! These dlls should be pasted to the HDSDR folder .
