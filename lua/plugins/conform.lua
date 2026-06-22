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
      sh = { "shfmt" },
      bash = { "shfmt" },
      ["_"] = { "prettier" },
    },

    formatters = {
      shfmt = {
        prepend_args = { "-i", "2", "-ci" },
      },
    },

    format_on_save = {
      timeout_ms = 2000,
      lsp_format = "fallback",
    },
  },
}
