return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = 'hrsh7th/cmp-nvim-lsp',

  config = function()
    local lspconfig = require('lspconfig')

    -- Diagnostic symbols in the sign column (gutter)
    local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

    for type, icon in pairs(signs) do
      local hl_name = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl_name, { text = icon, texthl = hl_name, numhl = '' })
    end

    -- Diagnostic config.
    vim.diagnostic.config({
      virtual_text = { prefix = '●' },
      update_in_insert = true,
      float = {
        focusable = true,
        border = 'single',
        source = 'always',
        prefix = '● ',
      },
    })

    local on_attach = function(_, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
      vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local lsp_flags = { debounce_text_changes = 150 }

    local servers = {
      'cssls',
      'html',
      'intelephense',
      'lua_ls',
      'prismals',
      'pyright',
      'tailwindcss',
      'tsserver',
    }

    for _, value in pairs(servers) do
      lspconfig[value].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
      })
    end

    -- Special lsp configurations.
    lspconfig['lua_ls'].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      flags = lsp_flags,
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the 'vim' global
            globals = { 'vim' }
          },
          format = {
            defaultConfig = {
              indent_style = 'space',
              indent_size = '2',
            },
          },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file('', true)
        }
      }
    })
  end
}
