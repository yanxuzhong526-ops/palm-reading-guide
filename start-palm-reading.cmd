@echo off
setlocal
chcp 65001 >nul
set "REPO_ROOT=%~dp0"

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%REPO_ROOT%scripts\launch.ps1"
set "EXIT_CODE=%ERRORLEVEL%"

if not "%EXIT_CODE%"=="0" (
  echo.
  echo 启动没有完成。请根据上面的提示处理后重试。
  pause
)

exit /b %EXIT_CODE%
