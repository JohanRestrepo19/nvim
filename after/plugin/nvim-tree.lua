local status, nvim_tree = pcall(require, 'nvim-tree')
if not status then return end

local api = require 'nvim-tree.api'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


local function custom_on_attach(bufnr)
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

nvim_tree.setup({
  on_attach = custom_on_attach
})


-- Outside tree mappings
local opts = { noremap = true, silent = true, nowait = true }
-- vim.keymap.set('n', '<leader>e', api.node.open.replace_tree_buffer, opts)
