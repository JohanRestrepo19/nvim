return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                --- @usage 'auto'|'main'|'moon'|'dawn'
                variant = "main",
                --- @usage 'main'|'moon'|'dawn'
                dark_variant = "main",
                bold_vert_split = false,
                dim_nc_background = false,
                disable_background = true,
                disable_float_background = false,
                disable_italics = true,

                --- @usage string hex value or named color from rosepinetheme.com/palette
                groups = {
                    background = "none",
                    background_nc = "_experimental_nc",
                    panel = "surface",
                    panel_nc = "base",
                    border = "highlight_med",
                    comment = "muted",
                    link = "iris",
                    punctuation = "subtle",

                    error = "love",
                    hint = "iris",
                    info = "foam",
                    warn = "gold",

                    headings = {
                        h1 = "iris",
                        h2 = "foam",
                        h3 = "rose",
                        h4 = "gold",
                        h5 = "pine",
                        h6 = "foam",
                    },
                },

                -- Change specific vim highlight groups
                -- https://github.com/rose-pine/neovim/wiki/Recipes
                highlight_groups = {
                    ColorColumn = { bg = "rose" },

                    -- Blend colours against the "base" background
                    StatusLine = { fg = "text", bg = "base", blend = 10 },

                    -- Transparent Telescope
                    TelescopeBorder = { fg = "highlight_high", bg = "none" },
                    TelescopeNormal = { bg = "none" },
                    TelescopePromptNormal = { bg = "base" },
                    TelescopeResultsNormal = { fg = "subtle", bg = "none" },
                    TelescopeSelection = { fg = "text", bg = "base" },
                },
            })

            vim.opt.termguicolors = false
            vim.cmd.colorscheme("rose-pine")
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            -- Default options:
            require("kanagawa").setup({
                compile = true, -- enable compiling the colorscheme
                undercurl = true, -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = { bold = true, italic = true },
                keywordStyle = { bold = true, italic = false },
                statementStyle = { bold = false, italic = false },
                typeStyle = { bold = true, italic = true },
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
                        CursorLineNr = { fg = palette.dragonBlue },
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
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            local tn = require("tokyonight")

            tn.setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                light_style = "day", -- The theme is used when the background is set to light
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = {},
                    functions = { bold = false },
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "transparent", -- style for sidebars, see below
                    floats = "transparent", -- style for floating windows
                },
                sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
                day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
                hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
                dim_inactive = false, -- dims inactive windows
                lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

                --- You can override specific color groups to use other groups or a hex color
                --- function will be called with a ColorScheme table
                ---@param colors ColorScheme
                on_colors = function(_) end,

                --- You can override specific highlights to use other groups or a hex color
                --- function will be called with a Highlights and ColorScheme table
                ---@param highlights Highlights
                ---@param colors ColorScheme
                on_highlights = function(highlights, colors)
                    highlights.NormalFloat = { bg = colors.bg_dark }
                    highlights.DiagnosticVirtualTextError = { bg = colors.none, fg = colors.error }
                    highlights.DiagnosticVirtualTextWarn = { bg = colors.none, fg = colors.warning }
                    highlights.DiagnosticVirtualTextInfo = { bg = colors.none, fg = colors.info }
                    highlights.DiagnosticVirtualTextHint = { bg = colors.none, fg = colors.hint }
                    highlights.LineNr = { fg = colors.dark5 }
                    highlights.CursorLineNr = { fg = colors.orange }
                end,
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    },
}
