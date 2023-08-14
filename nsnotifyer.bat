@echo off

set desired_ip=188.208.36.82
set current_ip=176.62.173.233

:loop
for /f "delims=\n " %%a in ('nslookup lorenzoverheecke.be ^| findstr "Addresses:"') do (
    set "line=%%b"
    set "line=!line:*Addresses: =!"
    set current_ip=!line!
    goto :check_ip
)

:check_ip
if "%current_ip%"=="%desired_ip%" (
    echo IPv4 address is now as desired: %desired_ip%
    goto :end
) else (
    echo IPv4 address is still %current_ip%, waiting...
    timeout /t 60 >nul
    goto :loop
)

:end