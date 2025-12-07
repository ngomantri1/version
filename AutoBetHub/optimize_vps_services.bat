@echo off
title Disable unneeded services for C# auto VPS

echo ==========================================
echo  DISABLE SOME WINDOWS SERVICES (VPS)
echo  MUST RUN AS ADMINISTRATOR
echo ==========================================
echo.
pause

setlocal EnableDelayedExpansion

REM --- Helper function ---
:DisableService
REM %1 = service name, %2 = display comment
echo.
echo ---- %2 (%1) ----
sc stop %1 >nul 2>&1
sc config %1 start= disabled >nul 2>&1
echo Done (if no error above).
goto :eof

REM ======= SERVICES ÍT CẦN THIẾT TRÊN VPS =======

call :DisableService Spooler "Print Spooler (in ấn)"
call :DisableService Fax "Fax service"
call :DisableService ScDeviceEnum "Smart Card Device Enumeration"
call :DisableService CertPropSvc "Certificate Propagation (smart card)"
call :DisableService RemoteRegistry "Remote Registry"
call :DisableService CDPSvc "Connected Devices Platform Service"
call :DisableService DiagTrack "Connected User Experiences and Telemetry"
call :DisableService PimIndexMaintenanceSvc "Contact Data (PIM index)"
call :DisableService PcaSvc "Program Compatibility Assistant Service"
call :DisableService TrkWks "Distributed Link Tracking Client"
call :DisableService SSDPSRV "SSDP Discovery (UPnP)"
call :DisableService WSearch "Windows Search (indexing)"
call :DisableService WpnService "Windows Push Notifications System Service"
call :DisableService WpnUserService "Windows Push Notifications User Service"
call :DisableService tiledatamodelsvc "Tile Data model server (Live Tiles)"
call :DisableService TimeBrokerSvc "Time Broker (UWP apps)"
call :DisableService UALSVC "User Access Logging Service"

REM ======= WINDOWS UPDATE & LIÊN QUAN =======

call :DisableService wuauserv "Windows Update"
call :DisableService UsoSvc "Update Orchestrator Service"
call :DisableService DoSvc "Delivery Optimization"
call :DisableService WaaSMedicSvc "Windows Update Medic Service"

echo.
echo ==========================================
echo  ALL DONE. RESTART VPS DE CHAC CHAN OK.
echo ==========================================
echo.
pause
endlocal
