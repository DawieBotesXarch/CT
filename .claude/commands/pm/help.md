---
name: help
description: "List all available /pm commands and their functionality"
category: utility
complexity: low
---

# /pm:help - Command Reference Documentation

## Triggers
- Command discovery and reference lookup requests
- Framework exploration and capability understanding needs
- Documentation requests for available commands

## Behavioral Flow
1. **Display**: Present complete command list with descriptions
2. **Complete**: End interaction after displaying information

Key behaviors:
- Information display only - no execution or implementation
- Reference documentation mode without action triggers

Here is a complete list of all available `/pm` commands.

| Command | Description |
|---|---|
| `/pm:analyze` | Comprehensive code analysis across quality, security, performance, and architecture domains |
| `/pm:brainstorm` | Interactive requirements discovery through Socratic dialogue and systematic exploration |
| `/pm:build` | Build, compile, and package projects with intelligent error handling and optimization |
| `/pm:business-panel` | Multi-expert business analysis with adaptive interaction modes |
| `/pm:cleanup` | Systematically clean up code, remove dead code, and optimize project structure |
| `/pm:design` | Design system architecture, APIs, and component interfaces with comprehensive specifications |
| `/pm:document` | Generate focused documentation for components, functions, APIs, and features |
| `/pm:estimate` | Provide development estimates for tasks, features, or projects with intelligent analysis |
| `/pm:explain` | Provide clear explanations of code, concepts, and system behavior with educational clarity |
| `/pm:git` | Git operations with intelligent commit messages and workflow optimization |
| `/pm:help` | List all available /pm commands and their functionality |
| `/pm:implement` | Feature and code implementation with intelligent agent coordination |
| `/pm:improve` | Apply systematic improvements to code quality, performance, and maintainability |
| `/pm:index` | Generate comprehensive project documentation and knowledge base with intelligent organization |
| `/pm:project-manager` | Strategic project orchestration, stakeholder coordination, and delivery management |
| `/pm:reflect` | Task reflection and validation with quality assessment |
| `/pm:select-tool` | Intelligent tool selection based on complexity scoring and operation analysis |
| `/pm:spawn` | Meta-system task orchestration with intelligent breakdown and delegation |
| `/pm:spec-panel` | Multi-expert specification review and improvement using renowned specification and software engineering experts |
| `/pm:task` | Execute complex tasks with intelligent workflow management and delegation |
| `/pm:test` | Execute tests with coverage analysis and automated quality reporting |
| `/pm:troubleshoot` | Diagnose and resolve issues in code, builds, deployments, and system behavior |
| `/pm:workflow` | Generate structured implementation workflows from PRDs and feature requirements |

## Available Agents

These specialized agents can be invoked automatically by commands or explicitly for specific tasks:

### Core Agents
- **architect**: System architecture, design patterns, technical decisions
- **code-reviewer**: Code quality and security reviews
- **test-engineer**: Test suite creation and quality assurance
- **md-documenter**: Markdown documentation and technical writing
- **mermaid-expert**: Diagram and visualization creation

### Specialized Agents
- **security-specialist**: Security audits, threat modeling, OWASP compliance
- **performance-engineer**: Performance optimization, profiling, bottleneck analysis
- **database-expert**: Schema design, query optimization, migrations
- **devops-engineer**: CI/CD, Docker, Kubernetes, infrastructure
- **frontend-specialist**: Accessibility, responsive design, UI/UX
- **refactoring-specialist**: Code cleanup, technical debt, refactoring patterns
- **api-designer**: REST/GraphQL API design, OpenAPI specs

## Standard Options

Many commands support these common options:

### Analysis Depth
- `--depth quick|normal|deep` - Control analysis thoroughness
- `--focus domain` - Target specific analysis domain

### Execution Control
- `--safe` - Conservative changes with maximum validation
- `--interactive` - User guidance for complex decisions
- `--preview` - Show changes before applying
- `--validate` - Extra validation before execution

### Output Control
- `--verbose` - Detailed output and diagnostic information
- `--format text|json|report` - Output format selection
- `--breakdown` - Detailed breakdown of complex operations

## Usage Examples

### Comprehensive Project Analysis
```
/pm:analyze --depth deep --focus security
```

### Feature Implementation with Testing
```
/pm:implement user-authentication --safe --with-tests
```

### Safe Code Cleanup
```
/pm:cleanup src/ --type code --safe --interactive
```

### Project Status and Management
```
/pm:project-manager --status-report --week 12
```

## Boundaries

**Will:**
- Display comprehensive list of available commands
- Provide clear descriptions of each command's functionality
- Present information in readable tabular format

**Will Not:**
- Execute any commands or create any files
- Activate implementation modes or start projects
- Engage TodoWrite or any execution tools

---

**Note:** This list is manually generated and may become outdated. If you suspect it is inaccurate, please update it or contact a maintainer.
