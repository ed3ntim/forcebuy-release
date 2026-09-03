@echo off
REM Starts ForceBuy and opens it in your browser.
setlocal
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo ForceBuy needs Node.js 20 or newer.
  echo Install it from https://nodejs.org and run this again.
  pause
  exit /b 1
)
start "" http://127.0.0.1:8787
node forcebuy.mjs
pause
