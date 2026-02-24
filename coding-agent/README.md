# Coding Agent Setup

## 1. Copy the agent file

Copy `modernize.agent.md` to your repository's `.github\agents` folder.

## 2. Add the setup steps

Two setup step files are provided. Choose one based on your workload and copy it to your `.github\workflows` folder as `copilot-setup-steps.yml`:

- **`copilot-setup-steps-linux.yml`** – recommended for most .NET Core workloads.
- **`copilot-setup-steps-windows.yml`** – required for .NET Framework or .NET Core desktop workloads.

If you already have a `copilot-setup-steps.yml`, carefully merge the steps from the chosen file into your existing one.

## 3. Disable the firewall (Windows only)

If you chose the Windows setup steps, go to **Settings → Copilot → Coding agent** and disable **Enable firewall**. The integrated firewall is not compatible with Windows runners. This step is not needed for Linux.

> **DISCLAIMER:** Disabling the firewall removes network restrictions on the agent, allowing it to make unrestricted outbound connections during its run. Only do this if you trust the repositories and workflows the agent will operate on.

For more information, see https://github.blog/changelog/2026-02-18-use-copilot-coding-agent-with-windows-projects/
