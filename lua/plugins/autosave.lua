return {
  "okuuva/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    enabled = true,
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost" },
      defer_save = {},
      cancel_deferred_save = {},
    },
    debounce_delay = 0,
    condition = function(buf)
      if vim.bo[buf].modifiable == false then
        return false
      end
      return true
    end,
    write_all_buffers = false,
  },
}
