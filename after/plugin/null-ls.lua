local status, null_ls = pcall(require, "null-ls")
if not status then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    -- Formatters
    formatting.autopep8,
    formatting.prettierd.with({
      filetypes = {
        "javascript", "javascriptreact", "typescript", "typescriptreact",
        "vue", "css", "scss", "less", "html",
        "yaml", "markdown", "markdown.mdx", "graphql", "handlebars"
      }
    }),

    -- Diagnostics
    diagnostics.flake8,
    diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
  },
  -- Format on save
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
