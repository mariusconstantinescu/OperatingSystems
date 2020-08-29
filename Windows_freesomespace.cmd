powercfg.exe /hibernate off
%SystemRoot%\System32\Cmd.exe /c Cleanmgr /sageset:65535 & Cleanmgr /sagerun:65535
DISM.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
vssadmin delete shadows /for=c: /all /quiet
