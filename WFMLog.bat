@echo off

if not exist .\Logs (

    mkdir .\Logs
)

if /i "%1"=="stop" (

    goto :Stop 
)

if /i "%1"=="start" (

    goto :StartClean
)


exit /b 0

:Stop

ECHO Please wait...

WMIC /OUTPUT:.\logs\ProcessListE.txt PROCESS get Caption,Commandline,Processid

logman stop ServiceBusClientTracing -ets > NUL:

logman stop ServiceBusTracing -ets > NUL:

logman stop WorkflowTracing -ets > NUL:

logman stop WindowsFabric -ets > NUL:

logman stop WindowsFabricLease -ets > NUL:

wevtutil epl Application .\logs\application.evtx

wevtutil epl System .\logs\system.evtx

wevtutil epl Security .\logs\security.evtx

del temp.ps1


IF NOT EXIST "C:\Program files\Common Files\Microsoft Shared\Web Server Extensions\15\LOGS\" GOTO END

FOR /F %%i IN ('dir /b /a-d-h /o-d "C:\Program files\Common Files\Microsoft Shared\Web Server Extensions\15\LOGS" ') DO (

     SET a=%%i
     goto :COPY
)

:COPY

SET b="C:\Program files\Common Files\Microsoft Shared\Web Server Extensions\15\LOGS\"

SET file=%b%%a%

Copy %file% .\Logs\ > nul 2>&1

:END

ECHO The command completed successfully.

exit /b 0

:StartClean

ECHO Please wait...need couple minutes...

del /F /S /Q .\Logs\*.* > NUL:

logman stop ServiceBusClientTracing -ets > NUL:

logman stop ServiceBusETWTracing -ets > NUL:

logman stop WorkflowETWTracing -ets > NUL:

logman stop WindowsFabric -ets > NUL:

logman stop WindowsFabricLease -ets > NUL:

echo $ErrorActionPreference="SilentlyContinue" >temp.ps1

echo Import-Module WorkflowManager >>temp.ps1


echo Stop-Transcript ^| out-null >>temp.ps1

echo Start-Transcript -path .\LOGS\FARM.txt -append >>temp.ps1

echo Write-Output "#Get-WFFarm"  >>temp.ps1

echo Get-WFFarm >>temp.ps1

echo Write-Output "#Get-WFFarmStatus"  >>temp.ps1

echo Get-WFFarmStatus >>temp.ps1

echo Write-Output "#Get-SBFarm"  >>temp.ps1

echo Get-SBFarm >>temp.ps1

echo Write-Output "#Get-SBFarmStatus"  >>temp.ps1

echo Get-SBFarmStatus >>temp.ps1

echo Write-Output "#Get-SBNamespace"  >>temp.ps1

echo Get-SBNamespace >>temp.ps1

echo Write-Output "#Get-SBClientConfiguration"  >>temp.ps1

echo Get-SBClientConfiguration >>temp.ps1

echo $ErrorActionPreference = "Continue"  >>temp.ps1

echo Stop-Transcript >>temp.ps1

REM cscript //nologo productlist.vbs > .\logs\productlist.txt

wmic /OUTPUT:.\logs\productlist.txt product get Description,Version,InstallDate

wmic /OUTPUT:.\logs\hotfixlist.txt qfe get Caption,HotFixID,Description,InstalledOn

WMIC /OUTPUT:.\logs\ProcessListS.txt PROCESS get Caption,Commandline,Processid

netstat -aob > .\logs\netstat.txt 2> nul

powershell -noninteractive -executionpolicy bypass -File .\temp.ps1

REM logman start ServiceBusClientTracing -p "Microsoft-ServiceBus-Client" 0xFF0000000000 0x4 -nb 256 1024 -bs 512 -ets -ct perf -f bincirc -max 1000 -o .\Logs\ServiceBusClientTrace.etl

logman start ServiceBusClientTracing -p {a307c7a2-a4cd-4d22-8093-94db72934152} -bs 64 -nb 120 320 -ets -ct perf -f bincirc -max 1000 -o .\Logs\ServiceBusClientTrace.etl

REM logman start ServiceBusTracing -p "Microsoft-ServiceBus" 0xFF0000000000 0x4 -nb 256 1024 -bs 512 -ets -ct perf -f bincirc -max 1000 -o .\Logs\ServiceBusTrace.etl

logman start ServiceBusTracing -p {3d05219e-3959-41c4-a2a7-ea6ca5b5c257} -bs 64 -nb 120 320 -ets -ct perf -f bincirc -max 1000 -o .\Logs\ServiceBusTrace.etl

logman start WorkflowTracing -p {B2885F6E-231C-43FF-BBEA-7516148FF6FE} -bs 64 -nb 120 320 -ets -ct perf -f bincirc -max 1000 -o .\Logs\WorkflowTrace.etl

logman start WindowsFabric -p {CBD93BC2-71E5-4566-B3A7-595D8EECA6E8} -bs 64 -nb 120 320 -ets -ct perf -f bincirc -max 1000 -o .\Logs\WindowsFabric.etl

logman start WindowsFabricLease -p {3F68B79E-A1CF-4B10-8CFD-3DFE322F07CB} -bs 64 -nb 120 320 -ets -ct perf -f bincirc -max 1000 -o .\Logs\WindowsFabricLease.etl

exit /b 0
