return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "clangd",
        "codelldb",
        "clang-format",
        "cmake-language-server",
        "bash-language-server",
        "shellcheck",
        "shfmt",
      },
    },
  },
}
