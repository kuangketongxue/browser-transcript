@echo off
chcp 65001 >nul 2>&1
title 直播逐字稿录制器
cd /d "%~dp0"

echo ============================================
echo   直播逐字稿录制器
echo ============================================
echo.

:: 检查 Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未找到 Python，请先安装 Python 3
    pause
    exit /b 1
)

:: 检查端口
netstat -ano 2>nul | findstr ":8765" >nul 2>&1
if %errorlevel%==0 (
    echo 端口 8765 已被占用，可能已启动过
    echo 直接打开浏览器...
    start "" "http://localhost:8765"
    exit /b 0
)

echo 正在启动服务器（新窗口）...
start "StepFun ASR Server" cmd /c "cd /d "%~dp0" && python -m http.server 8765"
timeout /t 2 /nobreak >nul

:: 检查启动是否成功
netstat -ano 2>nul | findstr ":8765" >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 服务器启动失败
    pause
    exit /b 1
)

echo 服务器已启动，打开浏览器...
start "" "http://localhost:8765"
