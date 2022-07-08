-- vim.cmd "colorscheme gruvbox-material"

vim.cmd [[
if has('termguicolors')
    set termguicolors
endif

set background=dark
let g:gruvbox_material_background = 'soft' "soft, medium, hard
let g:gruvbox_material_palette = 'mix' "material, mix, original
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_enable_bold = 0
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_diagnostic_virtual_text = 'colored'
let g:gruvbox_material_ui_contrast = 'high'
let g:gruvbox_material_transparent_background = 1
colorscheme gruvbox-material
]]
