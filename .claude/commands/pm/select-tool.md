---
name: select-tool
description: "Intelligent tool selection based on complexity scoring and operation analysis"
category: special
complexity: high
---

# /pm:select-tool - Intelligent Tool Selection

## Triggers
- Operations requiring optimal tool and agent selection
- Meta-system decisions needing complexity analysis
- Tool routing decisions requiring capability matching
- Operations benefiting from intelligent tool assessment

## Usage
```
/pm:select-tool [operation] [--analyze] [--explain]
```

## Behavioral Flow
1. **Parse**: Analyze operation type, scope, file count, and complexity indicators
2. **Score**: Apply multi-dimensional complexity scoring across various operation factors
3. **Match**: Compare operation requirements against available tool and agent capabilities
4. **Select**: Choose optimal approach based on scoring matrix and performance requirements
5. **Validate**: Verify selection accuracy and provide confidence metrics

Key behaviors:
- Complexity scoring based on file count, operation type, language, and framework requirements
- Performance assessment evaluating speed vs accuracy trade-offs for optimal selection
- Intelligent routing between specialized agents and standard tools
- Capability matching for optimal execution strategy

## Agent Selection Logic
- **Single file, simple operation**: Standard tools (Read, Edit, Write)
- **Multiple files, pattern-based**: Grep, Glob + Edit
- **Architecture/design**: architect agent
- **Security concerns**: security-specialist agent
- **Performance issues**: performance-engineer agent
- **Testing needs**: test-engineer agent
- **Complex refactoring**: refactoring-specialist agent
- **Documentation**: md-documenter agent

## Tool Coordination
- **Read/Grep/Glob**: Operation context analysis and complexity factor identification
- **Task**: Delegation to specialized agents based on selection logic
- **TodoWrite**: Complex operation tracking and progress management

## Key Patterns
- **Direct Mapping**: Simple operations → standard tools, Complex operations → agents
- **Complexity Thresholds**: File count, operation type, and domain determine agent selection
- **Performance Trade-offs**: Speed requirements → simple tools, Accuracy requirements → agents
- **Fallback Strategy**: Agent → standard tools degradation chain

## Examples

### Complex Refactoring Operation
```
/pm:select-tool "rename function across 10 files" --analyze
# Analysis: High complexity (multi-file, symbol operations)
# Selection: refactoring-specialist agent with systematic coordination
```

### Pattern-Based Bulk Edit
```
/pm:select-tool "update console.log to logger.info across project" --explain
# Analysis: Pattern-based transformation, standard tool capability
# Selection: Grep + Edit for efficient bulk operations
```

### Architecture Analysis
```
/pm:select-tool "analyze system architecture and dependencies"
# Direct mapping: Architecture domain → architect agent
# Systematic analysis with architectural expertise
```

## Boundaries

**Will:**
- Analyze operations and provide optimal tool/agent selection
- Apply complexity scoring based on file count, operation type, and requirements
- Provide fast decision time with high selection accuracy

**Will Not:**
- Override explicit tool/agent specifications when user has clear preference
- Select tools without proper complexity analysis and capability matching
- Compromise operation requirements for convenience or speed
