local status, bufferline = pcall(require, "bufferline")
if not status then return end

local themes = require('nighteye.bufferline-themes')

bufferline.setup {
  options = {
    mode = 'tabs',
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    show_duplicate_prefix = false, -- whether to show duplicate buffer prefix
    --[[ diagnostics = "nvim_lsp", ]]
    --[[ diagnostics_indicator = function(count, level) ]]
    --[[   local icon = level:match("error") and " " or "" ]]
    --[[   return " " .. icon .. count ]]
    --[[ end ]]

  },
  highlights = themes.onedark_pro,
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
