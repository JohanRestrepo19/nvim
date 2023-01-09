local status, cmp = pcall(require, "cmp")
if not status then return end

local lspkind = require('lspkind')

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

-- Load default snippets
require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    --[[ completion = cmp.config.window.bordered(), ]]
    --[[ documentation = cmp.config.window.bordered() ]]
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    },

  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip", keyword_length = 3 },
    { name = "buffer", keyword_length = 5 },
    { name = "path" },
  }),

  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      --[[ before = function(entry, vim_item) ]]
      --[[   -- Kind icons ]]
      --[[   vim_item.menu = ({ ]]
      --[[     nvim_lsp = "[LSP]", ]]
      --[[     nvim_lua = "[NVIM_LUA]", ]]
      --[[     luasnip = "[Snippet]", ]]
      --[[     buffer = "[Buffer]", ]]
      --[[     path = "[Path]", ]]
      --[[   })[entry.source.name] ]]
      --[[   return vim_item ]]
      --[[ end ]]
    })
  },

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  experimental = {
    ghost_text = true,
  },
}
