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
    colors = {
      'Gold',
      'Orchid',
      'LightSkyBlue',
      'LightRed'
    },
    termcolors = {}, -- table of colour name strings
    enable = false,
    extended_mode = false,
    -- disable = { "jsx", "cpp" }, -- list of languages you want to disable the plugin for
  },
}
