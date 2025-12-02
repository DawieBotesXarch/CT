---
name: index
description: "Generate comprehensive project documentation and knowledge base with intelligent organization"
category: special
complexity: standard
---

# /pm:index - Project Documentation

## Triggers
- Project documentation creation and maintenance requirements
- Knowledge base generation and organization needs
- API documentation and structure analysis requirements
- Cross-referencing and navigation enhancement requests

## Usage
```
/pm:index [target] [--type docs|api|structure|readme] [--format md|json|yaml]
```

## Behavioral Flow
1. **Analyze**: Examine project structure and identify key documentation components
2. **Organize**: Apply intelligent organization patterns and cross-referencing strategies
3. **Generate**: Create comprehensive documentation with framework-specific patterns
4. **Validate**: Ensure documentation completeness and quality standards
5. **Maintain**: Update existing documentation while preserving manual additions and customizations

Key behaviors:
- Agent coordination (architect, md-documenter, code-reviewer) based on documentation scope and complexity
- Systematic analysis for comprehensive documentation workflows
- Framework-specific patterns and documentation standards via WebSearch
- Intelligent organization with cross-referencing capabilities and automated maintenance

## Agent Coordination
- **architect**: Project structure and architectural documentation
- **md-documenter**: Professional documentation writing and organization
- **code-reviewer**: Code quality and API documentation validation
- **mermaid-expert**: Diagram creation for architectural documentation

## Tool Coordination
- **Read/Grep/Glob**: Project structure analysis and content extraction for documentation generation
- **Write**: Documentation creation with intelligent organization and cross-referencing
- **TodoWrite**: Progress tracking for complex multi-component documentation workflows
- **Task**: Delegation for large-scale documentation requiring systematic coordination
- **WebSearch**: Framework-specific documentation patterns and standards

## Key Patterns
- **Structure Analysis**: Project examination → component identification → logical organization → cross-referencing
- **Documentation Types**: API docs → Structure docs → README → Knowledge base approaches
- **Quality Validation**: Completeness assessment → accuracy verification → standard compliance → maintenance planning
- **Framework Integration**: WebSearch patterns → official standards → best practices → consistency validation

## Examples

### Project Structure Documentation
```
/pm:index project-root --type structure --format md
# Comprehensive project structure documentation with intelligent organization
# Creates navigable structure with cross-references and component relationships
```

### API Documentation Generation
```
/pm:index src/api --type api --format json
# API documentation with systematic analysis and validation
# md-documenter and code-reviewer agents ensure completeness and accuracy
```

### Knowledge Base Creation
```
/pm:index . --type docs
# Interactive knowledge base generation with project-specific patterns
# architect agent provides structural organization and cross-referencing
```

## Boundaries

**Will:**
- Generate comprehensive project documentation with intelligent organization and cross-referencing
- Apply agent coordination for systematic analysis and quality validation
- Provide framework-specific patterns and established documentation standards

**Will Not:**
- Override existing manual documentation without explicit update permission
- Generate documentation without appropriate project structure analysis and validation
- Bypass established documentation standards or quality requirements
