vim.g.material_style = "darker" -- darker, lighter, oceaninc, palenight, deep ocean

require('material').setup({
  contrast = {
    sidebars = true,
    floating_windows = true,
    line_numbers = false,
    sign_column = false,
    cursor_line = false,
    non_current_windows = false,
    popup_menu = false
  },
  italics = {
    comments = false,
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
    background = true,
    term_colors = false,
    eob_lines = false
  }
})

vim.cmd('colorscheme material')