return {
  "stevearc/conform.nvim",
  dependencies = { "williamboman/mason.nvim" },
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      cs = { "csharpier" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      lua = { "stylua" },
      ["_"] = { "prettier" },
    },
    format_on_save = {
      timeout_ms = 3000,
      lsp_format = "fallback",
    },
  },
}
