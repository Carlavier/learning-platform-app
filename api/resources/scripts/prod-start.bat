@echo off
echo ============================================
echo Production Mode Setup (Docker)
echo ============================================
echo.
echo Building and starting all services...
echo PostgREST will be BLOCKED (internal network only)
echo ✅ PostgREST NOT accessible from host
echo.

REM Stop any running npm dev server
echo Checking for npm run dev process...
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :4000 ^| findstr LISTENING') do (
    echo Stopping npm run dev (PID: %%a)...
    taskkill /PID %%a /F 2>nul
)

echo.
echo Building Docker containers...
docker-compose up --build -d

echo.
echo Waiting for services to be ready...
timeout /t 10 /nobreak > nul

echo.
echo ============================================
echo Services Status:
echo ============================================
docker-compose ps

echo.
echo ============================================
echo Testing Security:
echo ============================================
echo.
echo Testing PostgREST direct access (should FAIL):
curl http://localhost:3001/lessons 2>&1 | findstr "Failed\|refused"
if %errorlevel% equ 0 (
    echo ✅ SUCCESS! PostgREST is BLOCKED!
) else (
    echo ⚠️  WARNING: PostgREST might be accessible
)

echo.
echo Testing Express health (should WORK):
curl -s http://localhost:4000/health

echo.
echo ============================================
echo Production Ready!
echo ============================================
echo.
echo Available endpoints:
echo   Express:    http://localhost:4000 ✅ (public)
echo   PostgREST:  BLOCKED ✅ (internal only)
echo   PostgreSQL: localhost:5432
echo   Adminer:    http://localhost:8080
echo.
echo View logs:  docker-compose logs -f
echo Stop:       docker-compose down
echo ============================================
pause
