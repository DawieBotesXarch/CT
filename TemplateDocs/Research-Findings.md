# Research Findings: Claude Code Best Practices

## Key Discoveries

### 1. CLAUDE.md Files
**Purpose**: Special markdown file that Claude automatically reads for project context

**Hierarchy** (in order of loading):
1. User-level: `~/.claude/CLAUDE.md` (global preferences)
2. Project root: `./CLAUDE.md` (project-wide conventions)
3. Directory-specific: `./subdir/CLAUDE.md` (scope-specific rules)

**What to Include**:
- Code conventions and style guidelines
- Common bash commands (build, test, lint)
- Key architectural patterns
- Testing instructions
- Anti-patterns to avoid
- Known tech debt
- Branch naming conventions
- Developer environment setup

**Best Practices**:
- Keep concise and human-readable
- Check into git for team sharing
- Focus on "what" not "why" (context over rationale)
- Structure as modules: task context, rules, numbered steps, examples

### 2. Custom Slash Commands
**Location**: `.claude/commands/` directory

**Format**: Markdown files with `.md` extension
- Filename becomes command name
- Content is natural language prompt template
- Use `$ARGUMENTS` keyword for parameter passing

**Example Structure**:
```markdown
<!-- .claude/commands/fix-issue.md -->
Read the GitHub issue #$ARGUMENTS and create a fix following our testing standards.
```

**Usage**: `/fix-issue 1234`

**Features**:
- No installation or setup required
- Automatically recognized by Claude
- Can be checked into git
- Available through `/` menu

### 3. Custom Agents (Subagents)
**Location**:
- Project-level: `.claude/agents/`
- User-level: `~/.claude/agents/`

**Format**: Markdown with frontmatter
```markdown
---
name: agent-name
description: When this agent should be invoked
tools: Read, Grep, Glob, Bash  # Optional, comma-separated
model: sonnet  # Optional: sonnet, haiku, inherit
---

System prompt and instructions for the agent...
```

**Tool Access**:
- Can specify individual tools or inherit all
- Supports MCP server tools
- Configure via `/agents` command

**Key Features**:
- Separate context window
- Specialized expertise
- Reusable across projects
- Proactive invocation based on description

**Best Practice**: Generate with Claude first, then customize

### 4. MCP (Model Context Protocol) Configuration

**Scope Levels**:
1. **User Scope** (`--scope user`): Available across all projects
2. **Project Scope** (`--scope project`): Stored in `.mcp.json`, version-controlled
3. **Local Scope** (default): Project-specific, private to current user

**Configuration Methods**:

**HTTP Transport** (Recommended for remote servers):
```bash
claude mcp add --transport http <name> <url>
```

**Stdio Transport** (Local processes):
```bash
claude mcp add --transport stdio <name> -- npx -y <package>
```

**With Environment Variables**:
```bash
claude mcp add --transport stdio <name> --env KEY=value -- <command>
```

**Management Commands**:
```bash
claude mcp list              # Show all servers
claude mcp get <server>      # Get server details
claude mcp remove <server>   # Remove server
```

**Configuration File Format** (`.mcp.json`):
```json
{
  "mcpServers": {
    "server-name": {
      "type": "http",
      "url": "https://example.com/mcp"
    },
    "local-server": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "package-name"],
      "env": {
        "API_KEY": "your_key"
      }
    }
  }
}
```

### 5. Workflow Patterns

**Context Management**:
- Scope chat to one project/feature
- Use `/clear` command when done with a feature
- Keep context relevant

**Development Approach**:
- Plan → Small Diff → Tests → Review
- Never skip steps under pressure
- Read files first, don't write code yet

**Multi-Directory Support**:
- CLI: `--add-dir` flag when starting
- Mid-session: `/add-dir` command

**Checkpoints & Rewind**:
- Create checkpoints before risky operations
- Use `/rewind` to backtrack safely

### 6. Claude Code PRO Limitations

**Context Window**:
- Manage token usage carefully
- Clear context regularly
- Scope conversations appropriately

**Rate Limits**:
- Be mindful of request frequency
- Batch operations when possible

**Feature Availability**:
- Some enterprise features not available
- MCP servers work with PRO
- Custom agents/commands fully supported

## Template Requirements Based on Research

### Must-Have Components
1. ✅ CLAUDE.md with hierarchical structure
2. ✅ `.claude/commands/` with common slash commands
3. ✅ `.claude/agents/` with MD Documenter and Mermaid Expert
4. ✅ `.mcp.json` with Playwright configuration
5. ✅ How-to guide documentation
6. ✅ Example workflows and patterns

### Optional Components
- `.claude/settings.local.json` for local overrides
- Project-specific hooks
- Custom personas/behavioral rules
- Additional specialized agents

## Community Patterns Discovered

### Frameworks Worth Noting
- **SuperClaude Framework**: Specialized commands and cognitive personas
- **ContextKit**: 4-phase planning methodology
- **RIPER Workflow**: Research → Innovate → Plan → Execute → Review
- **AB Method**: Large problems into focused incremental missions

### Best Practices from Community
- Agent-first design approach
- Systematic workflows over ad-hoc requests
- Documentation as code
- Living templates that evolve with project
