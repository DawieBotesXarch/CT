@echo off
REM OpenMemory Setup Script for Windows
REM This script clones the OpenMemory repository and builds the container

echo.
echo OpenMemory Setup Script
echo ==========================
echo.

REM Check if Docker is running
docker info >nul 2>&1
if errorlevel 1 (
    echo Error: Docker is not running
    echo Please start Docker and try again
    exit /b 1
)

REM Clone OpenMemory if not already present
if not exist "temp-build" (
    echo Cloning OpenMemory repository...
    git clone --depth 1 https://github.com/CaviraOSS/OpenMemory.git temp-build
    echo Repository cloned
) else (
    echo Repository already exists, skipping clone
)

REM Build and start the container
echo.
echo Building and starting OpenMemory container...
docker compose -p openmemory-ct2 up -d --build

REM Wait a bit for container to start
echo.
echo Waiting for OpenMemory to start...
timeout /t 10 /nobreak >nul

REM Test the API
echo.
echo Testing API...
curl -s http://localhost:8080/health >nul
if errorlevel 1 (
    echo Warning: API might not be ready yet
    echo Run "docker logs openmemory-ct2" to check status
) else (
    echo API is responding
)

echo.
echo Setup complete!
echo.
echo OpenMemory is now running on http://localhost:8080
echo.
echo Next steps:
echo 1. Restart Claude Code in this project directory
echo 2. OpenMemory tools will be available via the openmemory MCP server
echo.
echo Useful commands:
echo   - View logs: docker logs -f openmemory-ct2
echo   - Stop: docker compose down
echo   - Restart: docker compose restart
