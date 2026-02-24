# Coding Agent Setup

## 1. Copy the agent file

Copy `modernize.agent.md` to your repository's `.github\agents` folder.

## 2. Add the setup steps

Two setup step files are provided. Choose one based on your workload and copy it to your `.github\workflows` folder as `copilot-setup-steps.yml`:

- **`linux/copilot-setup-steps.yml`** – recommended for most .NET Core workloads.
- **`windows/copilot-setup-steps.yml`** – recommended for .NET Framework or .NET Core desktop workloads.

If you already have a `copilot-setup-steps.yml`, carefully merge the steps from the chosen file into your existing one.

## 3. Disable the firewall (Windows only)

If you chose the Windows setup steps, go to **Settings → Copilot → Coding agent** and disable **Enable firewall**. The integrated firewall is not compatible with Windows runners. This step is not needed for Linux.

> **DISCLAIMER:** Disabling the firewall removes network restrictions on the agent, allowing it to make unrestricted outbound connections during its run. Only do this if you trust the repositories and workflows the agent will operate on. More information regarding firewall incompatibilities can be found [here](https://github.blog/changelog/2026-02-18-use-copilot-coding-agent-with-windows-projects/#:~:text=Copilot%20coding%20agent%E2%80%99s%20integrated%20firewall%20is%20not%20compatible%20with%20Windows%2C%20so%20we%20recommended%20that%20you%20only%20use%20Windows%20with%20self%2Dhosted%20runners%20or%20larger%20runners%20with%20Azure%20private%20networking%20where%20you%20can%20implement%20your%20own%20network%20controls.)