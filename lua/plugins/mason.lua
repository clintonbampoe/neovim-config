return {
  { 'williamboman/mason.nvim', opts = {} },

  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = {
        -- C/C++
        'clangd',
        'codelldb',
        'clang-format',

        -- CMake
        'neocmakelsp',
        'gersemi',

        -- C#
        'netcoredbg',
        'roslyn-language-server',
        'csharpier',

        -- Dockerfile
        'dockerfmt',

        -- YAML
        'yaml-language-server',
        'yamlfix',

        -- Python
        'pyright',
        'ruff',

        --XML
        'lemminx',

        -- Go
        'gopls',
        'gofumpt',
        'goimports',
        'golangci-lint',

        -- Bash
        'bash-language-server',
        'shellcheck',
        'shfmt',

        -- Lua
        'stylua',

        -- Nginx,
        'nginx-language-server',

        -- Typescript
        'vtsls',

        -- Other
        'prettier',
      },
    },
  },
}
