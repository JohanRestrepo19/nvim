local status, bufferline = pcall(require, "bufferline")
if not status then return end

-- NOTE: Uncomment if I want to use custom highlights.
--[[ local themes = require('nighteye.bufferline-themes') ]]

bufferline.setup {
  options = {
    mode = 'tabs',
    separator_style = 'thin',
    always_show_bufferline = false,
    show_buffer_close_icons = true,
    show_close_icon = false,
    color_icons = true,
    show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
    --[[ diagnostics = "nvim_lsp", ]]
    --[[ diagnostics_indicator = function(count, level) ]]
    --[[   local icon = level:match("error") and " " or "" ]]
    --[[   return " " .. icon .. count ]]
    --[[ end ]]

  },
  -- NOTE: Uncomment if I want to use custom highlights.
  --[[ highlights = themes.kanagawa, ]]
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
