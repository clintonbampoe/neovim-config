# Troubleshooting

---

## Neovim version

**Treesitter errors, no highlighting, or silent parser failures**

This config requires **Neovim 0.11+**. On 0.10, treesitter parsers silently fail or throw version mismatch errors. There is no workaround — upgrade first.

```bash
nvim --version

# Upgrade on Ubuntu/Debian:
sudo apt remove neovim
sudo snap install nvim --classic
# or get the AppImage: https://github.com/neovim/neovim/releases
```

After upgrading, wipe the old parser cache so they recompile cleanly:

```bash
rm -rf ~/.local/share/nvim/lazy/nvim-treesitter/parser/
```

Then open Neovim and run `:TSUpdate`.

---

## Treesitter

**Parsers fail to compile even on 0.11+**

A C compiler is required. Treesitter compiles parsers from C source at install time.

```bash
sudo apt install gcc make
```

Wipe and recompile after installing:

```bash
rm -rf ~/.local/share/nvim/lazy/nvim-treesitter/parser/
nvim +"TSUpdate"
```

**A specific language parser errors or hangs**

Force reinstall that parser:

```
:TSInstall! c_sharp
```

This config installs: `markdown`, `c_sharp`, `xml`, `javascript`, `c`, `html`, `css`, `typescript`, `lua`, `vim`. If one is broken, target it specifically with `:TSInstall! <language>`.

**Highlighting works for some files but not others**

Treesitter in this config is triggered via a `FileType` autocmd — it starts the highlighter when a file is opened. If a filetype is not in the installed parsers list above, it will not be highlighted by treesitter. Add it in `lua/plugins/treesitter.lua` under the `install()` call.

---

## Icons rendering as squares or `?`

Neo-tree, lualine, and devicons all require a Nerd Font. The font must be set in your **terminal emulator's settings** — Neovim has no font setting of its own.

```bash
# Download a Nerd Font, e.g. JetBrainsMono from https://www.nerdfonts.com/
mkdir -p ~/.local/share/fonts
cp ~/Downloads/JetBrainsMonoNerdFont-Regular.ttf ~/.local/share/fonts/
fc-cache -fv
```

Then set it as your terminal's font and restart the terminal.

---

## LSP not working

**No completions / no diagnostics**

Mason only installs servers — it does not configure them. This config uses `roslyn.nvim` for C# and relies on Mason for everything else. If a server isn't attaching:

1. Run `:Mason` and install the server for your language
2. Open a file of that type and run `:LspInfo` — it will show whether a client attached and why it didn't if not

**Mason servers silently fail to install**

Most servers Mason installs require `node` / `npm`:

```bash
sudo apt install nodejs npm
```

Run `:checkhealth mason` to see exactly what's missing.

**Roslyn (C#) not working**

`roslyn.nvim` requires the **.NET SDK** installed at the system level. Mason does not install it.

```bash
# Ubuntu/Debian:
sudo apt install dotnet-sdk-8.0
# Full guide: https://learn.microsoft.com/en-us/dotnet/core/install/linux
```

Also note: Roslyn in this config explicitly **disables** its own formatter (`documentFormattingProvider = false`) — formatting for C# is handled by `csharpier` via conform. If formatting isn't working, install csharpier through Mason (`:Mason`, search `csharpier`, press `i`).

**Inlay hints not showing for C#**

Inlay hints are toggled manually with `<leader>ih`. They are not on by default. Press `<leader>ih` in a `.cs` file with Roslyn attached.

---

## Autocompletion not appearing

The completion popup triggers automatically on text change (`TextChanged` event). If it's not appearing:

- Confirm an LSP server is attached (`:LspInfo`)
- The completion sources are `nvim_lsp`, `luasnip`, `buffer`, and `path` — if LSP isn't attached, only buffer words and paths will complete
- `<Tab>` confirms the selected item; it does **not** trigger completion — if the popup isn't showing, check LSP first

---

## Formatting not working on save

This config formats on save via conform, but **only for C#** (`csharpier`). For other filetypes, no formatter is configured by default — you must add them in `lua/plugins/conform.lua` under `formatters_by_ft`.

If C# formatting isn't working:

1. Install `csharpier` via Mason (`:Mason` → search `csharpier` → `i`)
2. Run `:ConformInfo` in a `.cs` file to confirm it's found and active
3. The timeout is set to 1000ms — if the file is large and formatting is slow, increase `timeout_ms` in `conform.lua`

---

## Telescope

**`live_grep` does nothing or errors**

`ripgrep` is required:

```bash
sudo apt install ripgrep
```

**`find_files` misses files you expect**

Telescope respects `.gitignore` by default. To search hidden/ignored files:

```
:Telescope find_files hidden=true no_ignore=true
```

**Fuzzy search is slow or fzf-native errors**

`telescope-fzf-native` builds with `make` at install time. If the build failed:

```bash
sudo apt install make
```

Then rebuild:

```
:Lazy build telescope-fzf-native.nvim
```

---

## Lazygit

**`lazygit: command not found`**

lazygit is a system binary — Mason does not install it.

```bash
# Ubuntu/Debian (may be outdated):
sudo apt install lazygit

# Latest binary — recommended:
# https://github.com/jesseduffield/lazygit/releases
```

Confirm it's on your PATH after installing:

```bash
which lazygit && lazygit --version
```

---

## Clipboard not working

This config sets `clipboard = "unnamedplus"`, which means Neovim uses the system clipboard for all yank/paste operations. On Linux this requires an external tool:

```bash
# X11:
sudo apt install xclip

# Wayland:
sudo apt install wl-clipboard
```

Without one of these, yanking in Neovim will not reach your system clipboard and vice versa. Run `:checkhealth` and look at the clipboard section to confirm.

---

## Plugins not loading after clone

lazy.nvim installs automatically on first launch. If something failed mid-install or a plugin is missing:

```
:Lazy sync
```

If a specific plugin keeps erroring, open `:Lazy`, navigate to it, and press `l` to see its log. For a full wipe and reinstall:

```bash
rm -rf ~/.local/share/nvim/lazy/
```

Then open Neovim — lazy.nvim will reinstall everything from scratch.

---

## General: when you don't know what's wrong

```
:checkhealth
```

This checks Neovim internals, providers (Python, Node, clipboard), and any plugin that registers a health check. Read the full output — it will name exactly what's missing.
