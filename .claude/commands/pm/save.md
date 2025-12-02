---
name: save
description: "Save project context and session discoveries to documentation"
category: session
complexity: standard
---

# /pm:save - Session Context Documentation

## Triggers
- Session completion and project context documentation needs
- Progress checkpoint creation and work summary requests
- Discovery archival and learning capture scenarios
- Project understanding preservation requirements

## Usage
```
/pm:save [--type session|learnings|context|all] [--summarize] [--checkpoint]
```

## Behavioral Flow
1. **Analyze**: Examine session progress and identify key discoveries and learnings
2. **Document**: Create comprehensive documentation of work completed and insights gained
3. **Organize**: Structure documentation for future reference and team knowledge sharing
4. **Archive**: Save to appropriate project documentation locations (docs/, .notes/, etc.)
5. **Summary**: Generate session summary with accomplishments and next steps

Key behaviors:
- Session work documentation and progress tracking
- Learning and discovery capture for project knowledge base
- Checkpoint documentation for complex multi-session work
- Structured documentation for team knowledge sharing

## Tool Coordination
- **Write**: Documentation creation in markdown format
- **Read/Grep/Glob**: Session work analysis and discovery identification
- **TodoRead**: Task completion tracking for progress documentation
- **Bash**: Git status and change analysis for work summary

## Key Patterns
- **Session Documentation**: Work review → accomplishment summary → learning capture → next steps
- **Progress Checkpoints**: Current state → key decisions → remaining work → context preservation
- **Learning Capture**: Discoveries → patterns → insights → best practices
- **Context Preservation**: Project state → technical decisions → rationale → future reference

## Examples

### Basic Session Documentation
```
/pm:save
# Documents current session work and key learnings
# Creates session-notes.md with accomplishments and insights
```

### Comprehensive Session Checkpoint
```
/pm:save --type all --checkpoint
# Complete session documentation with checkpoint for complex work
# Includes progress, decisions, and context for continuation
```

### Session Summary Generation
```
/pm:save --summarize
# Creates concise session summary with key accomplishments
# Suitable for team updates and progress tracking
```

### Learnings-Only Documentation
```
/pm:save --type learnings
# Captures only new patterns and insights discovered during session
# Updates project knowledge base without full session details
```

## Standard Documentation Locations
- `docs/session-notes/` - Session-specific documentation
- `docs/decisions/` - Technical decision records
- `docs/learnings/` - Project insights and patterns
- `.notes/checkpoints/` - Work-in-progress checkpoints

## Boundaries

**Will:**
- Create comprehensive session documentation and work summaries
- Capture learnings and discoveries for project knowledge base
- Generate checkpoints for complex multi-session work

**Will Not:**
- Modify project code or configuration
- Override existing documentation without confirmation
- Make assumptions about what should be documented
