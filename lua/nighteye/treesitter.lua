local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then return end

ts.setup {

  context_commentstring = {
    enable = true,
    config = {
      jsx_element = '{/* %s */}',
      jsx_fragment = '{/* %s */}',
      jsx_attribute = '// %s',
    },
    enable_autocmd = false,
  },


  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {}, -- list of language that will be disabled
  },

  indent = {
    enable = true,
    disable = { "yaml" }
  },

  ensure_installed = "all",

  autotag = {
    enable = true
  },

  ignore_install = { "" }, -- List of parsers to ignore installing

  rainbow = {
    -- Default
    colors = {
      'Gold',
      'Orchid',
      'LightSkyBlue',
      'LightGreen'
    },
    --[[ colors = { ]]
    --[[   '#6A9589', ]]
    --[[   '#957FB8	', ]]
    --[[   '#FF9E3B', ]]
    --[[   '#C34043', ]]
    --[[ }, ]]
    termcolors = {}, -- table of colour name strings
    enable = true,
    extended_mode = false,
    --[[ disable = { "php" }, -- list of languages you want to disable the plugin for ]]
    -- disable = { "jsx", "cpp" }, -- list of languages you want to disable the plugin for
  },
}
