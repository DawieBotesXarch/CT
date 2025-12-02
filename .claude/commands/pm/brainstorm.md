---
name: brainstorm
description: "Interactive requirements discovery through Socratic dialogue and systematic exploration"
category: orchestration
complexity: advanced
---

# /pm:brainstorm - Interactive Requirements Discovery

## Triggers
- Ambiguous project ideas requiring structured exploration
- Requirements discovery and specification development needs
- Concept validation and feasibility assessment requests
- Feature planning and iterative refinement scenarios

## Usage
```
/pm:brainstorm [topic/idea] [--strategy systematic|agile|enterprise] [--depth shallow|normal|deep]
```

## Behavioral Flow
1. **Explore**: Transform ambiguous ideas through Socratic dialogue and systematic questioning
2. **Analyze**: Coordinate specialized agents for domain expertise and comprehensive analysis
3. **Validate**: Apply feasibility assessment and requirement validation across domains
4. **Specify**: Generate concrete specifications ready for implementation
5. **Handoff**: Create actionable briefs for development teams

Key behaviors:
- Agent coordination across architect, frontend-specialist, security-specialist domains
- Systematic execution with progressive dialogue enhancement
- Structured requirements discovery and documentation
- Feasibility assessment with technology validation

## Agent Coordination
- **architect**: System design, architecture patterns, technical feasibility
- **frontend-specialist**: UI/UX patterns, accessibility, design system integration
- **security-specialist**: Security requirements, threat modeling, compliance
- **test-engineer**: Testing strategies, quality requirements, validation approaches
- **api-designer**: API design patterns, integration requirements

## Tool Coordination
- **Read/Write/Edit**: Requirements documentation and specification generation
- **TodoWrite**: Progress tracking for complex multi-phase exploration
- **Task**: Delegation for parallel exploration paths and multi-agent coordination
- **WebSearch**: Market research, competitive analysis, and technology validation

## Key Patterns
- **Socratic Dialogue**: Question-driven exploration → systematic requirements discovery
- **Multi-Domain Analysis**: Cross-functional expertise → comprehensive feasibility assessment
- **Progressive Refinement**: Systematic exploration → iterative specification development
- **Specification Generation**: Concrete requirements → actionable implementation briefs

## Examples

### Systematic Product Discovery
```
/pm:brainstorm "AI-powered project management tool" --strategy systematic --depth deep
# Coordinates architect (system design), test-engineer (quality requirements)
# Systematic exploration with structured requirements gathering
```

### Agile Feature Exploration
```
/pm:brainstorm "real-time collaboration features" --strategy agile
# Parallel exploration with frontend-specialist, security-specialist coordination
# Rapid feasibility assessment and technology validation via WebSearch
```

### Enterprise Solution Validation
```
/pm:brainstorm "enterprise data analytics platform" --strategy enterprise --validate
# Comprehensive validation with security-specialist, architect coordination
# Enterprise requirements tracking and compliance assessment
```

### Feature Refinement
```
/pm:brainstorm "mobile app monetization strategy" --depth normal
# Progressive dialogue enhancement with business and technical analysis
# Creates actionable implementation specifications
```

## Boundaries

**Will:**
- Transform ambiguous ideas into concrete specifications through systematic exploration
- Coordinate specialized agents for comprehensive cross-domain analysis
- Generate actionable requirements ready for implementation

**Will Not:**
- Make implementation decisions without proper requirements discovery
- Override user vision with prescriptive solutions during exploration phase
- Bypass systematic exploration for complex multi-domain projects
