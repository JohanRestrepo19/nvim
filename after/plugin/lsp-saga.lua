local keymap = vim.keymap.set
local status, saga = pcall(require, 'lspsaga')
if not status then return end
local opts = { noremap = true, silent = true }

saga.setup({
  server_filetype_map = {},
  symbol_in_winbar = {
    enable = true,
    separator = '  ',
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = true,
    color_mode = false,
  },
})


keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
keymap('n', '<C-k>', '<Cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
keymap('n', '<leader>ca', '<Cmd>Lspsaga code_action<cr>', opts)
--[[ vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts) ]]
--[[ keymap('n', 'gp', '<Cmd>Lspsaga preview_definition<cr>', opts) ]]
--[[ keymap('n', '<leader>rn', '<Cmd>Lspsaga rename<cr>', opts) ]]
