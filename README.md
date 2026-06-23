# nvim-config

Personal Neovim config. Modular by design — each language gets its own file, nothing is tangled together.

## Structure

```
init.lua                  # editor options, global keymaps, LSP attach, diagnostics
lua/
  config/
    lazy.lua              # lazy.nvim bootstrap (don't touch this)
  plugins/
    ui.lua                # catppuccin, lualine, bufferline, indent guides
    editor.lua            # autopairs, autosave, vim-matchup, treesitter
    completion.lua        # nvim-cmp + luasnip
    telescope.lua         # fuzzy finder
    neo-tree.lua          # file explorer
    git.lua               # gitsigns, lazygit
    terminal.lua          # toggleterm
    trouble.lua           # diagnostics list
    mason.lua             # tool installer
    conform.lua           # formatters
    debug.lua             # DAP core + UI + keymaps
    tiny-code-action.lua  # code actions picker
    bash.lua              # bash LSP + shellcheck
    c.lua                 # clangd + clangd_extensions + codelldb
    cmake.lua             # cmake LSP
    csharp.lua            # roslyn LSP + netcoredbg
docs/
  KEYMAPS.md
  TROUBLESHOOTING.md
```

## Adding a language

1. Create `lua/plugins/<language>.lua`
2. Put the LSP config, formatter reference, DAP adapter, and any language-specific keymaps in that one file
3. Add any tools to `ensure_installed` in `mason.lua`
4. Add the formatter to `formatters_by_ft` in `conform.lua`
5. That's it — lazy.nvim picks it up automatically

## Requirements

- Neovim 0.12+ (Any version lower would cause problems)
- git
- A Nerd Font set in your terminal
- For C/C++: `gcc`, `make`, `cmake`
- For C#: `dotnet-sdk`
- For Telescope live grep: `ripgrep`
- For LazyGit: install separately from https://github.com/jesseduffield/lazygit/releases

See `docs/TROUBLESHOOTING.md` for common issues.
