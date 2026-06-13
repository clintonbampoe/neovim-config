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

## LSP not attaching

**Symptom:** No completions, no diagnostics, no hover docs.

Check what's running:
```
:lua print(vim.inspect(vim.lsp.get_clients()))
```
If this returns `{}`, no LSP is attached to the current buffer.

**Common causes:**

1. **Server not installed** — run `:MasonInstall clangd` (or the relevant server) and restart.

2. **No project root anchor (C/C++)** — clangd needs a root marker. Add one:
   ```bash
   touch .clangd
   ```

3. **No `compile_commands.json` (C/C++)** — clangd works without it using `--fallback-flags=-std=c11` but gives degraded results. Generate one:
   ```bash
   cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
   ln -s build/compile_commands.json .
   # or without CMake:
   bear -- make
   ```

4. **Wrong filetype** — run `:set filetype?`. If it doesn't match what the server expects (e.g. `c`, `cpp`, `cs`), the server won't attach.

5. **Mason installed but lspconfig not configured** — Mason installs binaries; lspconfig tells Neovim how to use them. Both must be set up. This config handles C/C++ in `clangd.lua` and C# in `roslyn.lua`.

---

## Deprecation warning on startup

**Symptom:** `The require('lspconfig') "framework" is deprecated` on every launch.

This comes from `roslyn.nvim` internals, not your config. It is harmless — roslyn.nvim uses an older lspconfig API internally. No action needed; it will be fixed in a future roslyn.nvim release.

---

## Autocompletion not showing

**Symptom:** No popup when typing.

1. Confirm LSP is attached (see above) — the `nvim_lsp` source requires an active client
2. Make sure you're in insert mode — completions only trigger on `TextChanged` in insert mode
3. Force load cmp if needed: `:Lazy load nvim-cmp`

The completion sources in order are: LSP → snippets (LuaSnip) → buffer words → file paths. If LSP isn't attached, only buffer words and paths will suggest.

---

## Formatting not working on save

**Symptom:** File doesn't format when saved.

1. Run `:ConformInfo` in the file — it shows which formatter is configured and whether it was found
2. **For C/C++:** make sure `clang-format` is installed (`:MasonInstall clang-format`) and a `.clang-format` file exists in the project root or a parent directory
3. **For C#:** make sure `csharpier` is installed (`:MasonInstall csharpier`)
4. If formatting times out, increase the limit in `conform.lua`: `timeout_ms = 1000`

Note: formatting is only configured for `c`, `cpp`, and `cs` in this config. Other filetypes need to be added to `formatters_by_ft` in `conform.lua`.

---

## Debugger not starting

**Symptom:** `<leader>dc` errors or the UI never opens.

1. **codelldb not installed** — run `:MasonInstall codelldb` and restart
2. **Verify the binary exists:**
   ```
   :lua print(vim.fn.filereadable(vim.fn.stdpath("data") .. "/mason/bin/codelldb"))
   ```
   Should print `1`. If `0`, reinstall via Mason.
3. **Not compiled with debug symbols** — always use `-g`:
   ```bash
   gcc -g -o myprogram myfile.c
   ```
   Without `-g`, the debugger attaches but can't show line numbers or variable values.
4. **Wrong executable path** — when prompted, provide the full path to the compiled binary, not the source `.c` file.

---

## Inlay hints not showing

**Symptom:** No parameter name or type hints inline.

1. Requires Neovim 0.10+ — check with `:version`
2. Toggle manually with `<leader>ih`
3. Check if enabled for the current buffer:
   ```
   :lua print(vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }))
   ```
   Should print `true`.
4. Inlay hints come from the language server — if LSP isn't attached, hints won't appear regardless of settings.

---

## Treesitter issues

**Parsers fail to compile**

A C compiler is required. Install it:
```bash
sudo apt install gcc make
```

Wipe and recompile:
```bash
rm -rf ~/.local/share/nvim/lazy/nvim-treesitter/parser/
nvim +"TSUpdate"
```

**A specific parser errors**

Force reinstall:
```
:TSInstall! c_sharp
```

Installed parsers in this config: `markdown`, `c_sharp`, `xml`, `javascript`, `c`, `cpp`, `make`, `cmake`, `html`, `css`, `typescript`, `lua`, `vim`.

**Highlighting works for some files but not others**

If a filetype isn't in the installed list above, treesitter won't highlight it. Add it in `lua/plugins/treesitter.lua` under the `install()` call.

---

## Roslyn (C#) not working

`roslyn.nvim` requires the .NET SDK installed at the system level. Mason does not install it.

```bash
# Ubuntu/Debian:
sudo apt install dotnet-sdk-8.0
# Full guide: https://learn.microsoft.com/en-us/dotnet/core/install/linux
```

Also note: Roslyn formatting is disabled in this config (`documentFormattingProvider = false`) — C# formatting is handled by `csharpier` via conform. If C# formatting isn't working, install csharpier: `:MasonInstall csharpier`.

---

## Icons rendering as squares or `?`

Neo-tree, lualine, and devicons all require a Nerd Font. The font must be set in your **terminal emulator settings** — Neovim has no font setting of its own.

```bash
# Download a Nerd Font e.g. JetBrainsMono from https://www.nerdfonts.com/
mkdir -p ~/.local/share/fonts
cp ~/Downloads/JetBrainsMonoNerdFont-Regular.ttf ~/.local/share/fonts/
fc-cache -fv
```

Restart your terminal after changing the font setting.

---

## Telescope issues

**`live_grep` does nothing or errors**

```bash
sudo apt install ripgrep
```

**`find_files` misses files**

Telescope respects `.gitignore` by default. To include hidden or ignored files:
```
:Telescope find_files hidden=true no_ignore=true
```

**fzf-native errors or slow search**

The native sorter requires `make` and compiles at install time. If it failed:
```bash
sudo apt install make
```
Then rebuild: `:Lazy build telescope-fzf-native.nvim`

---

## Lazygit not found

lazygit is a system binary — Mason does not install it.

```bash
# Ubuntu/Debian (may be outdated):
sudo apt install lazygit

# Latest binary — recommended:
# https://github.com/jesseduffield/lazygit/releases
```

Confirm it's on PATH:
```bash
which lazygit && lazygit --version
```

---

## Clipboard not working

This config sets `clipboard = "unnamedplus"` — Neovim uses the system clipboard for all yank/paste. On Linux this requires an external tool:

```bash
# X11:
sudo apt install xclip

# Wayland:
sudo apt install wl-clipboard
```

Run `:checkhealth` and look at the clipboard section to confirm it's found.

---

## Mason install failures

**Symptom:** `:MasonInstall` fails or hangs.

1. Check the log: `:MasonLog`
2. Run `:checkhealth mason` to see what's missing
3. Common missing dependencies:
   ```bash
   sudo apt install curl unzip cmake nodejs npm
   ```

---

## Plugins not loading after clone

```
:Lazy sync
```

If a plugin keeps erroring, open `:Lazy`, navigate to it, and press `l` for its log. For a full wipe and reinstall:

```bash
rm -rf ~/.local/share/nvim/lazy/
```

Then open Neovim — lazy.nvim reinstalls everything from scratch.

---

## General: when you don't know what's wrong

```
:checkhealth
```

Checks Neovim internals, providers (clipboard, Python, Node), and any plugin that registers a health check. Read the full output — it names exactly what's missing.
