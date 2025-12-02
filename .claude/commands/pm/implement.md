---
name: implement
description: "Feature and code implementation with intelligent agent coordination"
category: workflow
complexity: standard
---

# /pm:implement - Feature Implementation

> This command activates when Claude Code users type `/pm:implement` patterns. It coordinates specialized agents and tools for comprehensive implementation.

## Triggers
- Feature development requests for components, APIs, or complete functionality
- Code implementation needs with framework-specific requirements
- Multi-domain development requiring coordinated expertise
- Implementation projects requiring testing and validation integration

## Usage
```
/pm:implement [feature-description] [--type component|api|service|feature] [--framework react|vue|express] [--safe] [--with-tests]
```
**Usage**: Type this in Claude Code conversation to activate implementation mode with coordinated agents and systematic development approach.

## Behavioral Flow
1. **Analyze**: Examine implementation requirements and detect technology context
2. **Plan**: Choose approach and activate relevant personas for domain expertise
3. **Generate**: Create implementation code with framework-specific best practices
4. **Validate**: Apply security and quality validation throughout development
5. **Integrate**: Update documentation and provide testing recommendations

Key behaviors:
- Context-based agent coordination (architect, frontend-specialist, security-specialist, test-engineer)
- Framework-specific implementation using best practices and documentation
- Systematic multi-component coordination
- Comprehensive testing integration and validation

## Tool Coordination
- **Write/Edit**: Code generation and modification for implementation
- **Read/Grep/Glob**: Project analysis and pattern detection for consistency
- **TodoWrite**: Progress tracking for complex multi-file implementations
- **Task**: Delegation to specialized agents (architect, frontend-specialist, security-specialist, test-engineer)
- **WebSearch**: Framework documentation and best practices

## Key Patterns
- **Context Detection**: Framework/tech stack → appropriate agent coordination
- **Implementation Flow**: Requirements → code generation → validation → integration
- **Multi-Agent Coordination**: frontend-specialist + security-specialist + test-engineer → comprehensive solutions
- **Quality Integration**: Implementation → testing → documentation → validation

## Examples

### React Component Implementation
```
/pm:implement user profile component --type component --framework react
# Generates UI component with design system integration
# frontend-specialist ensures best practices and accessibility
```

### API Service Implementation
```
/pm:implement user authentication API --type api --safe --with-tests
# Handles server-side logic and data processing
# security-specialist ensures authentication best practices
```

### Full-Stack Feature
```
/pm:implement payment processing system --type feature --with-tests
# Multi-agent coordination: architect, frontend-specialist, security-specialist
# Systematic breakdown of complex implementation steps
```

### Framework-Specific Implementation
```
/pm:implement dashboard widget --framework vue
# WebSearch provides Vue-specific patterns and documentation
# Framework-appropriate implementation with best practices
```

## Boundaries

**Will:**
- Implement features with intelligent agent coordination
- Apply framework-specific best practices and security validation
- Provide comprehensive implementation with testing and documentation integration

**Will Not:**
- Make architectural decisions without consulting architect agent
- Implement features conflicting with security policies or architectural constraints
- Override user-specified safety constraints or bypass quality gates