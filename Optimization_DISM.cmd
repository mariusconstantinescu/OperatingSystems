ECHO ==========================
ECHO Fast DISM optimization
ECHO ============================

DISM.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
vssadmin delete shadows /for=c: /all /quiet

PAUSE
