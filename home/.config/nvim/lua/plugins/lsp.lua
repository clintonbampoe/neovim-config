return {
  'neovim/nvim-lspconfig',
  config = function()
    -- Bash
    vim.lsp.config('bashls', {
      filetypes = { 'sh', 'bash' },
      settings = {
        bashIde = {
          shellcheckPath = vim.fn.exepath('shellcheck'),
        },
      },
    })
    vim.lsp.enable('bashls')

    -- C / C++
    vim.lsp.config('clangd', {
      cmd = {
        'clangd',
        '--background-index',
        '--clang-tidy',
        '--header-insertion=iwyu',
        '--completion-style=detailed',
        '--function-arg-placeholders',
        '--fallback-flags=-std=c11',
        '-j=4',
      },
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
      },
      filetypes = { 'c', 'cpp' },
    })
    vim.lsp.enable('clangd')

    -- CMake
    vim.lsp.config('cmake', {
      cmd = { 'cmake-language-server' },
      filetypes = { 'cmake' },
      init_options = { buildDirectory = 'build' },
      root_markers = { 'CMakeLists.txt', 'CMakePresets.json' },
      capabilities = {
        documentFormattingProvider = false,
      },
    })
    vim.lsp.enable('cmake')

    -- Go
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

    -- XML
    vim.lsp.config('lemminx', {
      cmd = { 'lemminx' },
      filetypes = { 'xml', 'xsd', 'xsl', 'xslt', 'svg' },
      root_markers = { '.git' },
      settings = {
        xml = {
          format = { enabled = false }, -- Prettier owns formatting
          validation = { enabled = true, schema = true },
        },
      },
    })
    vim.lsp.enable('lemminx')
  end,
}
