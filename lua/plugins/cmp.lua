return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- Extracts completions from Roslyn
        "hrsh7th/cmp-buffer",   -- Extracts words from the current buffer
        "hrsh7th/cmp-path",     -- Completes file system paths
        {
            "L3MON4D3/LuaSnip",     -- Required snippet engine
            dependencies = { "rafamadriz/friendly-snippets" },
            config = function() 
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({

            -- 1. Enable automatic popup and preselection
            completion = {
                autocomplete = { cmp.TriggerEvent.TextChanged },
                completeopt = "menu,menuone",
            }, 

            -- 2. Configure preselection behaviour
            preselect = cmp.PreselectMode.Item,

            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                
                -- Use Tab to accept the match if visible, otherwise insert a tab
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                
                -- Use Escape to close the menu and stop matching
                ["<Esc>"] = cmp.mapping.abort(),
                
                -- Allow Enter to also confirm
                ["<CR>"] = cmp.mapping.confirm({ select = false }), 
            }),
            
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
                { name = "path" },
            })
        })
    end,
}
