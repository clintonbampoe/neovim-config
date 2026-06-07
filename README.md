# neovim-config

A modular Neovim configuration written in Lua, using [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

---

## Requirements

**Neovim version: 0.11 or higher is required.**

> ⚠️ **Do not use Neovim 0.10.** nvim-treesitter will not work correctly on 0.10 — you will get parser errors or silent failures. Upgrade to 0.11+ before proceeding.

Check your version:
```bash
nvim --version
```

To upgrade on Ubuntu/Debian:
```bash
# The apt version is often outdated. Install from the official release instead:
sudo apt remove neovim
sudo snap install nvim --classic
# or download the latest AppImage from https://github.com/neovim/neovim/releases
```

Other required tools:

- `git`
- A [Nerd Font](https://www.nerdfonts.com/) installed and set as your terminal font — required for icons to render correctly (neo-tree, lualine, devicons all use them)
- `gcc` or `clang` — required by nvim-treesitter to compile parsers
- `npm` or `node` — required by Mason to install some LSP servers
- `lazygit` — required for the lazygit.nvim plugin to function (`sudo apt install lazygit` or see [lazygit install docs](https://github.com/jesseduffield/lazygit#installation))

---

## Installation

### 1. Back up your existing config (if any)

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### 2. Clone this repo

```bash
git clone https://github.com/clintonbampoe/neovim-config.git ~/.config/nvim
```

### 3. Open Neovim

```bash
nvim
```

lazy.nvim will bootstrap itself and install all plugins automatically. You will see a progress UI. Wait for it to finish, then restart Neovim.

> On first launch you may see warnings about missing parsers or LSP servers — these resolve after the install completes and you restart.

### 4. Install LSP servers

Inside Neovim, open Mason to install language servers for the languages you work with:

```
:Mason
```

Use the Mason UI to search and install servers (e.g. `lua-language-server`, `pyright`, `tsserver`). Press `i` on a server to install it.

---

## Plugins

| Plugin | Purpose |
|---|---|
| lazy.nvim | Plugin manager |
| nvim-treesitter | Syntax highlighting and code parsing |
| nvim-lspconfig + mason.nvim | LSP setup and server installer |
| nvim-cmp + LuaSnip | Autocompletion and snippets |
| telescope.nvim | Fuzzy finder (files, text, buffers) |
| neo-tree.nvim | File explorer sidebar |
| lualine.nvim | Status line |
| gitsigns.nvim | Git change indicators in the gutter |
| lazygit.nvim | Full lazygit UI inside Neovim |
| toggleterm.nvim | Terminal toggle |
| conform.nvim | Code formatting |
| catppuccin | Colorscheme |
| roslyn.nvim | C# / .NET LSP support |

---

## Directory Structure

```
~/.config/nvim/
├── init.lua                  # Entry point: sets options, keymaps, bootstraps lazy.nvim
├── lazy-lock.json            # Locked plugin versions (do not delete)
└── lua/
    └── config/
        ├── init.lua          # Loads options, keymaps, and lazy
        ├── keymaps.lua       # Global key bindings
        ├── lazy.lua          # Plugin definitions and lazy.nvim bootstrap
        └── options.lua       # Neovim settings (tabs, line numbers, etc.)
```

---

## Plugin Management

```
:Lazy          # Open plugin manager UI (update, clean, view status)
:Lazy update   # Update all plugins
:Lazy sync     # Install missing + update + clean unused
```

---

## Docs

- [KEYMAPS.md](./KEYMAPS.md) — all key bindings
- [TROUBLESHOOTING.md](./TROUBLESHOOTING.md) — common setup issues and fixes
