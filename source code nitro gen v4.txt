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
