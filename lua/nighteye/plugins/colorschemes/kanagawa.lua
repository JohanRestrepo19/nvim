return {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
    config = function()
        -- Default options:
        require("kanagawa").setup({
            compile = true,  -- enable compiling the colorscheme
            undercurl = true, -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = { bold = true, italic = true },
            keywordStyle = { bold = true, italic = false },
            statementStyle = { bold = false, italic = false },
            typeStyle = { bold = true, italic = true },
            transparent = true,    -- do not set background color
            dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
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

                local borders_color = palette.katanaGray

                return {
                    Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
                    PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                    PmenuSbar = { bg = theme.ui.bg_m1 },
                    PmenuThumb = { bg = theme.ui.bg_p2 },

                    -- FLoating Windows
                    NormalFloat = { bg = "none", fg = borders_color },
                    FloatBorder = { fg = borders_color, bg = "none" },
                    FloatTitle = { bg = "none" },
                    NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                    -- Borders
                    WinSeparator = { fg = borders_color },
                    TelescopeBorder = { fg = borders_color, bg = "none" },

                    -- CursorLine
                    CursorLineNr = { fg = palette.dragonBlue }
                }
            end,
            theme = "wave", -- Load "wave" theme when 'background' option is not set
            background = {
                -- map the value of 'background' option to a theme
                dark = "wave", -- try "dragon" !
                light = "lotus",
            },
        })

        -- setup must be called before loading
        vim.cmd.colorscheme("kanagawa")
    end,
}
