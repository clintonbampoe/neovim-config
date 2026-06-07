return {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
    dependencies = {
        {
            -- Optional: If you use mason to manage the server installation
            "williamboman/mason.nvim",
        }
    },
    opts = {
        filewatching = "auto",
        broad_search = false,
        lock_target = false,
    },
    init = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        
        vim.lsp.config("roslyn", {
            on_attach = function(client, bufnr)
                -- Define C#-specific LSP keymaps and autocmds here
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end,
            settings = {
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
                ["csharp|symbol_search"] = {
                    dotnet_search_reference_assemblies = true,
                },
            },
        })
    end,
}
