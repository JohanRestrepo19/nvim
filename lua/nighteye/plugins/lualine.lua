return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require('lualine')

    lualine.setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        globalstatus = false,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          'packer',
          'NvimTree',
          statusline = {},
          winbar = {}
        },
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { {
          'filename',
          file_status = true, --displays file status
          path = 0,           -- 0 = just filename
        } },
        lualine_x = {
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = {
              error = ' ',
              warn = ' ',
              info = ' ',
              hint = ' '
            }
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
        lualine_c = { {
          'filename',
          file_status = true,
          path = 1 -- 1 = ralative path
        } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {}
    } end,
}
