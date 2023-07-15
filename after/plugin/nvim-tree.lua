local status, nvim_tree = pcall(require, 'nvim-tree')
if not status then return end

local api = require 'nvim-tree.api'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


local function custom_on_attach(bufnr)
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'c', api.fs.create, opts('Create new file'))
  vim.keymap.set('n', '<Tab>', api.marks.toggle, opts('Mark file'))
  vim.keymap.set('n', 'm', api.marks.bulk.move, opts('Move bookmarked'))
  vim.keymap.set('n', 'h', api.node.navigate.parent, opts('Go to parent directory'))
  vim.keymap.set('n', 'ss', api.node.open.horizontal, opts('Open horizontal split'))
  vim.keymap.set('n', 'sv', api.node.open.vertical, opts('Open vertical split'))
  vim.keymap.set('n', 'tt', api.node.open.tab, opts('Open file in new tab'))
  vim.keymap.set('n', 'y', api.fs.copy.node, opts('Copy file'))
  vim.keymap.set('n', 'p', api.fs.paste, opts('Paste file'))
end

nvim_tree.setup({
  on_attach = custom_on_attach
})


-- Outside tree mappings
local opts = { noremap = true, silent = true, nowait = true }
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>', opts)
