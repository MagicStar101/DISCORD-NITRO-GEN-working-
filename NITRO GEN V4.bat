::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFAhBXAGGAE+1EbsQ5+n//Napi3kve6IYXaGb7ODAJfgWig==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
chcp 65001 > nul
title B-Shop ^| Discord Nitro gen V1 ^| by MAGICSTAR101

color A

:: Benutzer nach der Webhook-URL fragen
set /p "webhook=Enter Discord webhook URL: "

:: Benutzer nach der Anzahl der zu generierenden Codes fragen
set /p "num_codes=Enter the number of codes you want to generate: "

set "num_times=1"

:menu
cls
echo.
echo.
echo                                   ██████╗       ███████╗██╗  ██╗ ██████╗ ██████╗ 
echo                                   ██╔══██╗      ██╔════╝██║  ██║██╔═══██╗██╔══██╗
echo                                   ██████╔╝█████╗███████╗███████║██║   ██║██████╔╝
echo                                   ██╔══██╗╚════╝╚════██║██╔══██║██║   ██║██╔═══╝ 
echo                                   ██████╔╝      ███████║██║  ██║╚██████╔╝██║     
echo                                   ╚═════╝       ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝                                   
echo.
echo                                   [1] Gen Nitro Codes
echo                                   [0] Exit
set /p choice=Enter your choice: 

if "%choice%"=="1" goto generate_nitro_codes_10
if "%choice%"=="0" goto exit

:generate_nitro_codes_10
@echo off

cls
echo Generating Discord Nitro Codes...

:: Definiere die Zeichen, die für die Code-Erstellung verwendet werden
setlocal enabledelayedexpansion
set "characters=ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
set "code_length=16"

:: Schleife zur Generierung der gewünschten Anzahl von Codes
for /l %%i in (1,1,%num_codes%) do (
    set "code="
    
    :: Schleife zur Generierung eines einzelnen Codes
    for /l %%j in (1,1,%code_length%) do (
        set /a "rand=!random! %% 36"
        for %%k in (!rand!) do (
            set "code=!code!!characters:~%%k,1!"
        )
    )
    
    :: Ausgabe des generierten Codes
    echo https://discord.gift/!code!
    
    :: Sende den generierten Code an den Discord Webhook
    curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"https://discord.gift/!code!\"}" %webhook%
)

echo.
echo Generating complete. Press any key to exit...
pause >nul
exit

:exit
exit
