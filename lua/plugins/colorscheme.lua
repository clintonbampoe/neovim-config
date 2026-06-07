return {
  "folke/tokyonight.nvim",
  lazy = false, -- Load immediately
  priority = 1000, -- High priority
  opts = {
    style = "night", -- Options: "storm", "moon", "night", "day"
    transparent = false, -- Set to true for no background color
    terminal_colors = true, -- Configure terminal colors
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      sidebars = "dark", -- Style for sidebar windows (e.g., Neo-tree)
      floats = "dark", -- Style for floating windows
    },
    -- Optional: Override specific colors
    on_colors = function(colors)
      -- Example: colors.bg = "#000000"
    end,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight")
  end,
}   
