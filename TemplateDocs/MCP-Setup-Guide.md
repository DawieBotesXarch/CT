# MCP (Model Context Protocol) Setup Guide

This guide explains how to configure and use MCP servers with this template.

## What is MCP?

MCP (Model Context Protocol) is an open standard that allows Claude Code to connect to external tools and data sources. It extends Claude's capabilities beyond its built-in tools.

## Pre-Configured Servers

This template comes with Playwright MCP pre-configured in `.mcp.json`:

### Playwright MCP
**Purpose**: Browser automation and end-to-end testing

**Capabilities**:
- Navigate web pages
- Interact with UI elements
- Take screenshots
- Run E2E test scenarios
- Test across multiple browsers
- Validate user workflows

**Usage Example**:
```
"Test the login flow on our web application"
"Take a screenshot of the homepage"
"Click the submit button and verify the result"
```

## Configuration Scopes

MCP servers can be configured at three levels:

### 1. Project Scope (Recommended for Team)
**File**: `.mcp.json` in project root
**Purpose**: Shared configuration, version controlled
**Best for**: Team projects, consistent tooling

### 2. Local Scope (Default)
**File**: `.claude/settings.local.json`
**Purpose**: Project-specific, private overrides
**Best for**: Personal preferences, API keys

### 3. User Scope
**File**: `~/.claude/settings.local.json`
**Purpose**: Available across all projects
**Best for**: Personal tools used everywhere

## Adding New MCP Servers

### Via CLI (Recommended)

**HTTP Transport** (Remote servers):
```bash
claude mcp add --transport http <name> <url>
```

Example:
```bash
claude mcp add --transport http notion https://mcp.notion.com/mcp
```

**Stdio Transport** (Local processes):
```bash
claude mcp add --transport stdio <name> -- <command> [args...]
```

Example:
```bash
claude mcp add --transport stdio github -- npx -y @modelcontextprotocol/server-github
```

**With Environment Variables**:
```bash
claude mcp add --transport stdio <name> --env KEY=value -- <command>
```

Example:
```bash
claude mcp add --transport stdio airtable --env AIRTABLE_API_KEY=your_key -- npx -y airtable-mcp-server
```

**Specify Scope**:
```bash
claude mcp add --scope project <name> --transport http <url>
claude mcp add --scope user <name> --transport stdio -- <command>
```

### Manual Configuration

Edit `.mcp.json` (project scope) or `.claude/settings.local.json` (local scope):

```json
{
  "mcpServers": {
    "server-name": {
      "type": "http",
      "url": "https://example.com/mcp",
      "description": "What this server does"
    },
    "local-tool": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "package-name"],
      "env": {
        "API_KEY": "your_key_here"
      },
      "description": "Local tool description"
    }
  }
}
```

## Managing MCP Servers

### List Configured Servers
```bash
claude mcp list
```

### Get Server Details
```bash
claude mcp get <server-name>
```

### Remove Server
```bash
claude mcp remove <server-name>
```

## Popular MCP Servers

### Development Tools

**GitHub**
```bash
claude mcp add --transport stdio github --env GITHUB_TOKEN=your_token -- npx -y @modelcontextprotocol/server-github
```
Capabilities: Repository management, issue tracking, pull requests

**GitLab**
```bash
claude mcp add --transport stdio gitlab --env GITLAB_TOKEN=your_token -- npx -y @modelcontextprotocol/server-gitlab
```
Capabilities: Similar to GitHub MCP

### Productivity Tools

**Notion**
```bash
claude mcp add --transport http notion https://mcp.notion.com/mcp
```
Capabilities: Read/write Notion pages and databases

**Slack**
```bash
claude mcp add --transport stdio slack --env SLACK_BOT_TOKEN=your_token -- npx -y @modelcontextprotocol/server-slack
```
Capabilities: Send messages, read channels, manage workspace

### Data & APIs

**Airtable**
```bash
claude mcp add --transport stdio airtable --env AIRTABLE_API_KEY=your_key -- npx -y airtable-mcp-server
```
Capabilities: Read/write Airtable bases

