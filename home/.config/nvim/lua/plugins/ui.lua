return {
  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'auto',
        -- component_separators = { left = '\u{e0b5}', right = '\u{e0b7}' },
        component_separators = { left = '', right = '' },
        section_separators = { left = '\u{e0b4}', right = '\u{e0b6}' },
        globalstatus = true,
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    },
  },

  -- -- Buffer tabs
  -- {
  --   'akinsho/bufferline.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   event = 'VeryLazy',
  --   keys = {
  --     { '<Tab>', '<cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
  --     { '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Prev buffer' },
  --     { '<leader>bn', '<cmd>enew<CR>', desc = 'New buffer' },
  --     { '<leader>bd', '<cmd>bdelete<CR>', desc = 'Delete buffer' },
  --   },
  --   opts = {
  --     options = {
  --       mode = 'buffers',
  --       diagnostics = 'nvim_lsp',
  --       offsets = { { filetype = 'neo-tree', text = 'Explorer' } },
  --     },
  --   },
  -- },

  -- Indent guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
}
