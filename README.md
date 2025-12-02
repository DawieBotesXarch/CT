# Claude Code Template Project

A comprehensive, reusable template for efficient AI-assisted development with Claude Code. Drop this template into any project to immediately leverage custom agents, slash commands, workflows, and best practices.

## What's Included

- **Custom Agents**: Specialized AI assistants (MD Documenter, Mermaid Expert, Code Reviewer, Test Engineer)
- **Slash Commands**: Quick access to common workflows (`/review`, `/test`, `/document`, etc.)
- **Workflows**: Proven development patterns and best practices
- **MCP Configuration**: Pre-configured Playwright for browser automation
- **Rules & Conventions**: Code standards and quality guidelines
- **Comprehensive Documentation**: How-to guides, examples, and references

## Quick Start

### 1. Copy Template to Your Project

```bash
# From this template directory
cp -r .claude /path/to/your/project/
cp CLAUDE.md /path/to/your/project/
cp .mcp.json /path/to/your/project/  # Optional: MCP servers
```

### 2. Customize CLAUDE.md

Edit `/path/to/your/project/CLAUDE.md`:
- Update project overview
- Add language-specific conventions
- Document your build/test commands
- Add project-specific patterns

### 3. Start Claude Code

```bash
cd /path/to/your/project
claude
```

### 4. Try It Out

```
"List available custom agents"
"/review"
"/document README"
"Create a diagram of the authentication flow"
```

## Installing RAG System in a New Project

The Documentation RAG system enables Claude Code to semantically search your project documentation without reading massive files. Here's how to set it up:

### 1. Copy RAG Components

```bash
# From this template directory to your project
cp -r mcp_server /path/to/your/project/
cp -r scripts /path/to/your/project/
```

### 2. Update .mcp.json

Add the RAG server to your `.mcp.json`:

```json
{
  "mcpServers": {
    "docs-rag": {
      "type": "stdio",
      "command": "python",
      "args": ["mcp_server/rag_server.py"],
      "description": "Semantic search across project documentation using RAG"
    }
  }
}
```

### 3. Install Python Dependencies

```bash
pip install -r mcp_server/requirements.txt
```

This installs:
- `chromadb` - Vector database (local SQLite-based storage)
- `sentence-transformers` - Free local embedding model (all-MiniLM-L6-v2)
- `mcp` - MCP server SDK
- `tqdm` - Progress bars for indexing

**Note**: First run will download ~100MB embedding model from HuggingFace.

### 4. Create Docs Folder

Place your project documentation in a `Docs/` folder:

```bash
mkdir Docs
# Add your .md files to Docs/
```

You can organize with subfolders:
```
Docs/
├── Requirements/
│   ├── Auth-Requirements.md
│   └── API-Requirements.md
├── Architecture/
│   └── System-Design.md
└── Guidelines/
    └── Code-Standards.md
```

### 5. Index Your Documentation

Run the indexing script to create the vector database:

```bash
python scripts/index_docs.py
```

This will:
- Scan `Docs/` for all `.md` files
- Chunk documents by markdown headers
- Generate embeddings using sentence-transformers
- Store in `.chroma/` directory (automatically gitignored)

**Output example:**
```
Starting documentation indexing...
Docs folder: Docs
ChromaDB path: .chroma
Collection: documentation

Loading embedding model (all-MiniLM-L6-v2)...
Model loaded

Created collection: documentation
Found 15 markdown files

Processing files...
Created 127 chunks from 15 files

Generating embeddings and storing in ChromaDB...
Indexing complete!
```

### 6. Start Claude Code

```bash
claude
```

The RAG MCP server will auto-start and be available immediately.

### 7. Use RAG from Claude Code

Claude Code can now query your documentation:

```
"query_docs('authentication security requirements')"
"query_docs('API rate limiting', n_results=3)"
"query_docs('database schema', filter_path='Architecture/')"
```

Or ask naturally:
```
"Before implementing auth, check the requirements"
"What do our API guidelines say about error handling?"
"Find the database schema documentation"
```

### Maintenance

**Re-index after documentation changes:**

Option 1 - Via Claude Code:
```
"reindex_docs()"
```

