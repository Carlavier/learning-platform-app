@echo off
echo ========================================
echo Installing Dependencies
echo ========================================
echo.

echo Installing API dependencies...
cd api
call npm install
cd ..
echo.

echo Installing UI dependencies...
cd ui
call npm install
cd ..

echo.
echo ========================================
echo All dependencies installed!
echo ========================================
pause
