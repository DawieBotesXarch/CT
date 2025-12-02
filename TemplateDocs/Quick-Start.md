# Quick Start Guide

Get up and running with the Claude Code Template in 5 minutes.

## Step 1: Copy Template (1 minute)

```bash
# Navigate to your project
cd /path/to/your/project

# Copy template files (from template directory)
cp -r /path/to/template/.claude ./
cp /path/to/template/CLAUDE.md ./
cp /path/to/template/.mcp.json ./        # Optional
cp /path/to/template/.gitignore ./       # Merge with existing
```

**Windows (PowerShell)**:
```powershell
Copy-Item -Recurse C:\path\to\template\.claude .\
Copy-Item C:\path\to\template\CLAUDE.md .\
Copy-Item C:\path\to\template\.mcp.json .\
```

## Step 2: Quick Customize (2 minutes)

Edit `CLAUDE.md` in your project:

```markdown
## Project Overview
[Describe your project in 1-2 sentences]

## Development Commands
npm run dev      # Start development server
npm test        # Run tests
npm run build   # Production build

## Architecture Notes
- Frontend: React with TypeScript
- Backend: Node.js + Express
- Database: PostgreSQL
```

## Step 3: Start Claude Code (30 seconds)

```bash
cd /path/to/your/project
claude
```

## Step 4: Verify Setup (1 minute)

Try these commands:

```
"List available custom agents"
```
Should show: md-documenter, mermaid-expert, code-reviewer, test-engineer

```
"List slash commands"
```
Should show: /review, /document, /test, /diagram, etc.

```
"What MCP servers are configured?"
```
Should show: playwright

## Step 5: Try It Out (30 seconds)

### Quick Test: Documentation
```
"/document README"
```

### Quick Test: Code Review
```
"/review"
```

### Quick Test: Diagram
```
"/diagram system-architecture"
```

## Common First Tasks

### Document Your Project
```
"Create a comprehensive README for this project"
"Document the API endpoints"
"Write a getting started guide"
```

### Understand Codebase
```
"Explain the architecture of this project"
"Show me a diagram of the data flow"
"What are the main components?"
```

### Improve Quality
```
"/review"
"Analyze code quality"
"What tests are missing?"
```

### Set Up Testing
```
"/test ComponentName"
"Create E2E tests for the login flow"
"Check test coverage"
```

## Cheat Sheet

### Custom Agents
- **md-documenter**: Documentation tasks
- **mermaid-expert**: Diagram creation
- **code-reviewer**: Code reviews
- **test-engineer**: Test generation

### Slash Commands
- `/review` - Code review
- `/document <target>` - Create docs
- `/test <target>` - Generate tests
- `/diagram <subject>` - Create diagram
- `/refactor <target>` - Improve code
- `/fix-issue <desc>` - Fix bugs
- `/analyze <target>` - Comprehensive analysis

### Workflow Pattern
```
Plan → Small Diff → Tests → Review → Commit
```

### Context Management
- `/clear` - Fresh start
- Scope to one feature
- Create checkpoints before risky changes

## Next Steps

1. ✅ **Template installed**
2. ✅ **Basic customization done**
3. ✅ **Verified working**

Now:
- **Explore**: Try different agents and commands
- **Customize**: Add project-specific commands
- **Document**: Keep CLAUDE.md updated
- **Share**: Use across your projects

## Need Help?

- **Full Guide**: See [How-To-Guide.md](./How-To-Guide.md)
- **Workflows**: See [Workflows.md](./Workflows.md)
- **MCP Setup**: See [MCP-Setup-Guide.md](./MCP-Setup-Guide.md)
- **Troubleshooting**: Check [How-To-Guide.md#troubleshooting](./How-To-Guide.md#troubleshooting)

## Pro Tips

1. **Start Small**: Try one agent/command at a time
2. **Update CLAUDE.md**: Add patterns as you discover them
3. **Use /clear**: Between unrelated tasks
4. **Review First**: Run `/review` before committing
5. **Document Decisions**: Keep CLAUDE.md current

## Success Checklist

- [ ] Template files copied
- [ ] CLAUDE.md customized with project info
- [ ] Verified agents available
- [ ] Verified slash commands work
- [ ] Tried at least one command
- [ ] Ready to develop efficiently!

**You're all set!** Start using Claude Code with your new template.
