# .claude Directory

This directory contains Claude Code configuration files, custom agents, and slash commands.

## Structure

```
.claude/
├── agents/          # Custom subagents with specialized expertise
├── commands/        # Custom slash commands for repeated workflows
├── settings.local.json  # Local project settings (gitignored)
└── README.md        # This file
```

## Usage

- **Agents**: Place `.md` files in `agents/` to create specialized AI assistants
- **Commands**: Place `.md` files in `commands/` to create custom slash commands
- **Settings**: Use `settings.local.json` for private local overrides

See the main documentation in `/Docs/How-To-Guide.md` for detailed usage instructions.
