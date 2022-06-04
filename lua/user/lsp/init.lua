local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

--Principales
require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()

--Secuendarios
require("user.lsp.null-ls")
require("user.lsp.lsp-signature")

