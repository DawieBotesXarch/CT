---
name: explain
description: "Provide clear explanations of code, concepts, and system behavior with educational clarity"
category: workflow
complexity: standard
---

# /pm:explain - Code and Concept Explanation

## Triggers
- Code understanding and documentation requests for complex functionality
- System behavior explanation needs for architectural components
- Educational content generation for knowledge transfer
- Framework-specific concept clarification requirements

## Usage
```
/pm:explain [target] [--level basic|intermediate|advanced] [--format text|examples|interactive] [--context domain]
```

## Behavioral Flow
1. **Analyze**: Examine target code, concept, or system for comprehensive understanding
2. **Assess**: Determine audience level and appropriate explanation depth and format
3. **Structure**: Plan explanation sequence with progressive complexity and logical flow
4. **Generate**: Create clear explanations with examples, diagrams, and interactive elements
5. **Validate**: Verify explanation accuracy and educational effectiveness

Key behaviors:
- Agent coordination for domain expertise (architect, security-specialist)
- Framework-specific explanations via WebSearch for documentation
- Systematic analysis for complex concept breakdown
- Adaptive explanation depth based on audience and complexity

## Agent Coordination
- **architect**: System architecture and design pattern explanations
- **security-specialist**: Security concepts and best practices
- **md-documenter**: Educational content structure and clarity
- **code-reviewer**: Code quality and implementation patterns

## Tool Coordination
- **Read/Grep/Glob**: Code analysis and pattern identification for explanation content
- **TodoWrite**: Progress tracking for complex multi-part explanations
- **Task**: Delegation for comprehensive explanation workflows requiring systematic breakdown
- **WebSearch**: Framework documentation and official pattern explanations

## Key Patterns
- **Progressive Learning**: Basic concepts → intermediate details → advanced implementation
- **Framework Integration**: WebSearch documentation → accurate official patterns and practices
- **Multi-Domain Analysis**: Technical accuracy + educational clarity + security awareness
- **Interactive Explanation**: Static content → examples → interactive exploration

## Examples

### Basic Code Explanation
```
/pm:explain authentication.js --level basic
# Clear explanation with practical examples for beginners
# Educational structure optimized for learning
```

### Framework Concept Explanation
```
/pm:explain react-hooks --level intermediate --context react
# WebSearch integration for official React documentation patterns
# Structured explanation with progressive complexity
```

### System Architecture Explanation
```
/pm:explain microservices-system --level advanced --format interactive
# architect agent explains system design and patterns
# Interactive exploration with systematic analysis breakdown
```

### Security Concept Explanation
```
/pm:explain jwt-authentication --context security --level basic
# security-specialist agent explains authentication concepts and best practices
# Framework-agnostic security principles with practical examples
```

## Boundaries

**Will:**
- Provide clear, comprehensive explanations with educational clarity
- Activate relevant agents for domain expertise and accurate analysis
- Generate framework-specific explanations with official documentation integration

**Will Not:**
- Generate explanations without thorough analysis and accuracy verification
- Override project-specific documentation standards or reveal sensitive details
- Bypass established explanation validation or educational quality requirements
