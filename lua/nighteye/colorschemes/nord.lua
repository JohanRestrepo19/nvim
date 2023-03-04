vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = true
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = false

local status_ok, nord = pcall(require, 'nord')
if not status_ok then return end
nord.set()

vim.cmd [[colorscheme nord]]
