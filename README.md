# NEON HACKER TERMUX BANNER

A green neon / cyber-terminal style welcome screen for Termux.

## GitHub upload
Create a **public** GitHub repository, for example `neon-hacker-termux`.
Upload these three files (`install.sh`, `banner.sh`, `config.sh`) to the repository root.

## One-command install
Replace `YOUR_GITHUB_USERNAME` with your GitHub username and run this in Termux:

```bash
pkg update -y && pkg install curl -y && bash -c "$(curl -fsSL https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/neon-hacker-termux/main/install.sh)"
```

The installer asks:
1. Your name
2. What you do (example: `I am File Maker`)

Then it installs the banner and configures it to show on Termux startup.

## Local install (without GitHub)
Extract the ZIP, `cd` into the folder, then run:

```bash
bash install.sh
```

## Uninstall
Remove the line `bash "$HOME/.neon-hacker/banner.sh"` from `~/.bashrc`, then run:

```bash
rm -rf ~/.neon-hacker
```

This is a visual terminal theme only; it does not perform hacking or access other devices.