Option 2 - Run script manually:
```bash
python scripts/index_docs.py
```

**View index statistics:**
```
"get_stats()"
```

### Configuration

Edit `scripts/index_docs.py` to customize:
- `DOCS_FOLDER` - Change from "Docs" to your folder name
- `CHUNK_SIZE` - Adjust chunk size (default: 1000 tokens)
- `CHUNK_OVERLAP` - Adjust overlap (default: 100 tokens)
- `EMBEDDING_MODEL` - Use different sentence-transformers model

### Technical Details

- **Storage**: Local SQLite database in `.chroma/` (~10MB per 1000 chunks)
- **Performance**: <100ms semantic search queries
- **Privacy**: 100% local, no external API calls after initial model download
- **Cost**: Free (no API fees)
- **Indexing Speed**: ~10-20 files/second
- **Memory**: ~500MB for embedding model during indexing

See [mcp_server/README.md](./mcp_server/README.md) for complete documentation, troubleshooting, and advanced configuration.

## Features

### Custom Agents

Specialized AI assistants with focused expertise:

- **md-documenter**: Creates clear, comprehensive markdown documentation
- **mermaid-expert**: Generates diagrams (flowcharts, sequence, class, ER, etc.)
- **code-reviewer**: Performs quality, security, and performance reviews
- **test-engineer**: Writes comprehensive test suites with high coverage

### Slash Commands

Quick workflows at your fingertips:

```bash
/review                    # Code review recent changes
/document <target>         # Create/update documentation
/test <target>            # Generate comprehensive tests
/diagram <subject>        # Create Mermaid diagrams
/refactor <target>        # Improve code quality
/fix-issue <description>  # Fix bugs systematically
/analyze <target>         # Comprehensive analysis
/setup-project <type>     # Initialize new project
```

### Workflows

Proven patterns for:
- Standard development
- Bug fixing
- Testing
- Documentation
- Code review
- Refactoring
- Git operations


### Documentation RAG System

Local Retrieval-Augmented Generation (RAG) system that provides semantic search across project documentation:

- **Semantic Search**: Query documentation using natural language
- **Local & Free**: Uses sentence-transformers (no API costs)
- **Fast Indexing**: ChromaDB vector database with automatic chunking
- **MCP Integration**: Accessible directly from Claude Code
- **Zero External Dependencies**: No API keys or internet required after setup

See [RAG Setup Guide](./mcp_server/README.md) for complete documentation.

## Project Structure

```
.
├── .claude/
│   ├── agents/              # Custom specialized agents
│   │   ├── md-documenter.md
│   │   ├── mermaid-expert.md
│   │   ├── code-reviewer.md
│   │   └── test-engineer.md
│   ├── commands/            # Custom slash commands
│   │   ├── review.md
│   │   ├── document.md
│   │   ├── test.md
│   │   └── ...
│   └── README.md           # .claude directory guide
├── Docs/                    # Template documentation
│   ├── Context.md          # Project background
│   ├── Research-Findings.md # Best practices research
│   ├── Workflows.md        # Detailed workflows
│   ├── MCP-Setup-Guide.md  # MCP configuration
│   ├── Persona-Configuration.md # Behavioral guidelines
│   └── How-To-Guide.md     # Complete usage guide
├── mcp_server/             # RAG MCP server
│   ├── rag_server.py       # MCP server implementation
│   ├── requirements.txt    # Python dependencies
│   └── README.md           # RAG setup guide
├── scripts/
│   └── index_docs.py       # Documentation indexing script
├── CLAUDE.md               # Main configuration file
├── .mcp.json              # MCP server configuration
├── .gitignore             # Includes Claude-specific ignores
└── README.md              # This file
```

## Documentation

