local status, bufferline = pcall(require, "bufferline")
if not status then return end

bufferline.setup {
  options = {
    mode = 'tabs',
    separator_style = 'thick',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or ""
      return " " .. icon .. count
    end

  },
  --[[ highlights = { ]]
  --[[   -- Neosolarized ]]
  --[[   separator = { ]]
  --[[     fg = '#073642', ]]
  --[[     bg = '#002b36' ]]
  --[[   }, ]]
  --[[   separator_selected = { ]]
  --[[     fg = '#073642' ]]
  --[[   }, ]]
  --[[   background = { ]]
  --[[     fg = '#657b83', ]]
  --[[     bg = '#002b36' ]]
  --[[   }, ]]
  --[[   buffer_selected = { ]]
  --[[     fg = '#fdf6e3', ]]
  --[[     bold = true ]]
  --[[   }, ]]
  --[[   fill = { ]]
  --[[     bg = '#073642' ]]
  --[[   } ]]
  --[[ }, ]]
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
