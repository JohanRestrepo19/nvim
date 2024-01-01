return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
        local rose_pine = require("rose-pine")
        rose_pine.setup({
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
                -- or set all headings at once
                -- headings = 'subtle'
            },

            -- Change specific vim highlight groups
            -- https://github.com/rose-pine/neovim/wiki/Recipes
            highlight_groups = {
                ColorColumn = { bg = "rose" },

                -- Blend colours against the "base" background
                StatusLine = { fg = "pine", bg = "muted", blend = 10 },

                -- By default each group adds to the existing config.
                -- If you only want to set what is written in this config exactly,
                -- you can set the inherit option:
                -- Search = { bg = 'highlight_med', inherit = true },

                -- Transparent Telescope
                TelescopeBorder = { fg = "highlight_high", bg = "none" },
                TelescopeNormal = { bg = "none" },
                TelescopePromptNormal = { bg = "base" },
                TelescopeResultsNormal = { fg = "subtle", bg = "none" },
                TelescopeSelection = { fg = "text", bg = "base" },
                TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
            },
        })

        vim.cmd.colorscheme("rose-pine")
    end,
}
