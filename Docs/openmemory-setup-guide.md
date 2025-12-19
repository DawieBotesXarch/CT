# OpenMemory Setup Guide for Claude Code Projects

## Overview

OpenMemory provides persistent long-term memory for AI systems. This guide covers setting up isolated OpenMemory instances per project, so each Claude Code project has its own separate memory that doesn't mix with others.

**Repository:** https://github.com/CaviraOSS/OpenMemory

## Architecture Decision

**Approach: Per-Project Instances**

Each project gets its own OpenMemory container running on a unique port with its own SQLite database. This provides:
- Complete data isolation between projects
- Simple per-project backups (just copy the SQLite file)
- Easy teardown (delete container + data folder)
- No risk of memory cross-contamination

## Directory Structure

Create a central location for all OpenMemory data:

```
~/openmemory/
├── docker-compose.yml          # Master compose file for all instances
├── backup.sh                   # Backup script
├── backups/                    # Backup destination
└── data/
    ├── project-alpha/          # Data for project-alpha
    │   └── openmemory.sqlite
    ├── project-beta/           # Data for project-beta
    │   └── openmemory.sqlite
    └── mdl-dashboard/          # Data for mdl-dashboard
        └── openmemory.sqlite
```

## Setup Instructions

### Step 1: Create the Central OpenMemory Directory

```bash
mkdir -p ~/openmemory/data
mkdir -p ~/openmemory/backups
cd ~/openmemory
```

### Step 2: Create the Docker Compose File

Create `~/openmemory/docker-compose.yml`:

```yaml
version: "3.8"

services:
  # Template for adding new projects - copy this block and change:
  # 1. Service name (openmemory-PROJECTNAME)
  # 2. Container name
  # 3. Port mapping (increment the host port: 8081, 8082, 8083, etc.)
  # 4. Volume path (data/PROJECTNAME)

  openmemory-mdl-dashboard:
    image: ghcr.io/caviraoss/openmemory:latest
    container_name: openmemory-mdl-dashboard
    restart: unless-stopped
    ports:
      - "8081:8080"
    volumes:
      - ./data/mdl-dashboard:/data
    environment:
      - OM_PORT=8080
      - OM_EMBEDDINGS=synthetic  # Use 'openai' or 'ollama' if you have API keys
      - OM_TELEMETRY=false
      # - OM_API_KEY=your-secret-key  # Optional: add API key protection
      # - OPENAI_API_KEY=sk-xxx       # Required if OM_EMBEDDINGS=openai

  # Example: Add another project
  # openmemory-crowdfunding:
  #   image: ghcr.io/caviraoss/openmemory:latest
  #   container_name: openmemory-crowdfunding
  #   restart: unless-stopped
  #   ports:
  #     - "8082:8080"
  #   volumes:
  #     - ./data/crowdfunding:/data
  #   environment:
  #     - OM_PORT=8080
  #     - OM_EMBEDDINGS=synthetic
  #     - OM_TELEMETRY=false

networks:
  default:
    name: openmemory-network
```

### Step 3: Start the Services

```bash
cd ~/openmemory
docker compose up -d
```

To start only a specific project's memory:
```bash
docker compose up -d openmemory-mdl-dashboard
```

### Step 4: Verify It's Running

```bash
# Check container status
docker compose ps

# Test the API
curl http://localhost:8081/health
```

## Connecting Claude Code to OpenMemory

### For Each Project

Add a `.mcp.json` file to the project root:

```json
{
  "mcpServers": {
    "openmemory": {
      "type": "http",
      "url": "http://localhost:8081/mcp"
    }
  }
}
```

**Important:** Change the port number to match the project's OpenMemory instance:
- mdl-dashboard → port 8081
- crowdfunding → port 8082
- etc.

### Alternative: Global Configuration

If you want OpenMemory available in all Claude Code sessions (not recommended for project isolation), add to `~/.claude.json`:

```json
{
  "mcpServers": {
    "openmemory": {
      "type": "http",
      "url": "http://localhost:8081/mcp"
    }
  }
}
```

## Adding OpenMemory to a New Project

### Quick Checklist

1. **Add service to docker-compose.yml:**
   ```yaml
   openmemory-new-project:
     image: ghcr.io/caviraoss/openmemory:latest
     container_name: openmemory-new-project
     restart: unless-stopped
     ports:
       - "808X:8080"  # Pick next available port
     volumes:
       - ./data/new-project:/data
     environment:
       - OM_PORT=8080
       - OM_EMBEDDINGS=synthetic
       - OM_TELEMETRY=false
   ```

