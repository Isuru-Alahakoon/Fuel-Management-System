@echo off
echo ========================================
echo   Vehicle System - Sri Drive
echo ========================================
echo.
echo Starting application...
echo.
echo Once started, open in browser:
echo   http://localhost:9090/vehicle_system/
echo.
echo Press Ctrl+C to stop the server.
echo ========================================
echo.

cd /d "%~dp0"
call mvnw.cmd tomcat7:run

pause
