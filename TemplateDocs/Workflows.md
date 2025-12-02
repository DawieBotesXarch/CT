# Claude Code Workflows

Common development workflows and patterns for effective Claude Code usage.

## Development Workflow

### Standard Development Pattern
```
1. Plan → 2. Small Diff → 3. Tests → 4. Review → 5. Commit
```

**Never skip steps under pressure**

### Starting a New Feature
1. `/clear` - Clear previous context
2. Read relevant files - Understand current implementation
3. Plan the approach - Think before coding
4. Implement incrementally - Small, testable changes
5. Add tests - Don't skip testing
6. `/review` - Code review before commit

### Bug Fixing Workflow
1. **Understand**: Read issue description and error messages
2. **Locate**: Find the relevant code
3. **Reproduce**: Verify you can reproduce the issue
4. **Root Cause**: Identify why it's failing (not just symptoms)
5. **Fix**: Implement the solution
6. **Test**: Add regression tests
7. **Verify**: Confirm fix works and nothing broke

### Code Review Workflow
1. `/review` - Run automated code review
2. `git diff` - See what changed
3. Focus on:
   - Security vulnerabilities
   - Performance issues
   - Code quality
   - Test coverage
4. Make fixes incrementally
5. Re-review after changes

### Refactoring Workflow
1. **Understand**: Read and comprehend current code
2. **Tests First**: Ensure good test coverage before starting
3. **Small Steps**: Refactor incrementally
4. **Run Tests**: After each change
5. **Commit Often**: Small, safe commits
6. **Document**: Explain significant changes

## Context Management

### Keeping Context Relevant
- **Scope to one feature**: Don't mix unrelated work
- **Clear when done**: `/clear` command after completing a feature
- **Add directories as needed**: `/add-dir` for multi-directory work
- **Checkpoint often**: Create save points before risky changes

### Multi-File Changes
```bash
# Start with understanding
Read all affected files

# Plan the changes
Outline modifications across files

# Implement systematically
Make changes in logical order

# Test incrementally
Verify after each file

# Review holistically
Check interactions between changes
```

## Testing Workflows

### Test-Driven Development (TDD)
```
1. Write failing test
2. Implement minimum code to pass
3. Run tests (should pass)
4. Refactor
5. Run tests again
6. Repeat
```

### Testing Existing Code
1. `/test ComponentName` - Generate tests
2. Review generated tests for completeness
3. Run tests and check coverage
4. Add missing edge case tests
5. Verify all tests pass

### E2E Testing with Playwright
1. Identify user workflows to test
2. Write Playwright tests
3. Run in multiple browsers
4. Check for flakiness
5. Add to CI/CD pipeline

## Documentation Workflows

### Creating Documentation
1. `/document feature-name` - Generate docs
2. Review for accuracy and completeness
3. Add examples and use cases
4. Include troubleshooting
5. Link to related documentation

### Updating Documentation
1. Identify outdated sections
2. Update with current information
3. Add new features/changes
4. Verify examples still work
5. Update table of contents if needed

## Diagram Creation Workflow

### System Documentation
1. `/diagram system-architecture` - Create diagram
2. Review for accuracy
3. Add descriptions and context
4. Place in appropriate documentation
5. Update as system evolves

### Process Documentation
1. Identify process to document
2. Create flowchart with Mermaid
3. Add decision points
4. Include error paths
5. Keep diagrams updated

## Git Workflows

### Feature Branch Workflow
```bash
# Start feature
git checkout -b feature/feature-name

# Work incrementally
git add .
git commit -m "Clear, descriptive message"

# Keep commits small and focused
# Commit often

# When complete
git push origin feature/feature-name
# Create pull request
```

### Commit Message Pattern
```
Type: Brief summary (50 chars max)

Detailed explanation if needed:
- What changed
- Why it changed
- Any breaking changes

Co-Authored-By: Claude <noreply@anthropic.com>
```

**Commit Types**: feat, fix, docs, refactor, test, chore

## Checkpoint & Rewind

### Creating Checkpoints
```bash
# Before risky operations
git add .
git commit -m "Checkpoint: Before refactoring auth"

# If things go wrong
Use /rewind to backtrack safely
```

### When to Checkpoint
- Before major refactoring
- Before trying experimental approaches
- Before bulk changes
- At end of work sessions

## Project Setup Workflow

### New Project
1. `/setup-project project-type` - Initialize project
2. Review and customize generated structure
3. Add project-specific CLAUDE.md rules
4. Configure MCP servers
5. Set up CI/CD
6. Create initial documentation

### Adding Claude Code to Existing Project
1. Create `.claude/` directory structure
2. Add CLAUDE.md with project conventions
3. Create `.claude/agents/` with useful agents
4. Add `.claude/commands/` with common commands
5. Configure `.mcp.json` if needed
6. Document setup in README

## Optimization Workflows

### Performance Optimization
1. `/analyze performance` - Identify bottlenecks
2. Measure current performance
3. Identify optimization opportunities
4. Implement improvements
5. Measure again
6. Document changes and results

### Code Quality Improvement
1. `/analyze code-quality` - Assess current state
2. Prioritize issues by impact
3. Fix critical issues first
4. Refactor incrementally
5. Add/improve tests
6. Document improvements

## Team Collaboration Workflows

### Onboarding New Team Member
1. Share CLAUDE.md conventions
2. Explain custom agents and commands
3. Show common workflows
4. Pair on first features
5. Review their code with `/review`

### Code Review Process
1. Create pull request
2. `/review` automated review
3. Team member manual review
4. Address feedback
5. Re-review
6. Merge when approved

## Emergency/Hotfix Workflow
```
1. Create hotfix branch from main
2. Reproduce issue
3. Implement minimal fix
4. Add regression test
5. Fast-track review
6. Deploy immediately
7. Merge to main and develop
```

## Continuous Improvement

### Regular Maintenance
- Weekly: Review and update documentation
- Monthly: Analyze and refactor technical debt
- Quarterly: Review and update agents/commands
- As needed: Update CLAUDE.md with new patterns

### Learning from Issues
1. Document root cause
2. Add to troubleshooting docs
3. Create tests to prevent recurrence
4. Update CLAUDE.md if pattern emerged
