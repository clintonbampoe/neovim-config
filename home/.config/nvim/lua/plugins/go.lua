return {
  'neovim/nvim-lspconfig',
  ft = { 'go', 'gomod', 'gowork', 'gotmpl' },
  config = function()
    vim.lsp.config('gopls', {
      cmd = { 'gopls' },
      filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
      root_markers = { 'go.work', 'go.mod', '.git' },
      settings = {
        gopls = {
          staticcheck = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
            shadow = true,
          },
        },
      },
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
      end,
    })
    vim.lsp.enable('gopls')
  end,
}
