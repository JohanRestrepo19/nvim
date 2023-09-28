local status, blank_line = pcall(require, 'ibl')
if not status then return end

blank_line.setup({ enabled = false })

local function opts(desc)
  return { desc = 'IndentBlankline: ' .. desc, noremap = true, silent = true, nowait = true }
end

vim.keymap.set('n', '<leader>ti', ':IBLToggle<cr>', opts('Toggle indent lines'))
