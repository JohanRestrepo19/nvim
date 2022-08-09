local status_ok, lualine = pcall(require, 'lualine')

if not status_ok then
  return
end

-- Change the background of lualine_a section for normal mode
local custom_gruvbox = require 'lualine.themes.gruvbox_dark'

custom_gruvbox.normal.a.bg = '#b8bb26'

lualine.setup {
  options = {
    icons_enabled = true,
    -- theme = 'solarized_dark',
    theme = 'auto',
    -- theme = custom_gruvbox,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    -- component_separators = '|',
    -- section_separators = { left = '', right = '' },
    disabled_filetypes = { 'packer' },
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'filename' },
    lualine_x = {
      {
        'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ',
          hint = ' ' }
      },
      'encoding',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      'filename',
    },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
