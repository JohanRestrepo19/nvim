return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    {
      '<leader>ff',
      function()
        require('conform').format({ async = true, lsp_fallback = true })
      end,
      mode = { 'n', 'v' },
      desc = 'Format buffer'
    },
  },
  config = function()
    local conform = require('conform')
    local js_formatters = { { 'prettierd', 'prettier' } }

    conform.setup({
      formatters_by_ft = {
        python = { 'autopep8' },
        javascript = js_formatters,
        javascriptreact = js_formatters,
        typescript = js_formatters,
        typescriptreact = js_formatters,
        css = js_formatters,
        html= js_formatters,
        yaml = js_formatters,
        markdown = js_formatters,
      }
    })
  end
}
