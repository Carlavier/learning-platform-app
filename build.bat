@echo off
echo ========================================
echo Building Production Build
echo ========================================
echo.

echo Building API...
cd api
call npm run build
cd ..
echo.

echo Building UI...
cd ui
call npm run build
cd ..

echo.
echo ========================================
echo Production build complete!
echo ========================================
echo API build: ./api/dist
echo UI build: ./ui/dist
echo ========================================
pause
