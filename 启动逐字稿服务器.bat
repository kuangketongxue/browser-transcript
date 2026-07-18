@echo off
chcp 65001 >nul 2>&1
echo ============================================
echo   直播逐字稿录制器 - 本地服务器
echo ============================================
echo.
cd /d "%~dp0"
echo 浏览器打开: http://localhost:8765/直播逐字稿录制器.html
echo 按 Ctrl+C 停止服务器
echo.
start "" "http://localhost:8765/直播逐字稿录制器.html"
python -m http.server 8765
