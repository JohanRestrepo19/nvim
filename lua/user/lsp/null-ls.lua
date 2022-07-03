local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  on_attach = function(client)
    --Format on save
    if client.server_capabilities.document_formatting then
      vim.cmd([[
        augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
        ]])
    end
  end,
  sources = {
    -- Formatters
    formatting.autopep8,
    formatting.prettier,

    -- Diagnostics
    diagnostics.flake8,
    diagnostics.eslint
  }
})
