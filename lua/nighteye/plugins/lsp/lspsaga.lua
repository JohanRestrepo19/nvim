return {
  'nvimdev/lspsaga.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    local opts = { noremap = true, silent = true }

    require('lspsaga').setup({
      ui = {
        border = 'rounded'
      },
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false
      },
      outline = {
        layout = 'float'
      }
    })

    vim.keymap.set('n', '<C-j>', ':Lspsaga diagnostic_jump_next<cr>', opts)
    vim.keymap.set('n', '<C-k>', ':Lspsaga diagnostic_jump_prev<cr>', opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', ':Lspsaga code_action<cr>', opts)
    vim.keymap.set('n', 'K', ':Lspsaga hover_doc<cr>', opts)
    vim.keymap.set('n', 'gl', ':Lspsaga show_line_diagnostics<cr>', opts)
  end
}
