return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.config("clangd", {
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-flags=-std=c11",
        "-j=4",
      },
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
      },
      filetypes = { "c", "cpp" },
    })
    vim.lsp.enable("clangd")
  end,
}
