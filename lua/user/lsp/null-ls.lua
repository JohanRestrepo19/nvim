local status, null_ls = pcall(require, "null-ls")

if not status then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    -- Formatters
    formatting.autopep8,
    formatting.prettierd,

    -- Diagnostics
    diagnostics.flake8,
    diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    })
  }
})
