return {
  'bluz71/vim-nightfly-guicolors',
  priority = 1000,
  config = function ()

    vim.g.nightflyCursorColor = true
    vim.g.nightflyVirtualTextColor = true
    vim.g.nightflyTransparent = true
    vim.g.nightflyWinSeparator = 2

    vim.cmd([[colorscheme nightfly]])
  end
}
