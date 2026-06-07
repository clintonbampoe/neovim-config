return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        signs = {
            add = { text = "│" },
            change = { text = "│" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
        },
        signcolumn = true,  -- Show in the sign column
        numhl = false,      -- Disable number line highlighting
        linehl = false,     -- Disable entire line highlighting
        watch_gitdir = {
            follow_files = true,
        },
    },
}
