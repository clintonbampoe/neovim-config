# Key Bindings

Please note that these key maps are the default keybindings for the config.
However, they can be overriden to match the workflow of the user.  
**VimIsFun**

Leader key is `<Space>`. 

---

## Telescope

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search text across all files) |
| `<leader>fb` | Browse open buffers |
| `<leader>fh` | Search help tags |

Inside a Telescope window:

| Key | Action |
|---|---|
| `<C-n>` / `<C-p>` | Move down / up through results |
| `<CR>` | Open selected file |
| `<C-x>` | Open in horizontal split |
| `<C-v>` | Open in vertical split |
| `<Esc>` | Close Telescope |

> `live_grep` requires `ripgrep`: `sudo apt install ripgrep`

---

## Lazygit

| Key | Action |
|---|---|
| `<leader>gg` | Open lazygit |

Press `?` inside lazygit for its own keybindings. Press `q` to quit.

---

## Git hunks (gitsigns)

| Key | Action |
|---|---|
| `<leader>gp` | Preview hunk in floating window |
| `]c` | Jump to next changed hunk |
| `[c` | Jump to previous changed hunk |

---

## LSP

These are active in any buffer where an LSP server is attached.

| Key | Action |
|---|---|
| `<leader>ih` | Toggle inlay hints for current buffer |
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover documentation |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `[d` / `]d` | Previous / next diagnostic |

---

## Autocompletion (nvim-cmp)

Active when the completion popup is open.

| Key | Action |
|---|---|
| `<C-n>` | Select next suggestion |
| `<C-p>` | Select previous suggestion |
| `<Tab>` | Confirm selected suggestion |
| `<CR>` | Confirm (only if explicitly selected) |
| `<Esc>` | Close completion menu |

---

## Terminal (toggleterm)

| Key | Action |
|---|---|
| `<C-\>` | Toggle floating terminal |
| `<Esc><Esc>` | Exit terminal mode, return to normal mode |
| `<C-h>` | Move to left window from terminal |
| `<C-j>` | Move to window below from terminal |
| `<C-k>` | Move to window above from terminal |
| `<C-l>` | Move to right window from terminal |

---

## Plugin management (Lazy)

| Command | Action |
|---|---|
| `:Lazy` | Open plugin manager UI |
| `:Lazy update` | Update all plugins |
| `:Lazy sync` | Install missing + update + remove unused |
| `:Lazy clean` | Remove unused plugins only |
