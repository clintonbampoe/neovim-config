return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.config("bashls", {
      filetypes = { "sh", "bash" },
      settings = {
        bashIde = {
          shellcheckPath = vim.fn.exepath("shellcheck"),
        },
      },
    })
    vim.lsp.enable("bash-language-server")
  end,
}
