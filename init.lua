# Config 

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.softtabstop = 4
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.autoindent = true
opt.termguicolors = true
opt.background = "dark"
opt.clipboard = "unnamedplus"
opt.sidescrolloff = 10 
opt.scrolloff = 10
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.cursorline = true

vim.g.mapleader = " "

vim.o.scrolloff = 10
vim.keymap.set("i", "<C-y>", "<Esc>o", { desc = "New line below" })

vim.keymap.set('n', 'gr', function()
    vim.lsp.buf.references({ include_declaration = true })
end, { desc = "References" }
)
vim.api.nvim_create_autocmd('CursorHold', {
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end,
})

vim.keymap.set('n', '<M-CR>', function()
  require('tiny-code-action').code_action()
end, { buffer = bufnr, desc = 'Code action / Refactor' })

-- rename symbol (F2 like in Rider/VS)
vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename symbol' })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover docs' })

-- INLAY HINTS CONFIGS
-- Create a custom command :ToggleInlayHints
vim.api.nvim_create_user_command("ToggleInlayHints", function()
    local current_state = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
    vim.lsp.inlay_hint.enable(not current_state, { bufnr = 0 })
end, {})
-- Map it to a convenient key, e.g., <leader>ih
vim.keymap.set("n", "<leader>ih", "<cmd>ToggleInlayHints<cr>", { desc = "Toggle Inlay Hints" })


-- GITSIGNS CONFIGS
-- Navigate between changes
vim.keymap.set('n', ']c', function() require('gitsigns').next_hunk() end)
vim.keymap.set('n', '[c', function() require('gitsigns').prev_hunk() end)

-- Preview changes in a floating window
vim.keymap.set('n', '<leader>gp', function() require('gitsigns').preview_hunk() end, {desc = "Preview changes in floating window" })


-- TOGGLE TERM CONFIGS 
-- Exit terminal mode with Esc + Esc
vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Optional: Navigate windows while in terminal mode
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { desc = "Terminal left" })
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { desc = "Terminal down" })
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { desc = "Terminal up" })
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { desc = "Terminal right" })

-- BUFFERLINE KEYMAPS 
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "S-Tab>", "<cmd>BufferLineCyclePrev<CR>")

vim.keymap.set('n', '<leader>bn', '<cmd>enew<CR>', { desc = 'New buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })
vim.keymap.set('n', 'q', '<Nop>', { desc = 'Disable Macro Recording' })

vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (args)
        vim.lsp.inlay_hint.enable(true, {bufnr = args.buf })
    end,
})

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "Move left"  })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = "Move down"  })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = "Move up"    })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "Move right" })

vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

require('config.lazy')

require('neo-tree').setup({
    window = {
        position = "right",
    },
    source_selector = {
    winbar = true,
    status_line = true
    },
})


