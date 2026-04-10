@echo off
:: Enable UTF-8 encoding so the box drawing characters render correctly
chcp 65001 >nul
setlocal EnableDelayedExpansion

:: ==========================================
:: CONFIGURATION
:: ==========================================
set "APP_URL=https://raw.githubusercontent.com/ashwanthvijay1234-debug/wifi_walkie/main/wifi_walkie.py"
set "APP_NAME=wifi_walkie.py"

:: ==========================================
:: HELPER FUNCTIONS FOR UI
:: ==========================================

:DrawHeader
cls
echo.
echo    ╭────────────────────────────────────────────────────╮
echo    │                                                    │
echo    │            WI-FI WALKIE-TALKIE INSTALLER           │
echo    │                 Powered by OpenClaw                │
echo    │                                                    │
echo    ╰────────────────────────────────────────────────────╯
echo.
goto :eof

:PrintStep
set "MSG=%~1"
echo   [ * ] %MSG%
timeout /t 1 /nobreak >nul
goto :eof

:PrintQuote
set "Q_TEXT=%~1"
set "Q_AUTH=%~2"
echo.
echo         " %Q_TEXT% "
echo           -- %Q_AUTH%
echo.
timeout /t 2 /nobreak >nul
goto :eof

:: ==========================================
:: MAIN INSTALLATION LOGIC
:: ==========================================

call :DrawHeader

:: Step 1: Check Python
call :PrintStep "Checking for Python..."
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo   [ X ] ERROR: Python is not installed or not in PATH.
    echo         Please install Python from python.org first.
    pause
    exit /b 1
)
echo   [ + ] Python found!

call :PrintQuote "Software is eating the world." "Marc Andreessen"

:: Step 2: Install Cryptography
call :PrintStep "Installing cryptography library..."
python -m pip install --upgrade pip --quiet
pip install cryptography --quiet
if %errorlevel% neq 0 (
    echo   [ ! ] Warning: Could not auto-install cryptography.
) else (
    echo   [ + ] Cryptography installed!
)

call :PrintQuote "First, solve the problem. Then, write the code." "John Johnson"

:: Step 3: Download App
call :PrintStep "Downloading Wi-Fi Walkie-Talkie..."
curl -sS -o "%APP_NAME%" "%APP_URL%"
if exist "%APP_NAME%" (
    echo   [ + ] Download complete!
) else (
    echo   [ X ] ERROR: Failed to download the application.
    pause
    exit /b 1
)

call :PrintQuote "Simplicity is the soul of efficiency." "Austin Freeman"

:: Step 4: Create Requirements
call :PrintStep "Setting up requirements..."
echo cryptography>requirements.txt
echo   [ + ] Setup complete!

call :PrintQuote "Make it work, make it right, make it fast." "Kent Beck"

:: Final Screen
cls
echo.
echo    ╭────────────────────────────────────────────────────╮
echo    │                                                    │
echo    │               INSTALLATION COMPLETE!               │
echo    │                                                    │
echo    │           You are ready to talk on Wi-Fi.          │
echo    │                                                    │
echo    ╰────────────────────────────────────────────────────╯
echo.
echo    [ ^> ] Launching Wi-Fi Walkie-Talkie...
echo.
timeout /t 2 /nobreak >nul

:: Launch the app
python "%APP_NAME%"

:: Pause if the app closes so the user can read any errors
pause
