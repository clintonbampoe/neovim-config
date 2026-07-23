return {
  "neovim/nvim-lspconfig",
  ft = { "xml", "xsd", "xsl", "xslt", "svg" },
  config = function()
    vim.lsp.config("lemminx", {
      cmd = { "lemminx" },
      filetypes = { "xml", "xsd", "xsl", "xslt", "svg" },
      root_markers = { ".git" },
      settings = {
        xml = {
          format = { enabled = false }, -- Prettier owns formatting
          validation = { enabled = true, schema = true },
        },
      },
    })
    vim.lsp.enable("lemminx")
  end,
}
