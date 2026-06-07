# Config 

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.termguicolors = true
opt.background = "dark"
opt.clipboard = "unnamedplus"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250

require('config.lazy')

require('neo-tree').setup({
  source_selector = {
    winbar = true,
    status_line = true
    }
})


