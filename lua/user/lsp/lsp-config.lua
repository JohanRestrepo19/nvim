require("nvim-lsp-installer").setup {}
local nvim_lsp = require("lspconfig")

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
  -- { name = "DiagnosticSignError", text = "" },
  -- { name = "DiagnosticSignWarn", text = "" },
  -- { name = "DiagnosticSignHint", text = "" },
  -- { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  -- disable virtual text
  virtual_text = {
    spacing = 4,
    prefix = ''
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
    prefix = "",
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

-- Highlight function
local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]] ,
      false
    )
  end
end

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'grr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting_seq_sync, bufopts)
  vim.keymap.set('n', 'gl', vim.diagnostic.open_float, bufopts)

  -- Formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end

  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
  end

  if client.name == "html" then
    client.server_capabilities.document_formatting = false
  end

  if client.name == "jsonls" then
    client.server_capabilities.document_formatting = false
  end

  lsp_highlight_document(client)
end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_flags = {
  debounce_text_changes = 150,
}


nvim_lsp['tsserver'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags
}

nvim_lsp['jsonls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags
}

nvim_lsp['sumneko_lua'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  settings = {}
}

nvim_lsp['pyright'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags
}

nvim_lsp['intelephense'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags
}

nvim_lsp['tailwindcss'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags
}
