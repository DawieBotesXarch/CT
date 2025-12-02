---
name: improve
description: "Apply systematic improvements to code quality, performance, and maintainability"
category: workflow
complexity: standard
---

# /pm:improve - Code Improvement

## Triggers
- Code quality enhancement and refactoring requests
- Performance optimization and bottleneck resolution needs
- Maintainability improvements and technical debt reduction
- Best practices application and coding standards enforcement

## Usage
```
/pm:improve [target] [--type quality|performance|maintainability|style] [--safe] [--interactive]
```

## Behavioral Flow
1. **Analyze**: Examine codebase for improvement opportunities and quality issues
2. **Plan**: Choose improvement approach and activate relevant agents for expertise
3. **Execute**: Apply systematic improvements with domain-specific best practices
4. **Validate**: Ensure improvements preserve functionality and meet quality standards
5. **Document**: Generate improvement summary and recommendations for future work

Key behaviors:
- Agent coordination (architect, performance-engineer, code-reviewer, security-specialist) based on improvement type
- Framework-specific optimization via WebSearch for best practices
- Systematic analysis for complex multi-component improvements
- Safe refactoring with comprehensive validation and rollback capabilities

## Agent Coordination
- **architect**: Structure and architectural improvements
- **performance-engineer**: Speed and efficiency optimizations
- **code-reviewer**: Quality and maintainability assessment
- **security-specialist**: Security hardening and vulnerability fixes
- **refactoring-specialist**: Safe refactoring patterns and modernization

## Tool Coordination
- **Read/Grep/Glob**: Code analysis and improvement opportunity identification
- **Edit**: Safe code modification and systematic refactoring
- **TodoWrite**: Progress tracking for complex multi-file improvement operations
- **Task**: Delegation for large-scale improvement workflows requiring systematic coordination
- **WebSearch**: Framework-specific best practices and optimization patterns

## Key Patterns
- **Quality Improvement**: Code analysis → technical debt identification → refactoring application
- **Performance Optimization**: Profiling analysis → bottleneck identification → optimization implementation
- **Maintainability Enhancement**: Structure analysis → complexity reduction → documentation improvement
- **Security Hardening**: Vulnerability analysis → security pattern application → validation verification

## Examples

### Code Quality Enhancement
```
/pm:improve src/ --type quality --safe
# Systematic quality analysis with safe refactoring application
# Improves code structure, reduces technical debt, enhances readability
```

### Performance Optimization
```
/pm:improve api-endpoints --type performance --interactive
# performance-engineer agent analyzes bottlenecks and optimization opportunities
# Interactive guidance for complex performance improvement decisions
```

### Maintainability Improvements
```
/pm:improve legacy-modules --type maintainability --preview
# architect agent analyzes structure and suggests maintainability improvements
# Preview mode shows changes before application for review
```

### Security Hardening
```
/pm:improve auth-service --type security --validate
# security-specialist agent identifies vulnerabilities and applies security patterns
# Comprehensive validation ensures security improvements are effective
```

## Boundaries

**Will:**
- Apply systematic improvements with domain-specific expertise and validation
- Provide comprehensive analysis with agent coordination and best practices
- Execute safe refactoring with rollback capabilities and quality preservation

**Will Not:**
- Apply risky improvements without proper analysis and user confirmation
- Make architectural changes without understanding full system impact
- Override established coding standards or project-specific conventions
