local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
  return
end

null_ls.setup({
on_attach = function (client)
    --Format on save
    if client.resolved_capabilities.document_formatting then
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
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.prettier,

    -- Diagnostics
    null_ls.builtins.diagnostics.flake8,
  }
})
