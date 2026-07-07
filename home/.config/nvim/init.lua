local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.softtabstop = 4
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
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

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move right" })

-- Misc
vim.keymap.set("i", "<C-y>", "<Esc>o", { desc = "New line below" })
vim.keymap.set("n", "q", "<Nop>", { desc = "Disable macro recording" })

-- Diagnostics
vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

-- LSP: runs for every buffer an LSP attaches to
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf

    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

    vim.keymap.set("n", "gr", function()
      vim.lsp.buf.references({ include_declaration = true })
    end, { buffer = bufnr, desc = "References" })

    -- K is the vim convention for hover; avoids <C-k> conflict with window nav
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover docs" })
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename symbol" })
  end,
})

-- Toggle inlay hints for current buffer
vim.api.nvim_create_user_command("ToggleInlayHints", function()
  local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
  vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
end, {})
vim.keymap.set("n", "<leader>th", "<cmd>ToggleInlayHints<cr>", { desc = "Toggle inlay hints" })

-- Mason binaries on PATH so LSPs/tools work without full paths
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

-- Session Save options
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
require("config.lazy")
