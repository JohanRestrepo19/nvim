return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = "hrsh7th/cmp-nvim-lsp",

  config = function()
    local lspconfig = require("lspconfig")

    -- Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

    for type, icon in pairs(signs) do
      local hl_name = "DiagnosticSign" .. type
      vim.fn.sign_define(hl_name, { text = icon, texthl = hl_name, numhl = "" })
    end

    -- Borders for hover menus
    local border = {
      { "╭", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╮", "FloatBorder" },
      { "│", "FloatBorder" },
      { "╯", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╰", "FloatBorder" },
      { "│", "FloatBorder" },
    }

    -- Override globally
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or border
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    -- Diagnostic config.
    vim.diagnostic.config({
      virtual_text = { prefix = "󰆧 " },
      update_in_insert = false,
    })

    local on_attach = function(_, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "<leader>ff", function()
        vim.lsp.buf.format({ async = true })
      end, bufopts)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, bufopts)
      vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, bufopts)
      vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, bufopts)
      vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local lsp_flags = { debounce_text_changes = 150 }

    local servers = {
      "cssls",
      "html",
      "intelephense",
      "lua_ls",
      "prismals",
      "pyright",
      "tailwindcss",
      "taplo",
      "tsserver",
    }

    for _, value in pairs(servers) do
      lspconfig[value].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
        -- handlers = handlers,
      })
    end

    -- Special lsp configurations.
    lspconfig["lua_ls"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      flags = lsp_flags,
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the 'vim' global
            globals = { "vim" },
          },
          format = {
            defaultConfig = {
              indent_style = "space",
              indent_size = "2",
            },
          },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
      },
    })
  end,
}
