# Coding Agent Setup

## 1. Copy the agent file

Copy `modernize.agent.md` to your repository's `.github\agents` folder.

## 2. Add the setup steps

- **No existing `copilot-setup-steps.yml`:** Copy `copilot-setup-steps.yml` as-is to your `.github\workflows` folder.
- **Existing `copilot-setup-steps.yml`:** Carefully merge the steps from this file into your existing one.

## 3. Disable the firewall

Go to **Settings → Copilot → Coding agent** and disable **Enable firewall**.

For more information, see https://github.blog/changelog/2026-02-18-use-copilot-coding-agent-with-windows-projects/
