local status, bufferline = pcall(require, "bufferline")
if not status then return end

bufferline.setup {
  options = {
    mode = 'tabs',
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {

    separator = {
      fg = '#242424',
      bg = '#3d3d3d'
    },
    separator_selected = {
      fg = '#242424'
    },
    background = {
      fg = '#fdf6e3',
      bg = '#3d3d3d'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true
    },
    fill = {
      bg = '#242424'
    }

    --[[ separator = { ]]
    --[[   fg = '#073642', ]]
    --[[   bg = '#002b36' ]]
    --[[ }, ]]
    --[[ separator_selected = { ]]
    --[[   fg = '#073642' ]]
    --[[ }, ]]
    --[[ background = { ]]
    --[[   fg = '#657b83', ]]
    --[[   bg = '#002b36' ]]
    --[[ }, ]]
    --[[ buffer_selected = { ]]
    --[[   fg = '#fdf6e3', ]]
    --[[   bold = true ]]
    --[[ }, ]]
    --[[ fill = { ]]
    --[[   bg = '#073642' ]]
    --[[ } ]]
  },
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
