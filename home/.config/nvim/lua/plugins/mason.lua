return {
  { "williamboman/mason.nvim", opts = {} },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        -- C/C++
        "clangd",
        "codelldb",
        "clang-format",

        -- CMake
        "cmake-language-server",

        -- C#
        "netcoredbg",

        --XML
        "lemminx",

        -- Go
        "gopls",
        "gofumpt",
        "goimports",

        -- Bash
        "bash-language-server",
        "shellcheck",
        "shfmt",

        -- Lua
        "stylua",
      },
    },
  },
}
