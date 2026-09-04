@echo off
REM Starts ForceBuy and opens it in your browser.
setlocal
cd /d "%~dp0"

REM Runs Node rather than looking for it: a PATH without System32 cannot
REM run `where`, and that would read as a missing Node.
node --version >nul 2>&1
if errorlevel 1 (
  echo ForceBuy needs Node.js 20 or newer.
  echo Install it from https://nodejs.org and run this again.
  echo.
  echo If Node is already installed, this window could not find it on PATH.
  echo You can start ForceBuy with the full path instead, for example:
  echo   "C:\Program Files\nodejs\node.exe" forcebuy.mjs
  pause
  exit /b 1
)

for /f "tokens=1 delims=." %%v in ('node --version') do set "NODE_MAJOR=%%v"
set "NODE_MAJOR=%NODE_MAJOR:v=%"
if %NODE_MAJOR% LSS 20 (
  echo ForceBuy needs Node.js 20 or newer, and this is Node %NODE_MAJOR%.
  echo Update it from https://nodejs.org and run this again.
  pause
  exit /b 1
)

start "" http://127.0.0.1:8787
node forcebuy.mjs
pause
