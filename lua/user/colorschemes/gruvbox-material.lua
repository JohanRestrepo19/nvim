-- vim.cmd "colorscheme gruvbox-material"

vim.cmd [[
if has('termguicolors')
    set termguicolors
endif

set background=dark
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material
" let g:lightline.colorscheme = 'gruvbox_material'
]]



-- Transparent background
vim.cmd([[
highlight Normal ctermbg=none guibg=none
highlight NonText ctermbg=none guibg=none
]])
