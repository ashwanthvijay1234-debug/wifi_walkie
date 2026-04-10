@echo off
color 0B
title Wi-Fi Walkie-Talkie Installer

:: 1. Fun Banner
echo.
echo       ╔════════════════════════════════════════════╗
echo       ║      📻 WI-FI WALKIE-TALKIE INSTALLER      ║
echo       ║            Powered by OpenClaw             ║
echo       ╚════════════════════════════════════════════╝
echo.

:: 2. Check Python
echo [1/4] 🔍 Checking for Python...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python not found! Please install Python from python.org first.
    pause
    exit /b 1
)
echo ✅ Python found!

:: 3. Install Dependencies with Quotes
echo.
echo [2/4] 💬 "Software is eating the world." - Marc Andreessen
echo [3/4] 🔧 Installing cryptography library...
pip install cryptography --quiet
if %errorlevel% neq 0 (
    echo ⚠️ Warning: Could not auto-install cryptography. You may need to run: pip install cryptography
) else (
    echo ✅ Cryptography installed!
)

:: 4. Download the App using BITSAdmin (More reliable than curl on Windows)
echo.
echo [4/4] 💬 "Make it work, make it right, make it fast." - Kent Beck
echo 📥 Downloading Wi-Fi Walkie-Talkie app...

:: Replace the URL below with your ACTUAL raw wifi_walkie.py URL
set APP_URL=https://raw.githubusercontent.com/ashwanthvijay1234-debug/wifi_walkie/main/wifi_walkie.py

bitsadmin /transfer "DownloadApp" /download /priority high "%APP_URL%" "%cd%\wifi_walkie.py" >nul 2>&1

if exist "wifi_walkie.py" (
    echo ✅ App downloaded successfully!
) else (
    echo ❌ Failed to download app. Check your internet or repository settings.
    pause
    exit /b 1
)

:: 5. Final Success & Launch
echo.
echo       ╔════════════════════════════════════════════╗
echo       ║           INSTALLATION COMPLETE!           ║
echo       ╚════════════════════════════════════════════╝
echo.
echo 🚀 Ready to chat!
set /p launch="Do you want to launch now? (Y/N): "
if /i "%launch%"=="Y" (
    echo 📻 Launching...
    python wifi_walkie.py
) else (
    echo 👋 Okay! Run 'python wifi_walkie.py' anytime to start.
)

pause