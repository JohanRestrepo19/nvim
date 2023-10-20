return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter.configs")

    ts.setup({
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },

      highlight = {
        enable = true, -- false will disable the whole extension
        disable = {}, -- list of language that will be disabled
      },

      indent = {
        enable = true,
        disable = {},
      },

      ensure_installed = {
        "lua",
        "c",
        "css",
        "gitcommit",
        "html",
        "javascript",
        "json",
        "markdown",
        "markdown_inline",
        "php",
        "prisma",
        "python",
        "typescript",
        "tsx",
        "vim",
        "vimdoc",
        "yaml",
      },

      autotag = {
        enable = true,
      },

      ignore_install = { "" }, -- List of parsers to ignore installing
    })
  end,
}
