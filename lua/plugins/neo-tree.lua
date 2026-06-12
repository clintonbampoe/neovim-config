return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
      },
      follow_current_file = { enabled = true },
    },
    default_component_configs = {
      git_status = {
        symbols = {
          -- Only define the three you want
          added = "+",
          modified = "*",
          deleted = "-",
        },
      },
    },
  },
}
