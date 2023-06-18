require('mason').setup()
require('mason-lspconfig').setup {
  automatic_installation = true,
  ensure_install = { 'lua_ls' }
}

local status, nvim_lsp = pcall(require, 'lspconfig')
if not status then return end

local colors_status, colors = pcall(require, 'lsp-colors')
if not colors_status then return end

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

colors.setup {
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
}

local config = {
  virtual_text = {
    spacing = 2,
    prefix = "● ",
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    border = "rounded",
    source = "always",
    prefix = "● ",
  },
}

vim.diagnostic.config(config)
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gl', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)

  -- Formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[augroup END]]
  end

  -- Disable formatting capabilities for the specified languages
  local languages = { 'tsserver', 'html', 'jsonls' }
  for _, value in pairs(languages) do
    if client.name == value then
      client.server_capabilities.document_formatting = false
    end
  end
end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_flags = {
  debounce_text_changes = 150,
}

local servers = {
  'clangd',
  'cssls',
  'html',
  'intelephense',
  'jsonls',
  'prismals',
  'pyright',
  'tailwindcss',
  'tsserver',
  'volar',
}

for _, value in pairs(servers) do
  nvim_lsp[value].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
  }
end

-- Special languages
nvim_lsp['lua_ls'].setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the 'vim' global
        globals = { 'vim' }
      },
      format = {
        defaultConfig = {
          indent_style = "space",
          indent_size = "2"
        }
      }
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = vim.api.nvim_get_runtime_file('', true)
    }
  }
}
