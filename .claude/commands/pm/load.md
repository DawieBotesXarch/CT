---
name: load
description: "Load project context and documentation for session initialization"
category: session
complexity: standard
---

# /pm:load - Project Context Loading

## Triggers
- Session initialization and project context review requests
- Project onboarding and context understanding needs
- Checkpoint restoration and work continuation scenarios
- Documentation review and knowledge refresh requirements

## Usage
```
/pm:load [target] [--type project|config|docs|checkpoint] [--refresh] [--analyze]
```

## Behavioral Flow
1. **Discover**: Identify available project documentation and context files
2. **Read**: Load relevant documentation, decisions, and checkpoint files
3. **Analyze**: Parse project structure, configuration, and key patterns
4. **Summarize**: Present project overview and current state
5. **Prepare**: Ready context for efficient development workflow

Key behaviors:
- Project documentation and context review
- Configuration and structure analysis
- Checkpoint loading for work continuation
- Quick project state understanding

## Tool Coordination
- **Read**: Documentation and configuration file loading
- **Glob**: Project structure and documentation discovery
- **Grep**: Key pattern and decision identification
- **Bash**: Environment and dependency analysis

## Key Patterns
- **Project Initialization**: Structure analysis → documentation review → context establishment
- **Checkpoint Restoration**: Checkpoint loading → context validation → work continuation
- **Documentation Review**: Decision records → learnings → patterns → current state
- **Quick Start**: Essential info identification → rapid context building → workflow readiness

## Examples

### Basic Project Loading
```
/pm:load
# Loads current directory project context
# Reviews README, docs/, and key configuration files
```

### Specific Checkpoint Loading
```
/pm:load --type checkpoint --checkpoint session_123
# Restores specific checkpoint for work continuation
# Loads checkpoint documentation and context
```

### Comprehensive Project Analysis
```
/pm:load /path/to/project --type project --analyze
# Deep project analysis with documentation review
# Comprehensive context building for complex projects
```

### Documentation Review
```
/pm:load --type docs --refresh
# Reviews project documentation and decision records
# Updates context understanding with latest information
```

## Standard Documentation Locations
- `README.md` - Project overview and getting started
- `docs/` - Comprehensive project documentation
- `docs/decisions/` - Technical decision records
- `docs/session-notes/` - Session summaries and progress
- `.notes/checkpoints/` - Work-in-progress checkpoints
- `CLAUDE.md` - Project-specific instructions

## Boundaries

**Will:**
- Load and analyze project documentation and context
- Provide comprehensive project overview and current state
- Help establish efficient development workflow

**Will Not:**
- Modify project structure or configuration
- Make assumptions about project without documentation
- Override existing context without review
