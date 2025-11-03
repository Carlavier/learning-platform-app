@echo off
echo ========================================
echo Stopping All Development Servers
echo ========================================
echo.

echo Killing Node.js processes...
taskkill /F /IM node.exe /T 2>nul
if %errorlevel% equ 0 (
    echo Node.js processes stopped successfully!
) else (
    echo No Node.js processes were running.
)

echo.
echo ========================================
echo All servers stopped!
echo ========================================
pause
