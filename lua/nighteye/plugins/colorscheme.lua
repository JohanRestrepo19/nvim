return {
  'bluz71/vim-nightfly-guicolors',
  priority = 1000,
  config = function()
    vim.g.nightflyCursorColor = true
    vim.g.nightflyVirtualTextColor = true
    vim.g.nightflyNormalFloat = false
    vim.g.nightflyTransparent = true
    -- vim.g.nightflyWinSeparator = 2

    -- local custom_highlight = vim.api.nvim_create_augroup('CustomHighlight', {})

    -- vim.api.nvim_create_autocmd('ColorScheme', {
    --   pattern = 'nightfly',
    --   callback = function()
    --     vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#011627' })
    --   end,
    --   group = custom_highlight,
    -- })


    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#00FF00", fg="#0000FF" })

    vim.cmd([[ colorscheme nightfly ]])
  end
}
