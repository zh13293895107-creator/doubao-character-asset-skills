@echo off
chcp 65001 >nul
echo.
echo ====================================================
echo   Doubao Character Asset Skills - Offline Installer
echo   (Windows)
echo ====================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0install-offline.ps1" -SourceDir "%~dp0"
echo.
echo If the skills are installed, restart Doubao (or open a new session).
echo.
pause
