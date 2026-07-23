return {
  "stevearc/conform.nvim",
  dependencies = { "williamboman/mason.nvim" },
  event = "BufWritePre",
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      c = { "clang-format" },
      cpp = { "clang-format" },
      cs = { "csharpier" },
      lua = { "stylua" },
      xml = { "prettier" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
    },
    formatters = {
      shfmt = { prepend_args = { "-i", "2", "-ci" } },
      csharpier = { timeout = 2000 },
      prettier = {
        command = "prettier",
        args = {
          "--parser",
          "xml",
          "--xml-whitespace-sensitivity", -- Prevents Prettier from ignoring whitespace
          "ignore",
        },
      },
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
      },
    },
  },
}
