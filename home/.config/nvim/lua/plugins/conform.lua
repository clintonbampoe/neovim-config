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
      sh = { "shfmt" },
      bash = { "shfmt" },
    },
    formatters = {
      shfmt = { prepend_args = { "-i", "2", "-ci" } },
      csharpier = { timeout = 3000 },
    },
    format_on_save = {
      timeout_ms = 2000,
      lsp_format = "fallback",
    },
  },
}
