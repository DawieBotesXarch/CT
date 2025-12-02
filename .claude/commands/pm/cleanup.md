---
name: cleanup
description: "Systematically clean up code, remove dead code, and optimize project structure"
category: workflow
complexity: standard
---

# /pm:cleanup - Code and Project Cleanup

## Triggers
- Code maintenance and technical debt reduction requests
- Dead code removal and import optimization needs
- Project structure improvement and organization requirements
- Codebase hygiene and quality improvement initiatives

## Usage
```
/pm:cleanup [target] [--type code|imports|files|all] [--safe|--aggressive] [--interactive]
```

## Behavioral Flow
1. **Analyze**: Assess cleanup opportunities and safety considerations across target scope
2. **Plan**: Choose cleanup approach and activate relevant agents for domain expertise
3. **Execute**: Apply systematic cleanup with intelligent dead code detection and removal
4. **Validate**: Ensure no functionality loss through testing and safety verification
5. **Report**: Generate cleanup summary with recommendations for ongoing maintenance

Key behaviors:
- Agent coordination (architect, code-reviewer, security-specialist) based on cleanup type
- Framework-specific cleanup patterns via WebSearch for best practices
- Systematic analysis for complex cleanup operations
- Safety-first approach with backup and rollback capabilities

## Agent Coordination
- **architect**: Project structure and organizational improvements
- **code-reviewer**: Code quality assessment and dead code identification
- **security-specialist**: Credentials and security-sensitive code handling
- **refactoring-specialist**: Safe refactoring and code modernization

## Tool Coordination
- **Read/Grep/Glob**: Code analysis and pattern detection for cleanup opportunities
- **Edit**: Safe code modification and structure optimization
- **TodoWrite**: Progress tracking for complex multi-file cleanup operations
- **Task**: Delegation for large-scale cleanup workflows requiring systematic coordination

## Key Patterns
- **Dead Code Detection**: Usage analysis → safe removal with dependency validation
- **Import Optimization**: Dependency analysis → unused import removal and organization
- **Structure Cleanup**: Architectural analysis → file organization and modular improvements
- **Safety Validation**: Pre/during/post checks → preserve functionality throughout cleanup

## Examples

### Safe Code Cleanup
```
/pm:cleanup src/ --type code --safe
# Conservative cleanup with automatic safety validation
# Removes dead code while preserving all functionality
```

### Import Optimization
```
/pm:cleanup --type imports --preview
# Analyzes and shows unused import cleanup without execution
# Framework-aware optimization via best practices
```

### Comprehensive Project Cleanup
```
/pm:cleanup --type all --interactive
# Multi-domain cleanup with user guidance for complex decisions
# Activates all agents for comprehensive analysis
```

### Framework-Specific Cleanup
```
/pm:cleanup components/ --aggressive
# Thorough cleanup with framework patterns via WebSearch
# Systematic analysis for complex dependency management
```

## Boundaries

**Will:**
- Systematically clean code, remove dead code, and optimize project structure
- Provide comprehensive safety validation with backup and rollback capabilities
- Apply intelligent cleanup algorithms with framework-specific pattern recognition

**Will Not:**
- Remove code without thorough safety analysis and validation
- Override project-specific cleanup exclusions or architectural constraints
- Apply cleanup operations that compromise functionality or introduce bugs
