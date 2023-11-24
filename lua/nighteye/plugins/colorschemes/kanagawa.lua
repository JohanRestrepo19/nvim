return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local kanagawa = require("kanagawa")

    -- Default options:
    kanagawa.setup({
      compile = true, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = { bold = true, italic = false },
      keywordStyle = { bold = false, italic = false },
      statementStyle = { bold = false, italic = false },
      typeStyle = { bold = true },
      transparent = true, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {
        -- add/modify theme and palette colors
        palette = {},
        theme = {
          wave = {},
          lotus = {},
          dragon = {},
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors) -- add/modify highlights
        local palette = colors.palette
        local theme = colors.theme
        return {
          Pmenu = {
            fg = theme.ui.shade0,
            bg = theme.ui.bg_p1,
            blend = vim.o.pumblend,
          }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },

          -- FLoating Windows
          NormalFloat = { bg = palette.sumiInk3 },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
        }
      end,
      theme = "wave", -- Load "wave" theme when 'background' option is not set
      background = {
        -- map the value of 'background' option to a theme
        dark = "dragon", -- try "dragon" !
        light = "lotus",
      },
    })

    -- setup must be called before loading
    vim.cmd.colorscheme("kanagawa")
  end,
}
