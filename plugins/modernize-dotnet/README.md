# .NET Modernization Plugin

AI-powered assistance for upgrading and modernizing .NET applications. This plugin adds the **modernize-dotnet** agent to your Copilot CLI.

## Installation

Add the marketplace, then install the plugin:

```
/plugin marketplace add dotnet/modernize-dotnet
/plugin install modernize-dotnet@modernize-dotnet-plugins
```

## Usage

Use `/agent` to select **modernize-dotnet**, then enter your prompt:

```text
upgrade my project to .NET 10
```

The agent guides you through a structured workflow:

1. **Assessment** — analyzes your project and identifies what needs to change
2. **Planning** — creates a step-by-step upgrade plan
3. **Execution** — applies the changes using specialized tools

## MCP Server

The plugin includes an MCP server (Modernization) that provides upgrade and analysis tools. It starts automatically when the modernize-dotnet agent is invoked — no manual configuration needed.

## Plugin Structure

```
modernize-dotnet/
├── .github/
│   └── plugin/
│       └── plugin.json
└── agents/
    └── modernize-dotnet.agent.md
```

## Requirements

- .NET SDK 10.0 or later

## Links

- [Source](https://github.com/dotnet/modernize-dotnet)
- [Documentation](https://dotnet.microsoft.com/en-us/platform/modernize)
