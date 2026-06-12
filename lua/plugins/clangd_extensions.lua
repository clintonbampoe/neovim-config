return {
  "p00f/clangd_extensions.nvim",
  lazy = true,
  ft = { "c", "cpp" },
  opts = {
    inlay_hints = {
      inline = true,
      show_parameter_hints = true,
      parameter_hints_prefix = " ",
      other_hints_prefix = "=> ",
    },
  },
}
