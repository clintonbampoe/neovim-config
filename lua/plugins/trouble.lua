return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {}, -- use default config
  keys = {
    { "<leader>ft", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace diagnostics" },
    { "<C-t>", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
  },
}
