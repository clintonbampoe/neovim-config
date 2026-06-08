return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim", -- for the picker UI
  },
  event = "LspAttach",
  config = function()
    require("tiny-code-action").setup()
  end,
  keys = {
    {
      "<C-.>",
      function() require("tiny-code-action").code_action() end,
      desc = "Code action"
    },
  },
}
