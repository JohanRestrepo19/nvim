vim.g.material_style = "darker" -- darker, lighter, oceaninc, palenight, deep ocean

require('material').setup({
  contrast = {
    sidebars = false,
    floating_windows = false,
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
    darker = true
  },
  disable = {
    borders = false,
    background = true,
    term_colors = false,
    eob_lines = false
  }
})

vim.cmd('colorscheme material')
