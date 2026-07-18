@echo off
cd /d "%~dp0"
start "StepFun Server" /min cmd /c "python -m http.server 8765"
ping 127.0.0.1 -n 3 >nul
start "" "http://localhost:8765"
