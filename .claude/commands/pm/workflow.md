---
name: workflow
description: "Generate structured implementation workflows from PRDs and feature requirements"
category: orchestration
complexity: advanced
---

# /pm:workflow - Implementation Workflow Generator

## Triggers
- PRD and feature specification analysis for implementation planning
- Structured workflow generation for development projects
- Multi-agent coordination for complex implementation strategies
- Workflow management and dependency mapping requirements

## Usage
```
/pm:workflow [prd-file|feature-description] [--strategy systematic|agile|enterprise] [--depth shallow|normal|deep] [--parallel]
```

## Behavioral Flow
1. **Analyze**: Parse PRD and feature specifications to understand implementation requirements
2. **Plan**: Generate comprehensive workflow structure with dependency mapping and task orchestration
3. **Coordinate**: Activate multiple agents for domain expertise and implementation strategy
4. **Execute**: Create structured step-by-step workflows with automated task coordination
5. **Validate**: Apply quality gates and ensure workflow completeness across domains

Key behaviors:
- Agent orchestration across architect, frontend-specialist, security-specialist, and devops-engineer domains
- Systematic execution with progressive workflow enhancement and parallel processing
- Comprehensive workflow management with dependency tracking
- Framework-specific patterns via WebSearch

## Agent Coordination
- **architect**: System architecture and technical implementation planning
- **frontend-specialist**: UI/UX workflow generation and design system integration
- **security-specialist**: Security requirements and compliance workflow integration
- **test-engineer**: Testing workflow integration and quality assurance automation
- **devops-engineer**: Deployment workflow and infrastructure planning
- **api-designer**: API specification and integration workflow planning

## Tool Coordination
- **Read/Write/Edit**: PRD analysis and workflow documentation generation
- **TodoWrite**: Progress tracking for complex multi-phase workflow execution
- **Task**: Delegation for parallel workflow generation and multi-agent coordination
- **WebSearch**: Technology research, framework validation, and implementation strategy analysis

## Key Patterns
- **PRD Analysis**: Document parsing → requirement extraction → implementation strategy development
- **Workflow Generation**: Task decomposition → dependency mapping → structured implementation planning
- **Multi-Domain Coordination**: Cross-functional expertise → comprehensive implementation strategies
- **Quality Integration**: Workflow validation → testing strategies → deployment planning

## Examples

### Systematic PRD Workflow
```
/pm:workflow docs/PRD/feature-spec.md --strategy systematic --depth deep
# Comprehensive PRD analysis with systematic workflow generation
# Multi-agent coordination for complete implementation strategy
```

### Agile Feature Workflow
```
/pm:workflow "user authentication system" --strategy agile --parallel
# Agile workflow generation with parallel task coordination
# WebSearch for framework and implementation workflow patterns
```

### Enterprise Implementation Planning
```
/pm:workflow enterprise-prd.md --strategy enterprise --validate
# Enterprise-scale workflow with comprehensive validation
# Security, devops-engineer, and architect agents for compliance and scalability
```

### Multi-Session Workflow Management
```
/pm:workflow project-brief.md --depth normal
# Comprehensive workflow context and systematic planning
# Progressive workflow enhancement with structured implementation
```

## Boundaries

**Will:**
- Generate comprehensive implementation workflows from PRD and feature specifications
- Coordinate multiple agents for complete implementation strategies
- Provide systematic workflow management and progressive enhancement capabilities

**Will Not:**
- Execute actual implementation tasks beyond workflow planning and strategy
- Override established development processes without proper analysis and validation
- Generate workflows without comprehensive requirement analysis and dependency mapping
