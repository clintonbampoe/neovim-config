return {
  -- LSP (Roslyn)
  -- Formatter: csharpier, configured in conform.lua
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      filewatching = "auto",
      broad_search = false,
      lock_target = false,
    },
    init = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("roslyn", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          -- csharpier handles formatting, disable roslyn's formatter
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false

          vim.keymap.set("n", "<leader>fu", function()
            require("telescope.builtin").lsp_references({ show_line = false, fname_width = 60 })
          end, { buffer = bufnr, desc = "Find usages" })
        end,
        settings = {
          ["microsoft.copilot.enable"] = false,
          ["gitlab.duo.enable"] = false,
          ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_parameters = true,
          },
          ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
            dotnet_enable_tests_code_lens = true,
          },
          ["csharp|background_analysis"] = {
            dotnet_analyzer_diagnostics_scope = "fullSolution",
            dotnet_compiler_diagnostics_scope = "fullSolution",
          },
          ["csharp|completion"] = {
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_show_name_completion_suggestions = true,
          },
          ["csharp|symbol_search"] = {
            dotnet_search_reference_assemblies = true,
          },
        },
      })
    end,
  },

  -- DAP adapter (netcoredbg)
  {
    "mfussenegger/nvim-dap",
    optional = true,
    ft = { "cs" },
    config = function()
      local dap = require("dap")

      dap.adapters.coreclr = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg",
        args = { "--interpreter=vscode" },
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end,
        },
      }
    end,
  },
}
