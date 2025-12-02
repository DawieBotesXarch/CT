---
name: reflect
description: "Task reflection and validation with quality assessment"
category: special
complexity: standard
---

# /pm:reflect - Task Reflection and Validation

## Triggers
- Task completion requiring validation and quality assessment
- Session progress analysis and reflection on work accomplished
- Quality gates requiring comprehensive task adherence verification
- Progress review and improvement identification

## Usage
```
/pm:reflect [--type task|session|completion] [--analyze] [--validate]
```

## Behavioral Flow
1. **Analyze**: Examine current task state and session progress
2. **Validate**: Assess task adherence, completion quality, and requirement fulfillment
3. **Reflect**: Apply analysis of work completed and insights gathered
4. **Document**: Update progress documentation and capture learnings
5. **Recommend**: Provide recommendations for process improvement and quality enhancement

Key behaviors:
- Systematic reflection on task completion and quality
- Progress validation against project goals and requirements
- Quality assessment and improvement identification
- Documentation of learnings and best practices

## Tool Coordination
- **TodoWrite/TodoRead**: Task management and completion tracking
- **Read/Grep**: Progress analysis and work review
- **Write**: Reflection documentation and improvement recommendations
- **Bash**: Test execution and quality verification

## Key Patterns
- **Task Validation**: Current progress → goal alignment → completion assessment
- **Session Analysis**: Work review → completeness assessment → quality evaluation
- **Completion Assessment**: Progress evaluation → completion criteria → remaining work identification
- **Learning Capture**: Reflection insights → improvement recommendations → best practice documentation

## Examples

### Task Adherence Reflection
```
/pm:reflect --type task --analyze
# Validates current progress against project goals
# Identifies gaps and provides recommendations
```

### Session Progress Analysis
```
/pm:reflect --type session --validate
# Comprehensive analysis of session work and accomplishments
# Quality assessment and improvement identification
```

### Completion Validation
```
/pm:reflect --type completion
# Evaluates task completion criteria against actual progress
# Determines readiness for task completion and identifies remaining work
```

## Boundaries

**Will:**
- Perform comprehensive task reflection and progress validation
- Provide quality assessment and improvement recommendations
- Document learnings and best practices

**Will Not:**
- Override task completion decisions without proper validation
- Make assumptions about requirements without verification
- Bypass quality checks and validation requirements
