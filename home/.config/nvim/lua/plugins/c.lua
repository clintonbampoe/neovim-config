return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    ft = { "c", "cpp" },
    config = function()
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-flags=-std=c11",
          "-j=4",
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
        filetypes = { "c", "cpp" },
      })
      vim.lsp.enable("clangd")
    end,
  },

  -- Inlay hints + clangd-specific extensions
  {
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
  },

  -- DAP adapter (codelldb)
  -- Formatter: clang-format, configured in conform.lua
  {
    "mfussenegger/nvim-dap",
    optional = true,
    ft = { "c", "cpp" },
    config = function()
      local dap = require("dap")

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      local config = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      dap.configurations.c = config
      dap.configurations.cpp = config
    end,
  },
}
