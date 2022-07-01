local status_ok, saga = pcall(require, 'lspsaga')

if not status_ok then
  return
end

saga.setup = {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
  -- diagnostic sign
  -- error_sign = "",
  -- warn_sign = "",
  -- hint_sign = "",
  -- infor_sign = "",
}

vim.cmd [[
nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <C-k> <Cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> gx <Cmd>Lspsaga code_action<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
" nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
"nnoremap <silent> K <Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
" nnoremap <silent> gp <Cmd>Lspsaga preview_definition<CR>
" nnoremap <silent> gr <Cmd>Lspsaga rename<CR>
]]
