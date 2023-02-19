local status, lualine = pcall(require, 'lualine')
if not status then return end

local custom_gruvbox = require('lualine.themes.gruvbox')
custom_gruvbox.normal.a.bg = '#b8bb26'

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        --[[ component_separators = '', ]]
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
            path = 0, -- 0 = just filename
        } },
        --[[ lualine_x = { 'encoding', 'fileformat', 'filetype' }, ]]
        lualine_x = {
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = { error = ' ', warn = ' ', info = ' ',
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
}
