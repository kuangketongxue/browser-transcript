@echo off
chcp 65001 >nul 2>&1
title 直播逐字稿录制器 - 本地服务器
cd /d "%~dp0"

echo ============================================
echo   直播逐字稿录制器 - 本地服务器
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
    echo [错误] 端口 8765 已被占用，可能已启动过
    pause
    exit /b 1
)

echo [OK] 启动服务器...
:: 先启动服务器（后台），等 2 秒让服务器就绪，再开浏览器
start /b python -m http.server 8765 >nul 2>&1
timeout /t 2 /nobreak >nul

:: 检查服务器是否启动成功
netstat -ano 2>nul | findstr ":8765" >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 服务器启动失败
    pause
    exit /b 1
)

echo [OK] 服务器已启动
echo [OK] 浏览器打开: http://localhost:8765
echo.
echo 按 Ctrl+C 停止
echo.
start "" "http://localhost:8765"

:: 保持窗口运行，等服务器退出
:loop
timeout /t 5 /nobreak >nul
netstat -ano 2>nul | findstr ":8765" >nul 2>&1
if %errorlevel%==0 goto loop
echo 服务器已停止
pause
