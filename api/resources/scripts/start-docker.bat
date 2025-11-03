@echo off
echo ============================================
echo Stopping npm run dev and starting Docker...
echo ============================================
echo.

REM Find and kill process on port 4000
echo Checking for process on port 4000...
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :4000 ^| findstr LISTENING') do (
    echo Found process: %%a
    taskkill /PID %%a /F
)

echo.
echo Starting Docker containers...
docker-compose up -d

echo.
echo ============================================
echo Done! Testing PostgREST blocking...
echo ============================================
echo.

timeout /t 5 /nobreak > nul

echo Testing PostgREST (should fail):
curl http://localhost:3001/lessons 2>&1 | findstr "Failed\|refused"
if %errorlevel% equ 0 (
    echo.
    echo ✅ SUCCESS! PostgREST is BLOCKED!
) else (
    echo.
    echo ⚠️  PostgREST might still be accessible
)

echo.
echo Testing Express (should work):
curl http://localhost:4000/health

echo.
echo ============================================
echo Services running:
echo ============================================
docker-compose ps

echo.
echo ============================================
echo To view logs: docker-compose logs -f
echo To stop: docker-compose down
echo ============================================
