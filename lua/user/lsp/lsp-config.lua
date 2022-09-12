require("nvim-lsp-installer").setup {}

local status, nvim_lsp = pcall(require, 'lspconfig')
if not status then return end

local colors_status, colors = pcall(require, 'lsp-colors')
if not colors_status then return end

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gl', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)

  -- Formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
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
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_flags = {
  debounce_text_changes = 150,
}

local servers = {
  'cssls',
  'clangd',
  'emmet_ls',
  'html',
  'intelephense',
  'pyright',
  'tsserver',
  'tailwindcss',
}

for _, value in pairs(servers) do
  nvim_lsp[value].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
  }
end

-- Special languages
nvim_lsp['sumneko_lua'].setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the 'vim' global
        globals = { 'vim' }
      }
    },

    workspace = {
      -- Make the server aware of Neovim runtime files
      library = vim.api.nvim_get_runtime_file('', true)
    }
  }
}


colors.setup {
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
}

local signs = {
  { name = "DiagnosticSignError", text = " " },
  { name = "DiagnosticSignWarn", text = " " },
  { name = "DiagnosticSignHint", text = " " },
  { name = "DiagnosticSignInfo", text = " " },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  -- disable virtual text
  virtual_text = {
    spacing = 2,
    prefix = ' '
  },
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = " ",
  },
}

vim.diagnostic.config(config)
