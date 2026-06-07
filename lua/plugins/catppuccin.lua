return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Ensure it loads before other plugins
  config = function()
    require("catppuccin").setup({
      -- Optional: Add your flavor configuration here
      flavour = "mocha", -- "latte", "frappe", "macchiato", or "mocha"
    })
  end,
}
