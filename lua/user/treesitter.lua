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
      "#fafafa",
      "#9F51B6",
      "#F7C244",
      "#F07850",
      "#9CDD29",
      "#C497D4",
    }, -- table of hex strings
    enable = false,
    -- disable = { "jsx", "cpp" }, -- list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- termcolors = {} -- table of colour name strings
  },
  sync_install = false,
}
