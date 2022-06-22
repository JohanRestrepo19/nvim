local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  autotag = {
    enable = true
  },

  context_commentstring = {
    enable = true,
    config = {
      jsx_element = '{/* %s */}',
      jsx_fragment = '{/* %s */}',
      jsx_attribute = '// %s',
    },
    enable_autocmd = false,
  },

  ensure_installed = "all",

  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },

  ignore_install = { "" }, -- List of parsers to ignore installing
  indent = { enable = true, disable = { "yaml" } },

  rainbow = {
    colors = {
      -- "#fafafa",
      -- "#9F51B6",
      -- "#F7C244",
      -- "#F07850",
      -- "#9CDD29",
      -- "#C497D4",
      --  Gruvbox
      "#a89984",
      "#689d6a",
      "#458588",
      "#d79921",
      "#98971a",
      "#fb4934",

      -- "Cornsilk",
      -- "LawnGreen",
      -- "Gold",
      -- "DodgerBlue",
      -- "Orchid",
      -- "Salmon",
    }, -- table of hex strings
    enable = true,
    -- disable = { "jsx", "cpp" }, -- list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- termcolors = {} -- table of colour name strings
  },
  sync_install = false,
}
