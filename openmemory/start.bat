@echo off
REM Start OpenMemory container with unique project name
docker compose -p openmemory-ct2 up -d
echo OpenMemory (CT2) started on http://localhost:8080
