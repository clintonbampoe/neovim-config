return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    -- Basic settings
    size = 20,
    open_mapping = [[<c-\>]], -- Ctrl + \ to toggle
    direction = "float",      -- 'float', 'horizontal', 'vertical', 'tab'
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    
    -- Visuals for floating windows
    float_opts = {
      border = "curved", -- 'single', 'double', 'shadow', 'curved'
      winblend = 0,
    },
  },
}
