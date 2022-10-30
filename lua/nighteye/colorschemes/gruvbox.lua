local status, gruvbox = pcall(require, 'gruvbox')
if not status then return end

gruvbox.setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "soft", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
    SignColumn = { bg = 'NONE' },
    GruvboxGreenSign = { bg = 'NONE' },
    GruvboxRedSign = { bg = 'NONE' },
    GruvboxYellowSign = { bg = 'NONE' },
    GruvboxBlueSign = { bg = 'NONE' },
    GruvboxPurpleSign = { bg = 'NONE' },
    GruvboxAquaSign = { bg = 'NONE' },
    GruvboxOrangeSign = { bg = 'NONE' },
  },
  dim_inactive = false,
  transparent_mode = true,
})

vim.cmd('colorscheme gruvbox')
