@echo off
REM Stop OpenMemory container with unique project name
docker compose -p openmemory-ct2 down
echo OpenMemory (CT2) stopped
