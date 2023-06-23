local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then return end

local colors = {
  default = {
    'Gold',
    'Orchid',
    'LightSkyBlue',
    'LightGreen'
  },
  kanagawa = {
    '#98BB6C',
    '#7E9CD8',
    '#FF9E3B',
    '#E82424',
  },
  kanagawa_dragon = {
    '#DCA561',
    '#957FBB',
    '#A3D4D5',
    '#98BB6C'
  },
  gruvbox = {
    '#b57614	',
    '#8F3F71',
    '#427b58',
    '#076678',
  },
  empty = {}
}

ts.setup {

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },


  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },

  indent = {
    enable = true,
    disable = { "yaml" }
  },

  ensure_installed = {
    "lua",
    "c",
    "css",
    "gitcommit",
    "help",
    "html",
    "javascript",
    "json",
    "markdown",
    "php",
    "prisma",
    "python",
    "typescript",
    "tsx",
    "vim",
    "vue",
    "yaml",
  },

  autotag = {
    enable = true
  },

  ignore_install = { "" }, -- List of parsers to ignore installing

  rainbow = {
    -- Default
    colors = colors.empty,
    termcolors = {}, -- table of colour name strings
    enable = true,
    extended_mode = false,
    --[[ disable = { "php" }, -- list of languages you want to disable the plugin for ]]
    -- disable = { "jsx", "cpp" }, -- list of languages you want to disable the plugin for
  },
}