2. **Start the new service:**
   ```bash
   cd ~/openmemory
   docker compose up -d openmemory-new-project
   ```

3. **Add `.mcp.json` to project root:**
   ```json
   {
     "mcpServers": {
       "openmemory": {
         "type": "http",
         "url": "http://localhost:808X/mcp"
       }
     }
   }
   ```

4. **Restart Claude Code** in that project directory

## Adding OpenMemory to an Existing Project

Same as above - just:
1. Add the service to docker-compose.yml with a new port
2. Start it
3. Add `.mcp.json` to the existing project root
4. Restart Claude Code

## Backup Strategy

### Create Backup Script

Create `~/openmemory/backup.sh`:

```bash
#!/bin/bash

# OpenMemory Backup Script
# Backs up all project databases to timestamped folder

BACKUP_DIR=~/openmemory/backups
DATA_DIR=~/openmemory/data
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
DEST="$BACKUP_DIR/$TIMESTAMP"

mkdir -p "$DEST"

echo "Backing up OpenMemory databases to $DEST"

for project_dir in "$DATA_DIR"/*/; do
    project_name=$(basename "$project_dir")
    db_file="$project_dir/openmemory.sqlite"
    
    if [ -f "$db_file" ]; then
        echo "  Backing up: $project_name"
        cp "$db_file" "$DEST/${project_name}.sqlite"
    fi
done

echo "Backup complete!"
echo ""
echo "Files backed up:"
ls -lh "$DEST"
```

Make it executable:
```bash
chmod +x ~/openmemory/backup.sh
```

### Run Backup

```bash
~/openmemory/backup.sh
```

### Automated Backups (Optional)

Add to crontab for daily backups at 2am:
```bash
crontab -e
# Add this line:
0 2 * * * ~/openmemory/backup.sh
```

### Restore from Backup

```bash
# Stop the specific service first
docker compose stop openmemory-mdl-dashboard

# Copy backup over current database
cp ~/openmemory/backups/20251218_020000/mdl-dashboard.sqlite ~/openmemory/data/mdl-dashboard/openmemory.sqlite

# Start service again
docker compose start openmemory-mdl-dashboard
```

## Available MCP Tools in Claude Code

Once connected, Claude Code can use these tools:

| Tool | Description |
|------|-------------|
| `openmemory_store` | Store a new memory |
| `openmemory_query` | Search memories semantically |
| `openmemory_list` | List recent memories |
| `openmemory_get` | Get specific memory by ID |
| `openmemory_reinforce` | Boost importance of a memory |

## Useful Commands Reference

```bash
# Start all OpenMemory instances
cd ~/openmemory && docker compose up -d

# Stop all instances
cd ~/openmemory && docker compose down

# View logs for specific project
docker logs -f openmemory-mdl-dashboard

# Check what's running
docker compose ps

# Restart a specific instance
docker compose restart openmemory-mdl-dashboard

# Pull latest OpenMemory image
docker compose pull

# Backup all databases
~/openmemory/backup.sh
```

## Embedding Provider Options

In docker-compose.yml, set `OM_EMBEDDINGS` to one of:

| Value | Description | Cost |
|-------|-------------|------|
| `synthetic` | Built-in, no API needed | Free |
| `openai` | OpenAI embeddings (requires OPENAI_API_KEY) | ~$0.13/1M tokens |
| `gemini` | Google Gemini (requires GEMINI_API_KEY) | Free tier available |
| `ollama` | Local Ollama server | Free (self-hosted) |

For most use cases, `synthetic` works fine. Switch to `openai` or `ollama` if you need higher quality semantic search.

## Port Allocation Tracker

Keep track of which port goes to which project:

| Port | Project | Status |
|------|---------|--------|
| 8081 | mdl-dashboard | Active |
| 8082 | (available) | - |
| 8083 | (available) | - |
| 8084 | (available) | - |

## Troubleshooting

**Claude Code doesn't see OpenMemory tools:**
- Check container is running: `docker ps | grep openmemory`
- Verify `.mcp.json` is in project root (not a subdirectory)
- Restart Claude Code after adding `.mcp.json`
- Test API manually: `curl http://localhost:808X/health`

**Container won't start:**
- Check port isn't already in use: `lsof -i :8081`
- Check logs: `docker logs openmemory-projectname`

**Memory not persisting:**
- Verify volume mount exists: `ls ~/openmemory/data/projectname/`
- Check container has write permissions
