local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- Main
require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()

-- Secondary
require("user.lsp.lsp-signature")
require("user.lsp.null-ls")

