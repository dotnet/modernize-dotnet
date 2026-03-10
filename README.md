# .NET Modernization Tools

AI-powered tools for upgrading and modernizing .NET applications across multiple development environments.

### Getting Started

Choose the development environment you use and follow the setup instructions.

<details>
<summary>Visual Studio Code</summary>

#### Prerequisites

- Visual Studio Code
- GitHub Copilot extension installed
- GitHub Copilot subscription (paid or free)

#### Install

1. Install the [GitHub Copilot modernization](https://marketplace.visualstudio.com/items?itemName=vscjava.migrate-java-to-azure) extension from the VS Code Marketplace
2. Open a workspace containing your .NET project
3. Open Copilot Chat and select modernize-dotnet from the Agent picker
4. Prompt the agent with the type of upgrade you would like to perform, for example: upgrade my project to .NET 10.

</details>

<details>
<summary>GitHub Copilot CLI</summary>

The modernize-dotnet plugin adds a modernization agent to Copilot CLI.

#### Prerequisites

- GitHub Copilot CLI installed
- GitHub Copilot subscription (paid or free)

#### Install

1. **Add the marketplace:**

   ```
   /plugin marketplace add dotnet/modernize-dotnet
   ```

2. **Install the plugin:**

   ```
   /plugin install modernize-dotnet@modernize-dotnet-plugins
   ```

3. **Select the agent:**

   ```/agent ``` to select  ```modernize-dotnet ```
   
4. Prompt the agent:

   ```
   upgrade my project to .NET 10
   ```

> **Note:** You may need to restart Copilot CLI after installing the plugin before the agent becomes available ([tracking issue](https://github.com/github/copilot-cli/issues/1646)).

</details>

<details>
<summary>GitHub Copilot Coding Agent</summary>

A custom agent definition and setup steps are provided for use with [Copilot Coding Agent](https://docs.github.com/en/copilot/using-github-copilot/using-copilot-coding-agent) in GitHub. This allows Copilot to modernize .NET projects directly via pull requests.

See the [coding-agent README](coding-agent/README.md) for setup instructions.

</details>

<details>
<summary>Visual Studio</summary>

#### Prerequisites

- Windows operating system
- Visual Studio 2026 or Visual Studio 2022 version 17.14.17+
- .NET desktop development workload with the following components enabled
    - GitHub Copilot
    - GitHub Copilot app modernization
- GitHub Copilot subscription (paid or free)

#### Install

1. Right-click a project in Solution Explorer

2. Select `Modernize`

3. Alternatively, open GitHub Copilot Chat and run: @Modernize

</details>

