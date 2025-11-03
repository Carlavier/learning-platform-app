@echo off
echo ========================================
echo Starting Learning Platform Development
echo ========================================
echo.

REM Check if node_modules exists in API
if not exist "api\node_modules\" (
    echo Installing API dependencies...
    cd api
    call npm install
    cd ..
    echo.
)

REM Check if node_modules exists in UI
if not exist "ui\node_modules\" (
    echo Installing UI dependencies...
    cd ui
    call npm install
    cd ..
    echo.
)

echo Starting API server...
start "API Server" cmd /k "cd api && npm run dev"

echo Waiting 3 seconds before starting UI...
timeout /t 3 /nobreak >nul

echo Starting UI development server...
start "UI Dev Server" cmd /k "cd ui && npm run dev"

echo.
echo ========================================
echo Both servers are starting!
echo ========================================
echo API will run on: http://localhost:3000
echo UI will run on: http://localhost:5173
echo ========================================
echo.
echo Press any key to exit this window...
echo (The servers will continue running in separate windows)
pause >nul