**PostgreSQL**
```bash
claude mcp add --transport stdio postgres --env DATABASE_URL=your_url -- npx -y @modelcontextprotocol/server-postgres
```
Capabilities: Query and manage PostgreSQL databases

### Testing & Automation

**Playwright** (Pre-configured)
```bash
claude mcp add --transport stdio playwright -- npx -y @modelcontextprotocol/server-playwright
```
Capabilities: Browser automation, E2E testing

**Puppeteer**
```bash
claude mcp add --transport stdio puppeteer -- npx -y @modelcontextprotocol/server-puppeteer
```
Capabilities: Similar to Playwright

## Security Best Practices

### API Keys & Secrets
- **Never commit API keys** to version control
- Use environment variables for sensitive data
- Store in `.claude/settings.local.json` (gitignored)
- Use separate keys for development and production

### Environment Variables
```json
{
  "mcpServers": {
    "secure-server": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "secure-package"],
      "env": {
        "API_KEY": "${YOUR_API_KEY_ENV_VAR}"
      }
    }
  }
}
```

Set environment variable before running Claude:
```bash
export YOUR_API_KEY_ENV_VAR=actual_key_value
claude
```

### Permissions
- Review MCP server capabilities before installing
- Only grant necessary permissions
- Audit access logs regularly
- Remove unused servers

## Troubleshooting

### Server Not Working
1. Check if server is listed: `claude mcp list`
2. Verify configuration: `claude mcp get <server-name>`
3. Check environment variables are set
4. Restart Claude Code
5. Check server logs (if available)

### Connection Issues
- **HTTP servers**: Verify URL is accessible
- **Stdio servers**: Ensure command/package exists
- **Environment variables**: Confirm they're set correctly
- **Permissions**: Check file/network permissions

### Common Errors

**"Server not found"**
- Server not installed: `claude mcp add ...`
- Wrong scope: Check project vs user vs local

**"Connection refused"**
- HTTP server down or URL incorrect
- Stdio command not executable
- Network/firewall blocking connection

**"Authentication failed"**
- API key incorrect or expired
- Environment variable not set
- Insufficient permissions

## Testing MCP Configuration

After adding an MCP server, test it:

```
"List available tools from [server-name]"
"Test [server-name] by [doing simple action]"
```

Example:
```
"List available tools from playwright"
"Test playwright by navigating to example.com"
```

## Custom MCP Servers

You can create custom MCP servers for your specific needs:

### Resources
- MCP Specification: https://modelcontextprotocol.io
- Example servers: https://github.com/modelcontextprotocol/servers
- TypeScript SDK: `@modelcontextprotocol/sdk`
- Python SDK: `mcp`

### Basic Structure
Custom MCP servers implement:
- **Resources**: Data sources (files, APIs, databases)
- **Tools**: Actions Claude can perform
- **Prompts**: Reusable prompt templates

## Enterprise Configuration

For enterprise deployments, MCP servers can be managed centrally:

### Managed Configuration Files
- **macOS**: `/Library/Application Support/ClaudeCode/managed-mcp.json`
- **Windows**: `C:\ProgramData\ClaudeCode\managed-mcp.json`
- **Linux**: `/etc/claude-code/managed-mcp.json`

These override local configurations for policy enforcement.

## Best Practices

### Organization
- Document all MCP servers in this file
- Group servers by purpose
- Use descriptive names
- Include descriptions in config

### Maintenance
- Regularly update MCP servers
- Remove unused servers
- Audit permissions quarterly
- Test after updates

### Team Collaboration
- Share `.mcp.json` via version control
- Document required environment variables
- Provide setup instructions
- Test on clean environments

## Next Steps

1. Review pre-configured Playwright MCP
2. Add MCP servers for your workflow
3. Test configuration
4. Document in project README
5. Share with team

## Support

- MCP Documentation: https://docs.anthropic.com/claude-code/mcp
- Community Servers: https://github.com/modelcontextprotocol/servers
- Issues: Report in project repository
