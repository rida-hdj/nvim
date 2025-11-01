# 🌌 My Neovim Configuration

A powerful and customizable Neovim setup designed for **web development** (HTML, CSS, JS), **systems programming** (C, C++, Rust), and more. Optimized for productivity, aesthetics, and comfort.

---

## ⚡ Requirements

* **Neovim 0.11 or higher**
* **Git** installed
* Internet connection to download plugins via `lazy.nvim` .

---

## 💾 Backup Your Current Configuration

Before installing this config, it's recommended to back up your existing Neovim setup:

```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

To restore it later:

```bash
mv ~/.config/nvim.backup ~/.config/nvim
```

---

## 📥 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/rida-hdj/nvim.git ~/.config/nvim
```


### 2. Launch Neovim

Run Neovim to automatically install all plugins:

```bash
nvim
```

> `lazy.nvim` will handle plugin installation on first run.

---

## 🔧 Post-Installation Steps

1. **Synchronize Plugins** (if needed):

```vim
:Lazy sync
```

2. **Check LSP Status**:

```vim
:LspInfo
```

3. **Customize Your Configuration**:
   Edit Lua files inside:

```
~/.config/nvim/lua/config/
```

4. **Restart Neovim** after changes to apply updates.

---

## ✨ Features

* **Language Support**: HTML, CSS, JS, JSON, YAML, C, C++, Rust, Shell scripting.
* **Enhanced UI**: Uses **Nerd Fonts** for beautiful icons.
* **Convenient Shortcuts** for:

  * File navigation
  * Searching with Telescope
* **Plugin Management** via `lazy.nvim`.
* **LSP, Autocompletion, and Syntax Highlighting** ready out-of-the-box.

---

## 📝 Recommended Next Steps

* Explore your keybindings:

```vim
:help keymaps
```

* Install additional LSP servers if needed via `mason.nvim`.
* Customize themes, icons, and appearance inside `~/.config/nvim/lua/config/ui.lua`.
* Keep your plugins up-to-date:

```vim
:Lazy update
```

---

Enjoy a **fast, beautiful, and fully-featured Neovim experience**! 🚀
