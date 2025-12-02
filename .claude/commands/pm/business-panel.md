# /pm:business-panel - Business Panel Analysis System

```yaml
---
command: "/pm:business-panel"
category: "Analysis & Strategic Planning"
purpose: "Multi-expert business analysis with adaptive interaction modes"
---
```

## Overview

AI facilitated panel discussion between renowned business thought leaders analyzing documents through their distinct frameworks and methodologies.

## Expert Panel

### Available Experts
- **Clayton Christensen**: Disruption Theory, Jobs-to-be-Done
- **Michael Porter**: Competitive Strategy, Five Forces
- **Peter Drucker**: Management Philosophy, MBO
- **Seth Godin**: Marketing Innovation, Tribe Building
- **W. Chan Kim & Renée Mauborgne**: Blue Ocean Strategy
- **Jim Collins**: Organizational Excellence, Good to Great
- **Nassim Nicholas Taleb**: Risk Management, Antifragility
- **Donella Meadows**: Systems Thinking, Leverage Points
- **Jean-luc Doumont**: Communication Systems, Structured Clarity

## Analysis Modes

### Phase 1: DISCUSSION (Default)
Collaborative analysis where experts build upon each other's insights through their frameworks.

### Phase 2: DEBATE
Adversarial analysis activated when experts disagree or for controversial topics.

### Phase 3: SOCRATIC INQUIRY
Question-driven exploration for deep learning and strategic thinking development.

## Usage

### Basic Usage
```bash
/pm:business-panel [document_path_or_content]
```

### Advanced Options
```bash
/pm:business-panel [content] --experts "porter,christensen,meadows"
/pm:business-panel [content] --mode debate
/pm:business-panel [content] --focus "competitive-analysis"
/pm:business-panel [content] --synthesis-only
```

### Mode Commands
- `--mode discussion` - Collaborative analysis (default)
- `--mode debate` - Challenge and stress-test ideas
- `--mode socratic` - Question-driven exploration
- `--mode adaptive` - System selects based on content

### Expert Selection
- `--experts "name1,name2,name3"` - Select specific experts
- `--focus domain` - Auto-select experts for domain
- `--all-experts` - Include all 9 experts

### Output Options
- `--synthesis-only` - Skip detailed analysis, show synthesis
- `--structured` - Efficient structured output
- `--verbose` - Full detailed analysis
- `--questions` - Focus on strategic questions

## Agent Coordination
- **architect**: Technical and system architecture analysis
- **code-reviewer**: Quality and implementation analysis
- **md-documenter**: Professional business documentation

## Tool Coordination
- **Read**: Document and content analysis
- **Grep**: Pattern and reference extraction
- **Write**: Analysis reports and synthesis documents
- **TodoWrite**: Complex multi-phase analysis tracking

## Integration Notes
- Compatible with standard Claude Code agents and workflows
- Integrates with documentation tools for professional business communication
