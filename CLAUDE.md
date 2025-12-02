# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Claude Code Template Project** - a reusable, language-agnostic template for efficient AI-assisted development. It includes custom agents, slash commands, workflows, and best practices configurations.

**Purpose**: Provide a "living template" that can be dropped into any new project to immediately leverage Claude Code's full capabilities.

## Custom Agents Available

Use these specialized agents for specific tasks:

### Core Agents
- **md-documenter**: Creates and maintains markdown documentation
- **mermaid-expert**: Creates diagrams and visualizations
- **code-reviewer**: Performs code quality and security reviews
- **test-engineer**: Writes and maintains test suites

### Architecture & Design
- **architect**: System architecture, design patterns, technical decisions
- **refactoring-specialist**: Code cleanup, technical debt, refactoring patterns
- **api-designer**: REST/GraphQL API design, OpenAPI specs

### Quality & Performance
- **security-specialist**: Security audits, threat modeling, OWASP compliance
- **performance-engineer**: Performance optimization, profiling, bottleneck analysis

### Specialized
- **database-expert**: Schema design, query optimization, migrations
- **devops-engineer**: CI/CD, Docker, Kubernetes, infrastructure
- **frontend-specialist**: Accessibility, responsive design, UI/UX

Invoke agents automatically by asking for relevant tasks, or explicitly with the `/agents` command.

## Custom Slash Commands

Quick access to common workflows:

- `/review` - Code review of recent changes
- `/document <target>` - Create/update documentation
- `/test <target>` - Generate comprehensive tests
- `/diagram <subject>` - Create Mermaid diagrams
- `/refactor <target>` - Improve code quality
- `/fix-issue <description>` - Fix bugs systematically
- `/analyze <target>` - Comprehensive analysis
- `/setup-project <type>` - Initialize new project

## Development Workflow

### Standard Pattern
```
Plan → Small Diff → Tests → Review → Commit
```

**Never skip steps, especially under pressure**

### Starting Work
1. `/clear` to start fresh context
2. Read relevant files to understand
3. Plan before implementing
4. Make small, incremental changes
5. Test thoroughly
6. Review before committing

### Context Management
- Scope to one feature/task at a time
- Use `/clear` when switching contexts
- Use `/add-dir` for multi-directory work
- Create checkpoints before risky operations

## Code Conventions

### General Principles
- **Readability First**: Code is read more than written
- **DRY**: Don't Repeat Yourself
- **KISS**: Keep It Simple
- **YAGNI**: You Aren't Gonna Need It
- **Test Coverage**: Aim for 80%+ coverage

### Naming Conventions
- Use descriptive, self-documenting names
- Follow language-specific conventions (camelCase for JS, snake_case for Python, PascalCase for C#)
- No abbreviations unless widely understood
- Boolean variables start with `is`, `has`, `can`, `should`

### File Organization
- Group by feature/domain, not file type
- Keep related code together
- One primary export per file
- Maximum file length: 300 lines (guideline, not rule)

### Comments
- Explain **why**, not **what**
- Document complex algorithms
- Keep comments up-to-date
- Remove commented-out code

## Testing Standards

### Coverage Goals
- Business logic: 100%
- Utility functions: 100%
- API endpoints: 90%+
- UI components: 80%+

### Test Structure
```
// Arrange: Set up test data
// Act: Execute code being tested
// Assert: Verify results
```

### What to Test
- Happy path
- Edge cases
- Error handling
- Input validation
- Security-critical code

## Security Checklist

- Input validation and sanitization
- SQL injection prevention (parameterized queries)
- XSS prevention (proper escaping)
- Authentication and authorization checks
- Sensitive data protection
- Dependency vulnerability scanning
- No secrets in code or commits

## Git Practices

### Branch Naming
- `feature/feature-name` - New features
- `fix/bug-description` - Bug fixes
- `refactor/what-changed` - Refactoring
- `docs/what-documented` - Documentation

### Commit Messages
```
Type: Brief summary (50 chars max)

Detailed explanation if needed

Co-Authored-By: Claude <noreply@anthropic.com>
```

**Types**: feat, fix, docs, refactor, test, chore, style

### Before Committing
1. Run tests
2. Run linter
3. Review changes with `git diff`
4. Use `/review` for automated review

## Performance Guidelines

- Measure before optimizing
- Profile to find bottlenecks
- Consider Big-O complexity
- Cache appropriately
- Lazy load when possible
- Optimize database queries (avoid N+1)

## Documentation Standards

- README.md for project overview
- API documentation for public interfaces
- Inline documentation for complex logic
- Architecture decisions documented
- Keep documentation current
- While documenting and any questions arise, save a doc with questions into the Docs\WIP folder and let me answer them infile.

## Error Handling

- Catch specific exceptions, not generic
- Provide helpful error messages
- Log errors with context
- Fail fast for programming errors
- Handle gracefully for user errors

## Anti-Patterns to Avoid

- God objects (classes doing too much)
- Tight coupling
- Magic numbers (use named constants)
- Premature optimization
- Copy-paste programming
- Ignoring errors
- Not cleaning up resources

## When to Ask for Help

- Unclear requirements
- Security concerns
- Architecture decisions
- Breaking changes
- Performance problems
- Unfamiliar technology

## Continuous Improvement

This template evolves with discovered best practices. Update this file when you learn better patterns or identify common issues.
