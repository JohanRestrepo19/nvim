vim.g.material_style = "oceaninc" -- darker, lighter, oceaninc, palenight, deep ocean

require('material').setup({
  contrast = {
    sidebars = true,
    floating_windows = true,
    line_numbers = false,
    sign_column = false,
    cursor_line = true,
    non_current_windows = false,
    popup_menu = false
  },
  italics = {
    comments = true,
    strings = true,
    keywords = true,
    functions = true,
    variables = false
  },
  contrast_filetypes = {},
  high_visibility = {
    lighter = false,
    darker = false
  },
  disable = {
    borders = false,
    background = false,
    term_colors = false,
    eob_lines = false
  }
})

vim.cmd('colorscheme material')
