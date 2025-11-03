@echo off
echo ============================================
echo Development Mode Setup
echo ============================================
echo.
echo Starting database services with PostgREST exposed...
echo PostgREST will be accessible at http://localhost:3001
echo ⚠️  WARNING: PostgREST is exposed for development!
echo.

docker-compose -f docker-compose.dev.yml up -d

echo.
echo Waiting for services to be ready...
timeout /t 5 /nobreak > nul

echo.
echo ============================================
echo Services Status:
echo ============================================
docker-compose -f docker-compose.dev.yml ps

echo.
echo ============================================
echo Ready for development!
echo ============================================
echo.
echo Now run in another terminal:
echo   npm run dev
echo.
echo Available endpoints:
echo   Express:    http://localhost:4000 (run npm run dev first)
echo   PostgREST:  http://localhost:3001 ⚠️  (exposed for dev)
echo   PostgreSQL: localhost:5432
echo   Adminer:    http://localhost:8080
echo.
echo To stop: docker-compose -f docker-compose.dev.yml down
echo ============================================
pause
