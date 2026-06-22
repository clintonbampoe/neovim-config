# Key Bindings

Leader key: `Space`

> Global keymaps live in `init.lua`. Plugin keymaps live in their respective plugin file under `lua/plugins/`.

---

## Finding (Telescope)

| Key          | Action                                   |
| ------------ | ---------------------------------------- |
| `<leader>ff` | Find files                               |
| `<leader>fg` | Live grep (search text across all files) |
| `<leader>fb` | Browse open buffers                      |
| `<leader>fh` | Search help tags                         |
| `<leader>ft` | Toggle workspace diagnostics (Trouble)   |

Inside a Telescope window:

| Key               | Action                         |
| ----------------- | ------------------------------ |
| `<C-n>` / `<C-p>` | Move down / up through results |
| `<CR>`            | Open selected file             |
| `<C-x>`           | Open in horizontal split       |
| `<C-v>`           | Open in vertical split         |
| `<Esc>`           | Close Telescope                |

> `live_grep` requires `ripgrep`: `sudo apt install ripgrep`

---

## LSP

Active in any buffer where an LSP server is attached.

| Key           | Action                                 |
| ------------- | -------------------------------------- |
| `gd`          | Go to definition                       |
| `gr`          | Find references                        |
| `K`           | Hover documentation                    |
| `<F2>`        | Rename symbol                          |
| `<Alt+Enter>` | Code actions (tiny-code-action picker) |
| `<leader>th`  | Toggle inlay hints for current buffer  |

---

## Diagnostics

| Key          | Action                       |
| ------------ | ---------------------------- |
| `<leader>ft` | Toggle workspace diagnostics |
| `<C-t>`      | Toggle buffer diagnostics    |

Diagnostics also appear automatically in a floating window when the cursor rests on a line (`CursorHold`).

---

## Autocompletion (nvim-cmp)

Active when the completion popup is open.

| Key     | Action                                |
| ------- | ------------------------------------- |
| `<C-n>` | Select next suggestion                |
| `<C-p>` | Select previous suggestion            |
| `<Tab>` | Confirm selected suggestion           |
| `<CR>`  | Confirm (only if explicitly selected) |
| `<Esc>` | Close completion menu                 |

---

## Debugging

Always compile with debug symbols first: `gcc -g -o myprogram myfile.c`

| Key          | Action                        |
| ------------ | ----------------------------- |
| `<leader>db` | Toggle breakpoint             |
| `<leader>dc` | Start / continue              |
| `<leader>dn` | Step over                     |
| `<leader>di` | Step into                     |
| `<leader>do` | Step out                      |
| `<leader>dq` | Stop debugger                 |
| `<leader>du` | Toggle DAP UI                 |
| `<leader>dk` | Inspect variable under cursor |

---

## Git

| Key          | Action                          |
| ------------ | ------------------------------- |
| `<leader>gg` | Open LazyGit                    |
| `<leader>gp` | Preview hunk in floating window |
| `]c`         | Jump to next change             |
| `[c`         | Jump to previous change         |

Press `?` inside LazyGit for its keybindings. Press `q` to quit.

---

## C# specific

| Key          | Action                                       |
| ------------ | -------------------------------------------- |
| `<leader>fu` | Find usages via Telescope (`.cs` files only) |

---

## Terminal (toggleterm)

| Key          | Action                               |
| ------------ | ------------------------------------ |
| `<C-\>`      | Toggle floating terminal             |
| `<Esc><Esc>` | Exit terminal mode, return to normal |
| `<C-h>`      | Move to left window from terminal    |
| `<C-j>`      | Move to window below from terminal   |
| `<C-k>`      | Move to window above from terminal   |
| `<C-l>`      | Move to right window from terminal   |

---

## Window navigation

| Key     | Action              |
| ------- | ------------------- |
| `<C-h>` | Move to left split  |
| `<C-j>` | Move to split below |
| `<C-k>` | Move to split above |
| `<C-l>` | Move to right split |

---

## Buffers

| Key          | Action          |
| ------------ | --------------- |
| `<Tab>`      | Next buffer     |
| `<S-Tab>`    | Previous buffer |
| `<leader>bn` | New buffer      |
| `<leader>bd` | Delete buffer   |

---

## Editor

| Key     | Action                                     | Mode   |
| ------- | ------------------------------------------ | ------ |
| `<C-y>` | New line below without leaving insert mode | Insert |

---

## Plugin management (Lazy)

| Command        | Action                                   |
| -------------- | ---------------------------------------- |
| `:Lazy`        | Open plugin manager UI                   |
| `:Lazy update` | Update all plugins                       |
| `:Lazy sync`   | Install missing + update + remove unused |
| `:Lazy clean`  | Remove unused plugins only               |
