# CLAUDE.md

This will contain info that will need to be added to the new Claude.md file when a project is started with this template

## Personality

Keep all discussions concise and task-focused. Avoid banter and unnecessary commentary. Do not use exaggerated or motivational phrases such as “Amazing job,” “Great idea,” or similar expressions. Focus strictly on clear, accurate, and practical technical guidance.

## General Rules

**CRITICAL: NO CODING IS ALLOWED UNTIL PHASE 2. The user will explicitly indicate when Phase 1 is complete**

**When working on an item that will require a status update in the Claude.md file, make that update in the claude.md if it changed so future context won't do duplicate work**

**Always ask question if unsure about what to do. If more than 4 questions, create a file in the Docs\WIP folder and ask me to answer those questions there.**

**Considering that we use the Claude.code Pro account, which has limits that can run out, save work onto there documents as soon as it is done, so you don't run out of limits and then have not saved the document for work already completed.**

**Using the installed docs-rag MCP server, reindex_docs() everytime after a commit that changed the Docs, if it's a big enough commit to make sense (i.e not a single bug fix)**

**For committing to github, I will do the push, so you can commit.**

**Very important, we've installed a local RAG MCP server called "docs-rag". All /Docs documents are indexed on it. Use it to search to safe on Context**

### To use docs-rag:

`query_docs("authentication flow")`

→ returns relevant doc chunks with sources.

Other tools:

* `reindex_docs()` – rebuild index
* `get_stats()` – show index info

## OpenMemory - Persistent AI Memory

This project uses OpenMemory MCP for persistent memory across conversations.

### Always Store Important Information

**CRITICAL**: Proactively store important information to OpenMemory during every conversation using `openmemory_store`. While working on todo lists, save memories as items are ticked off the lists.

**When we start a new conversation and we ask to continue, always check last memories first**

**When committing, save a memory summary of the work just finished**

### What to Store Automatically
- **Project Decisions**: Architecture choices, tech stack selections, design patterns adopted
- **User Preferences**: Coding style, preferred libraries, development workflows
- **Important Context**: Project constraints, business logic, domain knowledge
- **Learnings**: Bug fixes, optimization discoveries, pattern insights
- **Standards**: Naming conventions, file organization, testing approaches

### What NOT to Store
- Temporary debugging information
- Code snippets (use files instead)
- Trivial or obvious decisions
- Sensitive data (passwords, API keys, secrets)

### Memory Usage Patterns

**At Conversation Start:**
- Query OpenMemory to retrieve relevant project context
- Reinforce critical memories to maintain salience

**During Development:**
- Store significant decisions and learnings immediately
- Tag memories appropriately for easy retrieval
- Use sectors: semantic (facts), procedural (how-to), episodic (events)

**Memory Structure:**
```json
{
  "content": "Clear, concise description of the knowledge",
  "tags": ["relevant", "searchable", "tags"],
  "metadata": {
    "project": "CT2",
    "category": "architecture|preference|learning",
    "date": "YYYY-MM-DD"
  }
}
```

### Salience Management
- Important memories start with high salience (0.8-1.0)
- Reinforce critical memories periodically
- Let trivial memories decay naturally


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

# Project Status:

Keep the project status up to date here:

[ ] Start project