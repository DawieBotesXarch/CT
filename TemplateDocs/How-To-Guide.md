# How-To Guide: Using the Claude Code Template

Complete guide for using this template effectively in your projects.

## Table of Contents
1. [Getting Started](#getting-started)
2. [Using Custom Agents](#using-custom-agents)
3. [Using Slash Commands](#using-slash-commands)
4. [Working with MCP Servers](#working-with-mcp-servers)
5. [Following Workflows](#following-workflows)
6. [Customizing the Template](#customizing-the-template)
7. [Best Practices](#best-practices)
8. [Troubleshooting](#troubleshooting)

## Getting Started

### Installation

1. **Copy template to your project**:
   ```bash
   # From this template directory
   cp -r .claude /path/to/your/project/
   cp CLAUDE.md /path/to/your/project/
   cp .mcp.json /path/to/your/project/  # Optional
   cp .gitignore /path/to/your/project/  # Merge with existing
   ```

2. **Update .gitignore**:
   Ensure `.claude/settings.local.json` is ignored:
   ```
   .claude/settings.local.json
   ```

3. **Customize CLAUDE.md**:
   - Update project overview
   - Add language-specific conventions
   - Document project-specific commands
   - Add architectural notes

4. **Start Claude Code**:
   ```bash
   cd /path/to/your/project
   claude
   ```

### Verification

Check that everything is set up:
```
"List available custom agents"
"List available slash commands"
"What MCP servers are configured?"
```

## Using Custom Agents

### What Are Agents?

Agents are specialized AI assistants with specific expertise and separate context windows. They're invoked automatically based on task type or explicitly when needed.

### Available Agents

#### MD Documenter
**Purpose**: Create and maintain markdown documentation

**When to use**:
- Creating README files
- Writing technical guides
- API documentation
- Architecture documentation

**Example usage**:
```
"Create a README for this project"
"Document the API endpoints"
"Write a user guide for the authentication system"
```

**Explicit invocation**:
```
"Use md-documenter to create comprehensive API documentation"
```

#### Mermaid Expert
**Purpose**: Create diagrams and visualizations

**When to use**:
- System architecture diagrams
- Process flows
- Database schemas
- Sequence diagrams

**Example usage**:
```
"Create a flowchart for the checkout process"
"Diagram the database schema"
"Show the authentication flow as a sequence diagram"
```

**Diagram types available**:
- Flowchart: Process flows, workflows
- Sequence: API interactions, communications
- Class: Object models, relationships
- State: State machines, transitions
- ER: Database schemas
- Gantt: Project timelines

#### Code Reviewer
**Purpose**: Perform code quality and security reviews

**When to use**:
- Before committing changes
- During pull request review
- Assessing code quality
- Security audits

**Example usage**:
```
"Review the recent changes"
"/review"
"Check this file for security issues"
```

**Review covers**:
- Code quality and readability
- Security vulnerabilities
- Performance concerns
- Error handling
- Test coverage

#### Test Engineer
**Purpose**: Write and maintain test suites

**When to use**:
- Creating unit tests
- Writing integration tests
- E2E test scenarios
- Test coverage analysis

**Example usage**:
```
"/test UserService"
"Write tests for the authentication module"
"Check test coverage and add missing tests"
```

**Test types**:
- Unit tests for business logic
- Integration tests for APIs
- E2E tests with Playwright
- Coverage analysis

### Creating Custom Agents

1. Create a new markdown file in `.claude/agents/`:
   ```bash
   touch .claude/agents/my-agent.md
   ```

2. Add frontmatter and system prompt:
   ```markdown
   ---
   name: my-agent
   description: When this agent should be invoked
   tools: Read, Write, Grep, Bash  # Optional
   model: sonnet  # Optional: sonnet, haiku, inherit
   ---

   System prompt describing the agent's role and behavior...
   ```

3. Test the agent:
   ```
   "Use my-agent to [do something]"
   ```

### Agent Best Practices

- **Specific descriptions**: Help Claude know when to invoke
- **Appropriate tools**: Grant only necessary tool access
- **Clear instructions**: Define behavior and standards
- **Test thoroughly**: Verify agent works as expected

## Using Slash Commands

### What Are Slash Commands?

Slash commands are reusable prompt templates for common tasks. Type `/` to see available commands.

### Built-In Commands

#### /review
**Purpose**: Code review of recent changes

**Usage**:
```
/review
```

**What it does**:
1. Runs `git diff` to see changes
2. Analyzes code quality
3. Checks security
4. Reviews performance
5. Provides prioritized feedback

#### /document <target>
**Purpose**: Create or update documentation

**Usage**:
```
/document UserService
/document authentication-flow
/document
```

**With no argument**: Analyzes project and suggests missing documentation

#### /test <target>
**Purpose**: Generate comprehensive tests

**Usage**:
```
/test UserController
/test utils/validation
```

**Creates**:
- Unit tests for functions/classes
- Edge case coverage
- Error scenario tests
- Runs and reports results

#### /diagram <subject>
**Purpose**: Create Mermaid diagrams

**Usage**:
```
/diagram authentication-flow
/diagram database-schema
/diagram system-architecture
```

**Automatically selects** appropriate diagram type based on subject

#### /refactor <target>
**Purpose**: Improve code quality while maintaining functionality

**Usage**:
```
/refactor UserService.js
/refactor src/utils
```

**Focus areas**:
- Remove duplication
- Improve naming
- Reduce complexity
- Enhance readability

#### /fix-issue <description>
**Purpose**: Fix bugs systematically

**Usage**:
```
/fix-issue Login fails with special characters in password
/fix-issue #123
```

**Process**:
1. Understand the issue
2. Locate relevant code
3. Identify root cause
4. Implement fix
5. Add regression tests

#### /analyze <target>
**Purpose**: Comprehensive analysis

**Usage**:
```
/analyze architecture
/analyze performance
/analyze security
```

**Covers**:
- Architecture and design
- Code quality
- Performance
- Security
- Testing
- Documentation

#### /setup-project <type>
**Purpose**: Initialize new project

**Usage**:
```
/setup-project react
/setup-project python-api
/setup-project nextjs
```

**Creates**:
- Directory structure
- Configuration files
- README
- Testing setup
- CLAUDE.md with conventions

### Creating Custom Commands

1. Create markdown file in `.claude/commands/`:
   ```bash
   echo "Your command prompt here" > .claude/commands/my-command.md
   ```

2. Use `$ARGUMENTS` for parameters:
   ```markdown
   Analyze the performance of $ARGUMENTS and provide optimization recommendations.
   ```

3. Test the command:
   ```
   /my-command UserService
   ```

### Command Best Practices

- **Clear instructions**: Be specific about what to do
- **Use $ARGUMENTS**: Make commands reusable
- **Structured output**: Request organized results
- **Action-oriented**: Focus on doing, not planning

## Working with MCP Servers

### What Are MCP Servers?

MCP (Model Context Protocol) servers extend Claude's capabilities with external tools and data sources.

### Using Playwright MCP

The template includes Playwright MCP for browser automation:

**Navigate pages**:
```
"Navigate to https://example.com"
"Go to the login page"
```

**Interact with elements**:
```
"Click the submit button"
"Fill in the email field with test@example.com"
"Select 'Option 1' from the dropdown"
```

**Take screenshots**:
```
"Take a screenshot of the current page"
"Screenshot the error message"
```

**Test workflows**:
```
"Test the login flow with valid credentials"
"Verify the checkout process works"
```

### Adding More MCP Servers

See [MCP-Setup-Guide.md](./MCP-Setup-Guide.md) for detailed instructions.

**Quick add**:
```bash
claude mcp add --transport http notion https://mcp.notion.com/mcp
claude mcp add --transport stdio github -- npx -y @modelcontextprotocol/server-github
```

### MCP Best Practices

- **Project scope** for team tools (`.mcp.json`)
- **User scope** for personal tools
- **Environment variables** for API keys
- **Test after adding** new servers

## Following Workflows

### Development Workflow

```
1. /clear              # Fresh context
2. Read relevant files # Understand current state
3. Plan approach       # Think before coding
4. Implement           # Small, incremental changes
5. Add tests          # Don't skip testing
6. /review            # Code review
7. Commit             # Git commit with message
```

### Bug Fixing Workflow

```
1. Understand issue    # Read description, error messages
2. Reproduce          # Verify you can reproduce
3. Locate code        # Find relevant files
4. Root cause         # Why is it failing?
5. Fix               # Implement solution
6. Test              # Add regression tests
7. Verify            # Confirm fix works
```

### Testing Workflow

```
1. /test Component    # Generate tests
2. Review tests       # Check completeness
3. Run tests          # Verify they pass
4. Check coverage     # Identify gaps
5. Add edge cases     # Fill in missing tests
```

### Documentation Workflow

```
1. /document feature  # Generate documentation
2. Review accuracy    # Verify correctness
3. Add examples       # Include use cases
4. Link related docs  # Connect to other documentation
5. Keep updated       # Maintain over time
```

For more workflows, see [Workflows.md](./Workflows.md).

## Customizing the Template

### For Your Project

1. **Update CLAUDE.md**:
   - Add language-specific conventions
   - Document build/test commands
   - Include project-specific patterns
   - Note architectural decisions

2. **Add/Remove Agents**:
   - Create project-specific agents
   - Remove unused agents
   - Customize existing agents

3. **Create Commands**:
   - Add project-specific slash commands
   - Automate common tasks
   - Document build/deployment commands

4. **Configure MCP**:
   - Add needed MCP servers
   - Set up API keys
   - Test configuration

### For Your Organization

1. **Standardize across teams**:
   - Common agents for all projects
   - Standard slash commands
   - Shared MCP servers

2. **Create templates per stack**:
   - React/Next.js template
   - Python API template
   - C# .NET template

3. **Document conventions**:
   - Code style guides
   - Testing standards
   - Security requirements

## Best Practices

### Context Management
- Scope to one feature at a time
- Use `/clear` between unrelated tasks
- Keep context relevant
- Create checkpoints before risky changes

### Code Quality
- Follow the Plan → Diff → Test → Review pattern
- Write tests early
- Review before committing
- Refactor continuously

### Documentation
- Keep documentation current
- Include examples
- Document decisions
- Link related documentation

### Security
- Review code for vulnerabilities
- Never commit secrets
- Use environment variables
- Validate input

### Testing
- Aim for 80%+ coverage
- Test edge cases
- Test error handling
- Keep tests maintainable

## Troubleshooting

### Agents Not Working

**Check if agent exists**:
```bash
ls .claude/agents/
```

**Verify frontmatter format**:
```markdown
---
name: agent-name
description: Description
---
```

**Restart Claude Code**

### Commands Not Available

**Check command files**:
```bash
ls .claude/commands/
```

**Verify `.md` extension**: Commands must be `.md` files

**Type `/`**: See list of available commands

### MCP Servers Not Connecting

**List servers**:
```bash
claude mcp list
```

**Check configuration**:
```bash
claude mcp get <server-name>
```

**Verify environment variables**: API keys set correctly

**Restart Claude Code**

### Performance Issues

**Clear context**: `/clear` to start fresh

**Reduce scope**: Focus on one feature

**Remove unused MCP servers**: `claude mcp remove <name>`

### Git Issues

**Check status**: `git status`

**Verify branch**: Not on main/master

**Review changes**: `git diff`

## Next Steps

1. Copy template to your project
2. Customize CLAUDE.md
3. Try slash commands: `/review`, `/document`, `/test`
4. Use agents for specialized tasks
5. Configure additional MCP servers as needed
6. Share with your team

## Additional Resources

- [Context.md](./Context.md) - Project background and goals
- [Research-Findings.md](./Research-Findings.md) - Best practices research
- [Workflows.md](./Workflows.md) - Detailed workflow patterns
- [MCP-Setup-Guide.md](./MCP-Setup-Guide.md) - MCP configuration details
- [Persona-Configuration.md](./Persona-Configuration.md) - Behavioral guidelines

## Support

For issues or questions:
1. Check this guide
2. Review relevant documentation
3. Test with simple examples
4. Verify configuration files
5. Restart Claude Code

## Contributing

Improve this template:
1. Try it in real projects
2. Identify what works/doesn't work
3. Add useful agents/commands
4. Document patterns
5. Share improvements
