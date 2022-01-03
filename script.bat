@echo off 
FOR /F "tokens=* USEBACKQ" %%F IN (`powershell get-date -format "{yyyy-mm-dd-HH-mm}"`) DO (
SET SUBFILENAME=%%F
)

echo %SUBFILENAME%

echo SpeedTestTest v0.0.1 by simonebortolin. Report was stored to file "report_%SUBFILENAME%.txt"

echo SpeedTestTest v0.0.1 by simonebortolin > report_%SUBFILENAME%.txt

echo Step 1/3 .

echo SpeedTest Best Server from Ookla >> report_%SUBFILENAME%.txt

speedtest --accept-gdpr >> report_%SUBFILENAME%.txt

echo Step 1/3 ..

echo SpeedTest EOLO (MI) >> report_%SUBFILENAME%.txt

speedtest -s 11427 >> report_%SUBFILENAME%.txt

echo Step 1/3 ...

echo SpeedTest Fastweb (MI) >> report_%SUBFILENAME%.txt

speedtest -s 7839 >> report_%SUBFILENAME%.txt

echo Step 2/3 .

echo MTR 8.8.8.8 >> report_%SUBFILENAME%.txt

tracert 8.8.8.8  >> report_%SUBFILENAME%.txt

echo Step 2/3 ..

echo MTR 1.1.1.1 >> report_%SUBFILENAME%.txt

tracert 1.1.1.1  >> report_%SUBFILENAME%.txt

echo Step 2/3 ...

echo MTR hetzner.de >> report_%SUBFILENAME%.txt

tracert hetzner.de  >> report_%SUBFILENAME%.txt

echo Step 3/3 .

echo PC INFO >> report_%SUBFILENAME%.txt

powershell "Get-WmiObject Win32_Processor"  >> report_%SUBFILENAME%.txt

powershell "Get-WmiObject Win32_ComputerSystem | Select TotalPhysicalMemory"  >> report_%SUBFILENAME%.txt

powershell "Get-WmiObject win32_physicalmemory | SELECT Manufacturer,Banklabel,Configuredclockspeed,Devicelocator,Capacity"  >> report_%SUBFILENAME%.txt

powershell "Get-NetAdapter | SELECT name, status, speed, linkspeed, fullduplex, InterfaceDescription"  >> report_%SUBFILENAME%.txt

echo Report was generate. Open the file "report_%SUBFILENAME%.txt", copy all text and share it on forum.fibra.click!  