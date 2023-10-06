return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require('lint')
    local js_linters = { 'eslint_d' }

    lint.linters_by_ft = {
      pyton = { 'flake8' },
      javascript = js_linters,
      javascriptreact = js_linters,
      typescript = js_linters,
      typescriptreact = js_linters,
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end
    })
  end
}
