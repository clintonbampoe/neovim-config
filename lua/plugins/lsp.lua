return {
  'neovim/nvim-lspconfig',
  config = function()
    -- LSP Keybindings & Actions
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions and keymaps',
      callback = function(event)
        local opts = { buffer = event.buf }

        -- Standard navigation & actions
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'Go to Definition' }))
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = 'Show References' }))
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'Hover Documentation' }))

        -- Modification actions
        vim.keymap.set(
          'n',
          '<leader>ca',
          vim.lsp.buf.code_action,
          vim.tbl_extend('force', opts, { desc = 'Code Action' })
        )
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename Symbol' }))
      end,
    })

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
    vim.lsp.config('neocmake', {
      single_file_support = true,
      init_options = {
        format = { enable = true },
        lint = { enable = true },
      },
    })
    vim.lsp.enable('neocmake')

    -- Go
    vim.lsp.config('gopls', {
      cmd = { 'gopls' },
      filetypes = { 'go', 'gomod', 'gowork' },
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

    -- Nginx
    vim.lsp.config('nginx_language_server', {
      cmd = { 'nginx-language-server' },
      filetypes = { 'nginx' },
      root_markers = { 'nginx.conf', '.git' },
    })
    vim.lsp.enable('nginx_language_server')

    -- XML
    vim.lsp.config('lemminx', {
      cmd = { 'lemminx' },
      filetypes = { 'xml', 'xsl', 'xslt', 'svg' },
      root_markers = { '.git' },
      settings = {
        xml = {
          format = { enabled = true },
          validation = { enabled = true, schema = true },
        },
      },
    })
    vim.lsp.enable('lemminx')

    -- PYTHON
    vim.lsp.config('pyright', {
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = 'openFilesOnly',
            typeCheckingMode = 'standard', -- change to 'standard' or 'strict' if desired
          },
        },
      },
    })
    vim.lsp.enable('pyright')

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
    vim.lsp.enable('lua_ls')

    -- YAML
    vim.lsp.config('yamlls', {
      cmd = { 'yaml-language-server', '--stdio' },
      filetypes = { 'yaml', 'yaml.docker-compose', 'yaml.gitlab', 'yaml.helm-values' },
      root_markers = { '.git' },
      settings = {
        yaml = {
          format = { enable = true, singleQuote = true },
          validate = true,
          hover = true,
          completion = true,
          redhat = { telemetry = { enabled = false } },
        },
      },
    })
    vim.lsp.enable('yamlls')

    -- TYPESCRIPT
    vim.lsp.config('vtsls', {
      cmd = { 'vtsls', '--stdio' },
      filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
      root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
      end,
    })
    vim.lsp.enable('vtsls')
  end,
}
