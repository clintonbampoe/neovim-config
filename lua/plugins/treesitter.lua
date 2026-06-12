return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  main = "nvim-treesitter",
  config = function()
    require("nvim-treesitter").install({
      "markdown",
      "c_sharp",
      "xml",
      "javascript",
      "c",
      "cpp",
      "make",
      "cmake",
      "html",
      "css",
      "typescript",
      "lua",
      "vim",
    }, { max_jobs = 8 })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if lang then
          pcall(vim.treesitter.start, args.buf, lang)
        end
      end,
    })
  end,
}
