# Copy OpenMemory to a New Project

## Quick Start

When copying this `openmemory` folder to a new project, you need to make it unique so multiple instances can run simultaneously.

## What to Change

### 1. Choose Your Unique Identifiers
Pick a short project identifier (e.g., `myapp`, `api`, `frontend`):
- **Project identifier**: `____` (example: `ct2`, `sg`, `myapp`)

### 2. Files to Modify

#### **docker-compose.yml**

```yaml
# Line 13: CHANGE - Unique container name
container_name: openmemory-YOURPROJECT

# Line 16: CHANGE - External port only (left side of :)
ports:
  - "XXXX:8080"  # XXXX = your unique port (8080, 8082, 8083, etc.)
                  # 8080 (right side) = DO NOT CHANGE - internal port

# Line 21: DO NOT CHANGE - Always 8080
- OM_PORT=8080

# Line 50: DO NOT CHANGE - Always localhost:8080
test: ['CMD-SHELL', 'node -e "require(''http'').get(''http://localhost:8080/health'', ...)']

# Line 58: CHANGE - Unique network name
name: openmemory-YOURPROJECT-network
```

#### **setup.bat**

```batch
# Line 30: CHANGE - Add project name flag
docker compose -p openmemory-YOURPROJECT up -d --build

# Line 40: CHANGE - Update port to match docker-compose.yml
curl -s http://localhost:XXXX/health >nul

# Line 43: CHANGE - Update container name
echo Run "docker logs openmemory-YOURPROJECT" to check status

# Line 51: CHANGE - Update port
echo OpenMemory is now running on http://localhost:XXXX

# Line 58: CHANGE - Update container name
echo   - View logs: docker logs -f openmemory-YOURPROJECT
```

#### **start.bat**

```batch
# Line 3: CHANGE - Project name
docker compose -p openmemory-YOURPROJECT up -d

# Line 4: CHANGE - Port and project name
echo OpenMemory (YOURPROJECT) started on http://localhost:XXXX
```

#### **stop.bat**

```batch
# Line 3: CHANGE - Project name
docker compose -p openmemory-YOURPROJECT down

# Line 4: CHANGE - Project name
echo OpenMemory (YOURPROJECT) stopped
```

## What NOT to Change

**CRITICAL - Do NOT change these:**
- Internal port in `ports:` mapping (the `8080` after the colon: `"XXXX:8080"`)
- `OM_PORT=8080` environment variable
- Healthcheck port `localhost:8080`
- Any paths or Docker build configuration

## Port Reference Table

| Project | External Port | Container Name    | Network Name          |
|---------|--------------|-------------------|-----------------------|
| CT2     | 8080         | openmemory-ct2    | openmemory-ct2-network |
| SG      | 8082         | openmemory-sg     | openmemory-sg-network  |
| NEW     | 8083         | openmemory-NEW    | openmemory-NEW-network |

## Example: Creating "MyApp" Instance

1. Copy `openmemory` folder to new project
2. In docker-compose.yml:
   - Line 13: `container_name: openmemory-myapp`
   - Line 16: `- "8083:8080"`  (external 8083, internal stays 8080)
   - Line 58: `name: openmemory-myapp-network`
3. In setup.bat:
   - Line 30: `docker compose -p openmemory-myapp up -d --build`
   - Line 40: `curl -s http://localhost:8083/health >nul`
4. Update start.bat and stop.bat similarly

## Testing

After setup:
```bash
# Run setup
setup.bat

# Verify it's running
docker ps --filter "name=openmemory"

# You should see your container with its unique name and port
```

## Troubleshooting

**Issue**: Container keeps stopping other instances
- **Fix**: Make sure you're using the `-p openmemory-YOURPROJECT` flag in all docker commands

**Issue**: "Port already in use"
- **Fix**: Choose a different external port (left side of `XXXX:8080`)

**Issue**: "Connection refused"
- **Fix**: Make sure you didn't change the internal port or OM_PORT (should always be 8080)
