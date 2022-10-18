local status, indentline = pcall(require, 'indent_blankline')
if not status then return end


indentline.setup({
  -- for example, context is off by default, use this to turn it on
  show_end_of_line = true,
  filetype = { 'python' },
  --[[ char = '|', ]]
  --[[ char_blankline = ' ' ]]
})
