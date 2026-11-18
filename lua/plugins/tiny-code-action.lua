return {
  'rachartier/tiny-code-action.nvim',
  event = 'LspAttach',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('tiny-code-action').setup()
  end,
  keys = {
    {
      'g.',
      function()
        require('telescope')
        require('tiny-code-action').code_action()
      end,
      mode = { 'n', 'x' },
      desc = 'Code action',
    },
  },
}
