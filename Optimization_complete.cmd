@ECHO OFF 
:: This batch file details Windows 10, hardware, and networking configuration.
TITLE My System Info
ECHO Please wait... Checking system information.
:: Section 1: Windows 10 information
ECHO ==========================
ECHO WINDOWS INFO
ECHO ============================
systeminfo | findstr /c:"OS Name"
systeminfo | findstr /c:"OS Version"
systeminfo | findstr /c:"System Type"
:: Section 2: Hardware information.
ECHO ============================
ECHO HARDWARE INFO
ECHO ============================
systeminfo | findstr /c:"Total Physical Memory"
wmic cpu get name
wmic diskdrive get name,model,size
wmic path win32_videocontroller get name
:: Section 3: Networking information.
ECHO ============================
ECHO NETWORK INFO
ECHO ============================
ipconfig | findstr IPv4
ipconfig | findstr IPv6

ECHO ==========================
ECHO Deactivate Hibernation
ECHO ============================
powercfg /h /off

ECHO ==========================
ECHO Temp cleaning
ECHO ============================
cleanmgr /sageset:65535 & cleanmgr /sagerun:65535

ECHO ==========================
ECHO DISM cleaning
ECHO ============================
DISM.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase

ECHO ==========================
ECHO SHADOW COPIES cleaning
ECHO ============================
vssadmin delete shadows /for=c: /all /quiet

PAUSE