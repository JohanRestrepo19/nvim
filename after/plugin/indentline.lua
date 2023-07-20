local status, blank_line = pcall(require, 'indent_blankline')
if not status then return end

blank_line.setup({
  enabled = false,
  use_treesitter = true
})

local function opts(desc)
  return { desc = 'IndentBlankline: ' .. desc, noremap = true, silent = true, nowait = true }
end

vim.keymap.set('n', '<leader>ti', ':IndentBlanklineToggle<cr>', opts('Toggle indent lines'))
