return {
  -- LSP + shellcheck integration
  -- Formatter: shfmt, configured in conform.lua

  "neovim/nvim-lspconfig",
  ft = { "sh", "bash" },
  config = function()
    vim.lsp.config("bashls", {
      filetypes = { "sh", "bash" },
      settings = {
        bashIde = {
          shellcheckPath = vim.fn.exepath("shellcheck"),
        },
      },
    })
    vim.lsp.enable("bashls")
  end,
}
