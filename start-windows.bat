@echo off
cd /d "%~dp0"
echo Installing project dependencies (first run only)...
call npm install
if errorlevel 1 (
  echo Dependency installation failed. Check your internet connection and Node.js/npm installation.
  pause
  exit /b 1
)
echo Starting CodeTrack AI...
call npm run dev
pause
