local keymap = vim.keymap.set
local status, saga = pcall(require, 'lspsaga')
if not status then return end

saga.init_lsp_saga {
  server_filetype_map = {}
}

local opts = { noremap = true, silent = true }

keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
keymap('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
keymap('n', '<leader>ca', '<Cmd>Lspsaga code_action<cr>', opts)
--[[ vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts) ]]
keymap('n', 'gp', '<Cmd>Lspsaga preview_definition<cr>', opts)
keymap('n', 'gr', '<Cmd>Lspsaga rename<cr>', opts)
