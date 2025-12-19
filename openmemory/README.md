# OpenMemory Setup - Project-Local Configuration

This folder contains a self-contained OpenMemory setup that can be copied to any project.

📋 **Want to copy this to another project?** See [COPYING.md](COPYING.md) for detailed instructions.

## What is OpenMemory?

OpenMemory provides persistent long-term memory for AI systems. When connected to Claude Code, it allows Claude to store and retrieve important context across sessions.

**Repository:** https://github.com/CaviraOSS/OpenMemory

## Why This Approach?

This setup builds OpenMemory from source because the official Docker image requires authentication. Building from source ensures you can use OpenMemory without needing registry access.

## Quick Start

### Automated Setup (Recommended)

**On Windows:**
```cmd
cd openmemory
setup.bat
```

**On Linux/Mac:**
```bash
cd openmemory
chmod +x setup.sh
./setup.sh
```

The setup script will:
1. Clone the OpenMemory repository
2. Build the Docker container
3. Start the service
4. Verify it's working

### Manual Setup

If you prefer to do it manually:

```bash
cd openmemory

# Clone the repository
git clone --depth 1 https://github.com/CaviraOSS/OpenMemory.git temp-build

# Build and start
docker compose up -d --build
```

### 2. Verify It's Running

```bash
# Check container status
docker ps | grep openmemory

# Test the API
curl http://localhost:8080/health
```

### 3. Connect Claude Code

The `.mcp.json` file in the project root should already be configured with:

```json
{
  "mcpServers": {
    "openmemory": {
      "type": "http",
      "url": "http://localhost:8080/mcp"
    }
  }
}
```

**Restart Claude Code** after starting the Docker container.

## Available MCP Tools

Once connected, Claude Code can use these tools:

| Tool | Description |
|------|-------------|
| `openmemory_store` | Store a new memory |
| `openmemory_query` | Search memories semantically |
| `openmemory_list` | List recent memories |
| `openmemory_get` | Get specific memory by ID |
| `openmemory_reinforce` | Boost importance of a memory |

## Configuration

### Port Configuration

Default port is `8080`. If this conflicts with other services:

1. Edit `docker-compose.yml` and change the port mapping:
   ```yaml
   ports:
     - "8081:8080"  # Change host port (left side) to any available port
   ```

2. Update `.mcp.json` in project root:
   ```json
   "url": "http://localhost:8081/mcp"
   ```

### Embedding Provider

By default, uses `synthetic` embeddings (no API key needed). To change:

Edit `docker-compose.yml`:

```yaml
environment:
  - OM_EMBEDDINGS=openai  # Options: synthetic, openai, gemini, ollama
  - OPENAI_API_KEY=sk-xxx  # Required for openai
```

| Provider | Cost | Setup |
|----------|------|-------|
| `synthetic` | Free | No setup required |
| `openai` | ~$0.13/1M tokens | Add OPENAI_API_KEY |
| `gemini` | Free tier available | Add GEMINI_API_KEY |
| `ollama` | Free (self-hosted) | Install Ollama locally |

## Troubleshooting

### Docker Image Pull Fails

If you can't pull the image:

1. Edit `docker-compose.yml`
2. Comment out the `image:` line
3. Uncomment the `build:` section to build from source
4. Run `docker compose up -d --build`

### Container Won't Start

```bash
# Check logs
docker logs openmemory-ct2

# Check if port is already in use (Windows)
netstat -ano | findstr :8080
```

### Claude Code Doesn't See Tools

1. Verify container is running: `docker ps | grep openmemory`
2. Test API: `curl http://localhost:8080/health`
3. Check `.mcp.json` is in project root
4. Restart Claude Code

### Memory Not Persisting

Data is stored in `./data/openmemory.sqlite`. Check:

```bash
# Verify database exists
dir data

# Check container has access
docker exec openmemory-ct2 ls -la /data
```

## Useful Commands

```bash
# Start OpenMemory
docker compose up -d

# Stop OpenMemory
docker compose down

# View logs
docker logs -f openmemory-ct2

# Restart after configuration changes
docker compose restart

# Update to latest version
docker compose pull
docker compose up -d

# Remove everything (including data)
docker compose down -v
rm -rf data/*
```

## Copying to Other Projects

### Quick Copy

1. **Copy the entire `openmemory` folder** to your new project root
2. **Add OpenMemory to `.mcp.json`** in the new project:
   ```json
   {
     "mcpServers": {
       "openmemory": {
         "type": "http",
         "url": "http://localhost:8080/mcp"
       }
     }
   }
   ```
3. **Start the container**: `cd openmemory && docker compose up -d`
4. **Restart Claude Code** in the new project

### Port Conflicts

If you run multiple projects with OpenMemory simultaneously, each needs a unique port:

**Project 1 (CT2):**
- Port: 8080
- URL: `http://localhost:8080/mcp`

**Project 2:**
1. Edit `openmemory/docker-compose.yml`: Change port to `8081:8080`
2. Update `.mcp.json`: Change URL to `http://localhost:8081/mcp`
3. Update container name to avoid conflicts: `openmemory-project2`

**Project 3:**
1. Port: `8082:8080`
2. URL: `http://localhost:8082/mcp`
3. Container: `openmemory-project3`

### Best Practices

- **Keep data isolated**: Each project has its own `openmemory.sqlite` database
- **Backup important memories**: Copy `data/openmemory.sqlite` before major changes
- **Use descriptive container names**: Makes it easy to identify which project
- **Document your port**: Add a comment in `.mcp.json` noting which port is used

## Data Management

### Backup Memory

```bash
# Copy database file
cp data/openmemory.sqlite data/openmemory.backup-$(date +%Y%m%d).sqlite
```

### Restore from Backup

```bash
# Stop container
docker compose stop

# Restore backup
cp data/openmemory.backup-20251219.sqlite data/openmemory.sqlite

# Start container
docker compose start
```

### Clear All Memory

```bash
# Stop container
docker compose down

# Remove database
rm data/openmemory.sqlite

# Start fresh
docker compose up -d
```

## Security

### Add API Key Protection

Edit `docker-compose.yml`:

```yaml
environment:
  - OM_API_KEY=your-secret-key-here
```

Then configure Claude Code MCP with the API key (check OpenMemory docs for MCP auth).

### Network Isolation

By default, OpenMemory is only accessible from localhost. For production:

- Keep localhost-only access
- Use firewall rules to restrict access
- Consider adding API key protection
- Never expose port 8080 to the internet

## Further Reading

- [OpenMemory GitHub](https://github.com/CaviraOSS/OpenMemory)
- [OpenMemory Documentation](https://github.com/CaviraOSS/OpenMemory#readme)
- [MCP Protocol](https://modelcontextprotocol.io/)
- [Full Setup Guide](../Docs/openmemory-setup-guide.md) - Multi-project centralized approach
