---
name: test
description: "Execute tests with coverage analysis and automated quality reporting"
category: utility
complexity: enhanced
---

# /pm:test - Testing and Quality Assurance

## Triggers
- Test execution requests for unit, integration, or e2e tests
- Coverage analysis and quality gate validation needs
- Continuous testing and watch mode scenarios
- Test failure analysis and debugging requirements

## Usage
```
/pm:test [target] [--type unit|integration|e2e|all] [--coverage] [--watch] [--fix]
```

## Behavioral Flow
1. **Discover**: Categorize available tests using runner patterns and conventions
2. **Configure**: Set up appropriate test environment and execution parameters
3. **Execute**: Run tests with monitoring and real-time progress tracking
4. **Analyze**: Generate coverage reports and failure diagnostics
5. **Report**: Provide actionable recommendations and quality metrics

Key behaviors:
- Auto-detect test framework and configuration
- Generate comprehensive coverage reports with metrics
- Use Playwright MCP if available for e2e browser testing
- Provide intelligent test failure analysis
- Support continuous watch mode for development

## Agent Coordination
- **test-engineer**: Test analysis and quality assessment
- **code-reviewer**: Code quality and test coverage validation
- If Playwright MCP available: Cross-browser testing, visual validation, performance metrics

## Tool Coordination
- **Bash**: Test runner execution and environment management
- **Glob**: Test discovery and file pattern matching
- **Grep**: Result parsing and failure analysis
- **Write**: Coverage reports and test summaries

## Key Patterns
- **Test Discovery**: Pattern-based categorization → appropriate runner selection
- **Coverage Analysis**: Execution metrics → comprehensive coverage reporting
- **E2E Testing**: Browser automation → cross-platform validation
- **Watch Mode**: File monitoring → continuous test execution

## Examples

### Basic Test Execution
```
/pm:test
# Discovers and runs all tests with standard configuration
# Generates pass/fail summary and basic coverage
```

### Targeted Coverage Analysis
```
/pm:test src/components --type unit --coverage
# Unit tests for specific directory with detailed coverage metrics
```

### Browser Testing
```
/pm:test --type e2e
# Uses Playwright MCP if available for comprehensive browser testing
# Cross-browser compatibility and visual validation
```

### Development Watch Mode
```
/pm:test --watch --fix
# Continuous testing with automatic simple failure fixes
# Real-time feedback during development
```

## Boundaries

**Will:**
- Execute existing test suites using project's configured test runner
- Generate coverage reports and quality metrics
- Provide intelligent test failure analysis with actionable recommendations

**Will Not:**
- Generate test cases or modify test framework configuration
- Execute tests requiring external services without proper setup
- Make destructive changes to test files without explicit permission