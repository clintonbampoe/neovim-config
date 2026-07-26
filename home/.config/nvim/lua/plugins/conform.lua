return {
  'stevearc/conform.nvim',
  dependencies = { 'williamboman/mason.nvim' },
  event = 'BufWritePre',
  cmd = 'ConformInfo',
  opts = {
    formatters_by_ft = {
      c = { 'clang-format' },
      cpp = { 'clang-format' },
      cs = { 'csharpier' },
      go = { 'goimports', 'gofumpt' },
      lua = { 'stylua' },
      xml = { 'prettier' },
      sh = { 'shfmt' },
      bash = { 'shfmt' },
      json = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
    },
    format_after_save = {
      lsp_format = 'fallback',
    },
    formatters = {
      shfmt = { prepend_args = { '-i', '2', '-ci' } },
      prettier = {
        command = 'prettier',
        args = {
          '--parser',
          'xml',
          '--xml-whitespace-sensitivity',
          'ignore',
        },
      },
    },
  },
}
