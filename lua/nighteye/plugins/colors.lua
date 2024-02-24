---@diagnostic disable: undefined-doc-name, undefined-field, inject-field, undefined-doc-param

return {
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            local solarized_osaka = require("solarized-osaka")
            solarized_osaka.setup({
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = true },
                    keywords = { bold = true, italic = false },
                    functions = { bold = true, italic = true },
                    variables = {},
                    sidebars = "transparent",
                    floats = "transparent",
                },
                sidebars = { "qf", "help" },
                day_brightness = 0.3,
                hide_inactive_statusline = false,
                dim_inactive = false,
                lualine_bold = false,

                --- @param colors ColorScheme
                on_colors = function() end,

                ---@param highlights Highlights
                ---@param colors ColorScheme
                on_highlights = function(highlights, colors)
                    highlights.NormalFloat = { bg = colors.bg_dark }
                    highlights.DiagnosticVirtualTextError = { bg = colors.none, fg = colors.error }
                    highlights.DiagnosticVirtualTextWarn = { bg = colors.none, fg = colors.warning }
                    highlights.DiagnosticVirtualTextInfo = { bg = colors.none, fg = colors.info }
                    highlights.DiagnosticVirtualTextHint = { bg = colors.none, fg = colors.hint }
                    highlights.StatusLine = { bg = colors.base03, fg = colors.none }
                    highlights.TelescopeSelection = { bg = colors.base03 }
                end,
            })
            vim.cmd.colorscheme("solarized-osaka")
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = true,
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                variant = "auto", -- auto, main, moon, or dawn
                dark_variant = "main", -- main, moon, or dawn
                dim_inactive_windows = false,
                extend_background_behind_borders = true,

                styles = {
                    bold = true,
                    italic = false,
                    transparency = true,
                },

                groups = {
                    border = "muted",
                    link = "iris",
                    panel = "surface",

                    error = "love",
                    hint = "iris",
                    info = "foam",
                    warn = "gold",

                    git_add = "pine",
                    git_change = "rose",
                    git_delete = "love",
                    git_dirty = "rose",
                    git_ignore = "muted",
                    git_merge = "iris",
                    git_rename = "pine",
                    git_stage = "iris",
                    git_text = "rose",
                    git_untracked = "subtle",

                    headings = {
                        h1 = "iris",
                        h2 = "foam",
                        h3 = "rose",
                        h4 = "gold",
                        h5 = "pine",
                        h6 = "foam",
                    },
                },
                highlight_groups = {
                    DiffAdd = { fg = "foam" },
                    DiffChange = { fg = "rose" },
                    DiffDelete = { fg = "love" },
                    StatusLine = { bg = "overlay" },
                },
            })

            vim.cmd.colorscheme("rose-pine")
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        priority = 1000,
        config = function()
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
                        CursorLineNr = { fg = palette.fujiWhite },

                        -- StatusLine
                        StatusLine = { bg = theme.ui.bg_gutter, fg = theme.ui.fg },
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
            vim.cmd.colorscheme("kanagawa-dragon")
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
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
                    keywords = { bold = true, italic = false },
                    functions = { bold = true, italic = true },
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
                    highlights.WinSeparator = { fg = colors.fg }
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
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = true, -- disables setting the background color.
                show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
                term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = false, -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15, -- percentage of the shade to apply to the inactive window
                },
                no_italic = false, -- Force no italic
                no_bold = false, -- Force no bold
                no_underline = false, -- Force no underline
                styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" }, -- Change the style of comments
                    conditionals = { "italic" },
                    loops = {},
                    functions = { "bold" },
                    keywords = {},
                    strings = { "italic" },
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = { "bold" },
                    operators = {},
                },
                color_overrides = {},
                custom_highlights = {},
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = false,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
            })

            -- setup must be called before loading
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nightfox").setup({
                options = {
                    -- Compiled file's destination location
                    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                    compile_file_suffix = "_compiled", -- Compiled file suffix
                    transparent = true, -- Disable setting background
                    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                    dim_inactive = false, -- Non focused panes set to alternative background
                    module_default = true, -- Default enable value for modules
                    colorblind = {
                        enable = false, -- Enable colorblind support
                        simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
                        severity = {
                            protan = 0, -- Severity [0,1] for protan (red)
                            deutan = 0, -- Severity [0,1] for deutan (green)
                            tritan = 0, -- Severity [0,1] for tritan (blue)
                        },
                    },
                    styles = { -- Style to be applied to different syntax groups
                        comments = "italic", -- Value is any valid attr-list value `:help attr-list`
                        conditionals = "NONE",
                        constants = "NONE",
                        functions = "italic,bold",
                        keywords = "NONE",
                        numbers = "NONE",
                        operators = "NONE",
                        strings = "NONE",
                        types = "italic,bold",
                        variables = "NONE",
                    },
                    inverse = { -- Inverse highlight for different types
                        match_paren = false,
                        visual = false,
                        search = false,
                    },
                    modules = { -- List of various plugins and additional options
                        -- ...
                    },
                },
                palettes = {},
                specs = {},
                groups = {
                    all = {
                        CursorLine = { bg = "none" },
                        CursorLineNr = { fg = "palette.cyan" },
                        DiagnosticVirtualTextError = { bg = "none" },
                        DiagnosticVirtualTextHint = { bg = "none" },
                        DiagnosticVirtualTextInfo = { bg = "none" },
                        DiagnosticVirtualTextWarn = { bg = "none" },
                        WinSeparator = { fg = "palette.blue" },
                    },
                },
            })
            vim.cmd.colorscheme("nordfox")
        end,
    },
}
