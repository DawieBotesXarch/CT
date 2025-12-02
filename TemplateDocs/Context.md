# Project Context

## Overview

This is a template project designed to provide a comprehensive, best-practice foundation for working efficiently with Claude Code. The template will serve as a starting point for new projects, incorporating standard components that enhance AI-assisted development workflows.

## Purpose

Create a language-agnostic template that includes (but not limited to):
- **Agents**: Specialized AI agents for different development tasks
- **Commands**: Custom slash commands for common operations
- **Workflows**: Automated development workflows and processes
- **Rules**: Project-specific behavioral rules and conventions
- **Persona/Personality**: Configuration for Claude Code's behavior, tone, and interaction style
- **MCP Configuration**: Setup and definitions for Model Context Protocol servers
- **Best Practices**: Claude Code optimization patterns and configurations
- **How-To Guide**: Step-by-step documentation on using each template component
- **Other Components**: Additional configuration types discovered during research

## Target Audience

**Single Developer** using Claude Code PRO subscription

## Success Criteria

**Living Template**: A reusable, evolving template that can be copied into and adapted for multiple projects over time, growing with discovered best practices.

## Target Languages & Frameworks

While the template is designed to be generic, it will support common technology stacks:
- React / Next.js (Frontend)
- C# (.NET)
- Python
- Go
- Additional languages as needed

## Technical Requirements

### Claude Code Subscription
- **Target Level**: Claude PRO
- **Constraints**: Work within PRO tier limitations (rate limits, context windows, feature availability)

### Critical Agents
- **Markdown Documenter**: Specialized agent for creating and maintaining documentation
- **Mermaid Expert**: Specialized agent for diagram creation and visualization

### Essential MCP Servers
- **Playwright MCP**: Required for browser automation and testing capabilities

## Scope

### In Scope
- Researching Claude Code best practices for project configuration
- Investigating optimal storage locations for rules and configurations (project-level vs user memory)
- Creating reusable template structure for agents, commands, workflows, and rules
- Defining persona/personality configurations for Claude Code behavior customization
- Setting up MCP (Model Context Protocol) server configurations and definitions
- Documenting patterns for efficient AI-assisted development
- Establishing conventions that work across multiple language ecosystems

### Out of Scope (for now)
- Language-specific implementation code
- Actual project implementation (this is planning/contextualization phase)

## Design Principles

### Template Structure
- **Clear Organization**: Intuitive folder structure with self-explanatory naming
- **Well-Documented**: Each component includes inline comments and explanations
- **Easy to Customize**: Direct editing without complex configurations
- **Self-Contained**: Each file/component is independent and understandable on its own
- **Examples Included**: Real-world examples for each template component

### Portability & Integration
- **Minimal Footprint**: Compact template that doesn't bloat projects
- **Drop-In Ready**: Easy to copy/paste into any new project
- **Non-Invasive**: Doesn't interfere with existing project structures
- **Universal Compatibility**: Works across different languages and frameworks
- **Quick Setup**: Minimal configuration required to get started

### Documentation & Usability
- **Step-by-Step Guides**: Clear instructions for using agents, commands, workflows, etc.
- **Practical Examples**: Real-world usage scenarios for each component
- **Quick Start**: Get up and running in minutes with basic guide
- **Reference Documentation**: Detailed explanation of all configuration options
- **Troubleshooting**: Common issues and solutions
