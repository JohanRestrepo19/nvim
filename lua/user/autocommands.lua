-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
})

-- Fixes Autocomment in newlines
vim.api.nvim_create_autocmd({'BufWinEnter'}, {
  callback = function ()
    vim.cmd "set formatoptions-=cro"
  end,
})