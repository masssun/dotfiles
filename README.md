# ✨ dotfiles

> My personal macOS dotfiles — clean, organized, and ready to use

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![macOS](https://img.shields.io/badge/macOS-000000?logo=apple&logoColor=F0F0F0)](https://www.apple.com/macos/)
[![Zsh](https://img.shields.io/badge/Zsh-F15A24?logo=zsh&logoColor=white)](https://www.zsh.org/)
[![VS Code](https://img.shields.io/badge/VS%20Code-0078d4.svg?logo=visual-studio-code&logoColor=white)](https://code.visualstudio.com/)

## 🚀 Quick Start

```bash
git clone https://github.com/masssun/dotfiles.git ~/dotfiles
cd ~/dotfiles && ./install
```

That's it! Your dotfiles are now symlinked and ready to use.

## 📦 What's Included

<table>
<tr>
<td>

**🔧 Development**
- Git configuration with aliases
- VS Code settings & keybindings
- Custom Zsh configuration with aliases

</td>
<td>

**🎨 Terminal**
- WezTerm configuration
- Oh My Zsh with plugins
- Custom shell aliases and functions

</td>
</tr>
</table>

## 🎯 Features

- **🛡️ Safe Installation** - Automatically backs up existing files
- **🔗 Smart Linking** - Uses symlinks for easy updates
- **🎨 Pretty Output** - Colorized installation process
- **⚡ Zero Dependencies** - Just bash and git required

## 📋 Installation Output

<details>
<summary>Click to see example output</summary>

```
========== Dotfiles Installation ==========

[1/5] Installing git...
  ✓ Linked: .gitconfig

[2/5] Installing vscode...
  ✓ Linked: keybindings.json
  ✓ Linked: settings.json
  ✓ Linked: snippets

[3/5] Installing zsh...
  ✓ Linked: .zprofile
  ✓ Linked: .zshenv
  ✓ Linked: .zshrc
  ✓ Linked: rc/ (contains aliases)

[4/5] Installing wezterm...
  ✓ Linked: .wezterm.lua

[5/5] Installing claude...
  ✓ Linked: CLAUDE.md
  ✓ Linked: settings.json
  ✓ Linked: commands/

✨ Installation completed!
```
</details>

## 🏗️ Project Structure

```
dotfiles/
├── 📁 config/
│   ├── 🔧 git/          # Git global configuration
│   ├── 💻 vscode/       # Editor settings & keybindings
│   ├── 🐚 zsh/          # Shell configuration + aliases
│   ├── 🖥️  wezterm/      # Terminal emulator settings
│   └── 🤖 claude/       # Claude Code configuration
└── ⚡ install           # Installation script
```

## 🎨 Customization

### Adding New Configurations

1. **Create** a new directory under `config/`
2. **Add** the directory name to the `configs` array in `install`
3. **Place** your dotfiles (starting with `.`) in the new directory

### Advanced Configuration

```bash
# For complex setups, modify the install script
elif [[ "$config" == "your-app" ]]; then
    # Custom installation logic here
    create_symbolic_links "$HOME/.config/your-app"
fi
```

## 💡 Pro Tips

- Run `./install` again anytime to update symlinks
- Files are backed up with timestamp before linking
- VS Code settings go to `~/Library/Application Support/Code/User/`
- Other configs are linked to your home directory

## 📄 License

[MIT License](LICENSE) - feel free to use this as a starting point for your own dotfiles!

---

<div align="center">
<sub>Built with ❤️ for productive development</sub>
</div>
