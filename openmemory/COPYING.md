# Copying OpenMemory to Other Projects

This guide explains how to copy the OpenMemory setup from this template project to your other projects.

## Quick Copy Method

### What to Copy

Copy the entire `openmemory` folder to your new project:

```bash
# From this template project directory
cp -r openmemory /path/to/your/other/project/

# Or on Windows
xcopy openmemory C:\path\to\your\other\project\openmemory\ /E /I
```

### What You'll Get

```
your-project/
├── openmemory/
│   ├── docker-compose.yml    # Container configuration
│   ├── setup.sh              # Setup script (Linux/Mac)
│   ├── setup.bat             # Setup script (Windows)
│   ├── README.md             # Full documentation
│   ├── COPYING.md            # This file
│   ├── .gitignore            # Excludes data/ and temp-build/
│   └── data/                 # Created automatically
└── .mcp.json                 # You'll update this
```

## Step-by-Step Setup in New Project

### Step 1: Copy the Folder

```bash
# Copy openmemory folder to your new project root
cp -r openmemory /path/to/new-project/
cd /path/to/new-project/openmemory
```

### Step 2: Run Setup Script

**On Windows:**
```cmd
setup.bat
```

**On Linux/Mac:**
```bash
chmod +x setup.sh
./setup.sh
```

The script will:
1. Clone the OpenMemory repository
2. Build the Docker container
3. Start the service
4. Verify it's working

### Step 3: Configure Claude Code

Add to your project's `.mcp.json`:

```json
{
  "mcpServers": {
    "openmemory": {
      "type": "http",
      "url": "http://localhost:8080/mcp",
      "description": "Persistent long-term memory for AI systems"
    }
  }
}
```

**If you already have an `.mcp.json`**, just add the `openmemory` entry to the existing `mcpServers` object.

### Step 4: Restart Claude Code

Restart Claude Code in your new project directory to load the OpenMemory MCP server.

## Port Conflicts

If you're running multiple projects with OpenMemory simultaneously, each needs a unique port.

### Change Port in Project 2

1. **Edit `docker-compose.yml`:**
   ```yaml
   ports:
     - "8081:8080"  # Changed from 8080:8080
   ```

2. **Update container name to avoid conflicts:**
   ```yaml
   container_name: openmemory-project2  # Changed from openmemory-ct2
   ```

3. **Update `.mcp.json`:**
   ```json
   "url": "http://localhost:8081/mcp"
   ```

4. **Rebuild and restart:**
   ```bash
   cd openmemory
   docker compose down
   docker compose up -d --build
   ```

### Recommended Port Allocation

- CT2 (template): 8080
- Project 1: 8081
- Project 2: 8082
- Project 3: 8083
- etc.

## Manual Setup (Without Scripts)

If you prefer not to use the setup scripts:

### 1. Clone Repository

```bash
cd openmemory
git clone --depth 1 https://github.com/CaviraOSS/OpenMemory.git temp-build
```

### 2. Build and Start

```bash
docker compose up -d --build
```

### 3. Verify

```bash
# Check container
docker ps | grep openmemory

# Test API
curl http://localhost:8080/health
```

### 4. Configure `.mcp.json` and restart Claude Code

## Updating OpenMemory

To update to the latest version:

```bash
cd openmemory

# Stop container
docker compose down

# Update repository
rm -rf temp-build
git clone --depth 1 https://github.com/CaviraOSS/OpenMemory.git temp-build

# Rebuild
docker compose up -d --build
```

## Data Isolation

Each project has its own isolated database:

```
project1/openmemory/data/openmemory.sqlite  # Project 1's memories
project2/openmemory/data/openmemory.sqlite  # Project 2's memories
project3/openmemory/data/openmemory.sqlite  # Project 3's memories
```

Memories never mix between projects.

## Backup Before Copying

If you want to preserve memories when copying:

```bash
# Backup the database
cp openmemory/data/openmemory.sqlite openmemory/data/backup-$(date +%Y%m%d).sqlite

# Or copy the entire data folder
cp -r openmemory/data openmemory/data-backup
```

## Starting Fresh

To start with a clean slate in a new project:

```bash
# Before first run, ensure data folder is empty
rm -rf openmemory/data/*
```

## Troubleshooting

### "Container name already exists"

Another project is using the same container name.

**Fix:** Change `container_name` in `docker-compose.yml`:
```yaml
container_name: openmemory-yourprojectname
```

### "Port already in use"

Another project is using port 8080.

**Fix:** Use a different port (see "Port Conflicts" section above).

### "Permission denied" (Linux/Mac)

**Fix:** Make setup script executable:
```bash
chmod +x setup.sh
```

### Build fails or is slow

The first build takes 5-10 minutes. Subsequent builds are cached and faster.

If build fails, check:
- Docker has enough resources (4GB+ RAM recommended)
- Internet connection is stable
- No other intensive processes running

### Claude Code doesn't see tools

1. Verify container is running: `docker ps | grep openmemory`
2. Check `.mcp.json` is in project root (not in openmemory folder)
3. Restart Claude Code
4. Test API: `curl http://localhost:8080/health`

## Best Practices

### Git Integration

The `.gitignore` excludes:
- `data/` - Database files (can be large)
- `temp-build/` - Cloned repository (can be re-cloned)

This keeps your repository clean while allowing you to commit the setup configuration.

### Docker Compose Profiles

If you don't want OpenMemory to start automatically:

```yaml
services:
  openmemory:
    profiles: ["memory"]  # Add this line
```

Then start manually:
```bash
docker compose --profile memory up -d
```

### Development Workflow

1. **Start working on project:** `cd project && cd openmemory && docker compose up -d`
2. **Work with Claude Code** (memories persist automatically)
3. **Done for the day:** Container keeps running (uses minimal resources)
4. **Shutdown machine:** Docker stops automatically, data is saved

## Multiple Developers

If multiple developers work on the same project:

1. **Commit** the `openmemory/` folder (excluding data/)
2. **Each developer runs** `setup.sh` or `setup.bat`
3. **Each has their own** local database
4. **Memories don't sync** between developers (by design)

If you want shared memories, consider:
- Backing up and sharing the database file
- Using a shared PostgreSQL instance (advanced)

## Further Customization

### Use OpenAI Embeddings

Edit `docker-compose.yml`:

```yaml
environment:
  - OM_EMBEDDINGS=openai
  - OPENAI_API_KEY=sk-your-key-here
```

### Add API Key Protection

```yaml
environment:
  - OM_API_KEY=your-secret-key
```

Then update MCP configuration (check OpenMemory docs for auth setup).

### Adjust Memory Settings

```yaml
environment:
  - OM_MIN_SCORE=0.5          # Higher = stricter matching
  - OM_VEC_DIM=512            # Higher = better quality (slower)
  - OM_DECAY_LAMBDA=0.01      # Lower = slower memory decay
```

See `docker-compose.yml` comments or OpenMemory docs for all options.

## Questions?

- OpenMemory Documentation: https://github.com/CaviraOSS/OpenMemory
- Full local setup guide: See `README.md` in this folder
- Original setup guide: `../Docs/openmemory-setup-guide.md`
