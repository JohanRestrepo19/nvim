local status_ok, gruvbox = pcall(require, 'gruvbox')
if not status_ok then
  return
end
-- setup must be called before loading the colorscheme
-- Default options:
gruvbox.setup({
  undercurl = true,
  underline = true,
  bold = false,
  italic = true, -- will make italic comments and special strings
  inverse = false, -- invert background for search, diffs, statuslines and errors
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  contrast = "hard", -- can be "hard" or "soft"
  overrides = {
    SingColumn = { bg = "#ff9900" }
  },
})
vim.cmd([[
colorscheme gruvbox
hi! Normal ctermbg=NONE guibg=NONE
]])
