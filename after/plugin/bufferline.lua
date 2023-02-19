local status, bufferline = pcall(require, "bufferline")
if not status then return end

-- NOTE: Uncomment if I want to use custom highlights.
local themes = require('nighteye.bufferline-themes')

bufferline.setup {
    options = {
        mode = 'tabs',
        separator_style = 'slant',
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
    },
    -- NOTE: Uncomment if I want to use custom highlights.
    highlights = themes.mocha,
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
