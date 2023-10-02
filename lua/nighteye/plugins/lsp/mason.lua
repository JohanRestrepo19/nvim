return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim'
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    local mason_tool_installer = require('mason-tool-installer')

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = {
        'cssls',
        'html',
        'intelephense',
        'lua_ls',
        'prismals',
        'pyright',
        'tailwindcss',
        'tsserver',
      },
      automatic_installation = true
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- 'autopep8',
        -- 'flake8',
        'prettierd',
        'eslint_d'
      }
    })
  end,
}