### For Users
- **[Quick Start](#quick-start)**: Get up and running in 5 minutes
- **[How-To Guide](./Docs/How-To-Guide.md)**: Complete usage guide
- **[Workflows](./Docs/Workflows.md)**: Development patterns and best practices
- **[MCP Setup Guide](./Docs/MCP-Setup-Guide.md)**: Configure MCP servers
- **[RAG Setup Guide](./mcp_server/README.md)**: Documentation semantic search system

### For Understanding
- **[Context](./Docs/Context.md)**: Project goals and design principles
- **[Research Findings](./Docs/Research-Findings.md)**: Best practices research
- **[Persona Configuration](./Docs/Persona-Configuration.md)**: Behavioral guidelines

## Usage Examples

### Creating Documentation
```
"Create a README for this authentication module"
"/document UserService"
"Write API documentation for the REST endpoints"
```

### Generating Diagrams
```
"/diagram authentication-flow"
"Create a database schema diagram"
"Show the system architecture as a flowchart"
```

### Code Review
```
"/review"
"Review this file for security issues"
"Check the recent changes for performance problems"
```

### Writing Tests
```
"/test UserController"
"Write integration tests for the API"
"Add edge case tests for the validation function"
```

### Refactoring
```
"/refactor src/utils/validation.js"
"Clean up the UserService class"
"Improve the naming in this module"
```

## Customization

### Add Custom Agents

Create `.claude/agents/my-agent.md`:
```markdown
---
name: my-agent
description: When this agent should be invoked
tools: Read, Write, Grep
model: sonnet
---

System prompt defining the agent's role...
```

### Add Custom Commands

Create `.claude/commands/my-command.md`:
```markdown
Do something with $ARGUMENTS following these steps...
```

Use it: `/my-command target`

### Configure MCP Servers

Add to `.mcp.json` or use CLI:
```bash
claude mcp add --transport http notion https://mcp.notion.com/mcp
claude mcp add --scope user github -- npx -y @modelcontextprotocol/server-github
```

## Best Practices

### Development Workflow
```
Plan → Small Diff → Tests → Review → Commit
```

### Context Management
- Scope to one feature at a time
- Use `/clear` between unrelated tasks
- Create checkpoints before risky changes

### Code Quality
- Follow language-specific conventions
- Aim for 80%+ test coverage
- Review code before committing
- Document architectural decisions

### Security
- Never commit secrets
- Validate all input
- Use parameterized queries
- Review for vulnerabilities

## Target Audience

Single developers using Claude Code PRO subscription who want:
- Consistent, efficient workflows
- Reusable templates across projects
- Best practices baked in
- Quick setup for new projects

## Technical Requirements

- **Claude Code**: PRO subscription
- **Node.js**: For MCP servers (npm/npx)
- **Git**: For version control workflows

## Language Support

This template is language-agnostic and works with:
- JavaScript/TypeScript (React, Next.js, Node.js)
- Python
- C# (.NET)
- Go
- And more...

Customize `CLAUDE.md` for your specific stack.

## Contributing

This is a living template that improves with use:

1. Use it in your projects
2. Identify what works and what doesn't
3. Add useful agents and commands
4. Document new patterns
5. Share improvements

## Design Principles

- **Clear Organization**: Intuitive structure, self-explanatory naming
- **Well-Documented**: Comprehensive guides and examples
- **Easy to Customize**: Direct editing, no complex configurations
- **Minimal Footprint**: Compact, doesn't bloat projects
- **Drop-In Ready**: Copy and go, minimal setup
- **Universal Compatibility**: Works across languages and frameworks

## Troubleshooting

**Agents not working?**
- Check `.claude/agents/` files exist
- Verify frontmatter format
- Restart Claude Code

**Commands not available?**
- Ensure `.md` extension on command files
- Type `/` to see available commands
- Check `.claude/commands/` directory

**MCP servers not connecting?**
- Run `claude mcp list` to verify configuration
- Check environment variables for API keys
- Restart Claude Code

See [How-To Guide](./Docs/How-To-Guide.md) for detailed troubleshooting.

## Support

- **Documentation**: Start with [How-To Guide](./Docs/How-To-Guide.md)
- **Official Docs**: https://docs.claude.com/claude-code
- **MCP Info**: https://modelcontextprotocol.io

## License

This template is provided as-is for use in your projects. Customize and adapt as needed.

## Version

**Current Version**: 1.0
**Last Updated**: 2025-01-XX
**Claude Code Version**: Compatible with latest

---

**Get Started**: Copy the template, customize CLAUDE.md, and start building with Claude Code's full power at your fingertips.
