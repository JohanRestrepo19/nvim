local status, gruvbox = pcall(require, 'gruvbox')
if not status then return end

gruvbox.setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = false,
  invert_selection = true,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = false, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})

vim.cmd("colorscheme gruvbox")
