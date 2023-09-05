vim.cmd([[

if has('termguicolors')
  set termguicolors
endif

set background=dark

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_foreground = 'material'
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_enable_bold = 0
let g:gruvbox_material_enable_italic = 0
let g:gruvbox_material_cursor = 'auto'
let g:gruvbox_material_transparent_background = 2
let g:gruvbox_material_visual = 'reverse'
let g:gruvbox_material_float_style = 'bright'
let g:gruvbox_material_diagnostic_virtual_text = 'colored'
let g:gruvbox_material_better_performance = 1

colorscheme gruvbox-material
]])
