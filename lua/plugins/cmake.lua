return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.config("cmake", {
      cmd = { "cmake-language-server" },
      filetypes = { "cmake" },
      init_options = {
        buildDirectory = "build",
      },
      root_markers = { "CMakeLists.txt", "CMakePresets.json" },
      capabilities = {
        documentFormattingProvider = false,
      },
    })
    vim.lsp.enable("cmake")
  end,
}
