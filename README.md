# Neovim Configuration

A modular Neovim configuration built Lua using **lazy.nvim** for plugin management.

## Directory Structure

```markdown
~/.config/nvim/
├── init.lua               # Main entry point
└── lua/
    └── config/
        ├── init.lua       # Executes options, keymaps, and lazy
        ├── keymaps.lua    # Global keybindings
        ├── lazy.lua       # Plugin manager bootstrap
        └── options.lua    # Native Neovim settings
```

## Prerequisites

- Neovim >= 0.9.0
- Git 
- A Nerd Font installed and set in your terminal (for icons)

## Installation

1. Back up existing config 

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

2. Clone the repository

```bash
git clone https://github.com/clintonbampoe/neovim-config.git ~/.config/nvim
```

3. Install plugins 
```bash
nvim
```

`lazy.nvim` will automatically download and install the required plugins.  
Restart Neovim once the process completes.

4. Plugin Management 

Run the following command inside Neovim to manage plugins 
-   `:Lazy` - Open the UI to view, update and clean plugins
plugins.  
Restart Neovim once the process completes.

4. Plugin Management 

Run the following command inside Neovim to manage plugins 
-   `:Lazy` - Open the UI to view, update and clean plugins

