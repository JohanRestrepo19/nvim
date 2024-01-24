return {
    "rebelot/heirline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local conditions = require("heirline.conditions")
        local utils = require("heirline.utils")

        local ViMode = {
            static = {
                mode_colors = {
                    n = "red",
                    i = "green",
                    v = "cyan",
                    V = "cyan",
                    ["\22"] = "cyan",
                    c = "orange",
                    s = "purple",
                    S = "purple",
                    ["\19"] = "purple",
                    R = "orange",
                    r = "orange",
                    ["!"] = "red",
                    t = "red",
                },
            },
            update = {
                "ModeChanged",
                pattern = "*:*",
                callback = vim.schedule_wrap(function()
                    vim.cmd("redrawstatus")
                end),
            },
            init = function(self)
                self.mode = vim.fn.mode()
            end,
            hl = function(self)
                local mode = self.mode
                return { fg = self.mode_colors[mode], bold = true }
            end,
            provider = function(self)
                return " %1(" .. self.mode .. "%)"
            end,
        }

        local FilenameBlock = {
            init = function(self)
                self.filename = vim.api.nvim_buf_get_name(0)
            end,
        }

        local FileIcon = {
            init = function(self)
                local filename = self.filename
                local extension = vim.fn.fnamemodify(filename, ":e")
                self.icon, self.icon_color =
                    require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
            end,
            hl = function(self)
                return { fg = self.icon_color }
            end,
            provider = function(self)
                return self.icon and (self.icon .. " ")
            end,
        }

        local FilenameModifier = {
            hl = function()
                if vim.bo.modified then
                    return { fg = "cyan", bold = true, force = true }
                end
            end,
        }

        local Filename = {
            hl = { fg = utils.get_highlight("Directory").fg },
            provider = function(self)
                local filename = vim.fn.fnamemodify(self.filename, ":.")
                if filename == "" then
                    return
                end

                if not conditions.width_percent_below(#filename, 0.25) then
                    filename = vim.fn.pathshorten(filename)
                end

                return filename
            end,
        }

        local FileFlags = {
            {
                condition = function()
                    return vim.bo.modified
                end,
                provider = "[+] ",
            },
            {
                condition = function()
                    return not vim.bo.modifiable or vim.bo.readonly
                end,
                provider = " ",
                hl = { fg = "orange" },
            },
        }

        -- stylua: ignore
        FilenameBlock = utils.insert(
            FilenameBlock,
            FileFlags,
            FileIcon,
            utils.insert(FilenameModifier, Filename),
            { provider = "%<"}
        )

        local FileType = {
            provider = function()
                return string.upper(vim.bo.filetype)
            end,
            hl = { fg = utils.get_highlight("Type").fg, bold = true },
        }

        local FileEncoding = {
            provider = function()
                local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
                return enc:upper()
            end,
        }

        local Ruler = {
            -- %l = current line number
            -- %L = number of lines in the buffer
            -- %c = column number
            -- %P = percentage through file of displayed window
            -- provider = "%7(%l/%3L%):%2c %P",
            provider = "Ln %l, Col %c",
        }

        local Diagnostics = {
            static = {
                error_icon = " ",
                warn_icon = " ",
                info_icon = " ",
                hint_icon = " ",
            },
            update = { "DiagnosticChanged", "BufEnter" },
            init = function(self)
                self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
                self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
                self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
                self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
            end,
            {
                hl = { fg = "diag_error" },
                provider = function(self)
                    return (self.error_icon .. self.errors .. " ")
                end,
            },
            {
                hl = { fg = "diag_warn" },
                provider = function(self)
                    return (self.warn_icon .. self.warnings .. " ")
                end,
            },
            {
                hl = { fg = "diag_info" },
                provider = function(self)
                    return (self.info_icon .. self.info .. " ")
                end,
            },
            {
                hl = { fg = "diag_hint" },
                provider = function(self)
                    return (self.hint_icon .. self.hints)
                end,
            },
        }

        local Git = {
            condition = conditions.is_git_repo,
            init = function(self)
                self.status_dict = vim.b.gitsigns_status_dict
                self.has_changes = self.status_dict.added ~= 0
                    or self.status_dict.removed ~= 0
                    or self.status_dict.changed ~= 0
            end,
            { -- git branch name
                provider = function(self)
                    return " " .. self.status_dict.head
                end,
            },
            {
                condition = function(self)
                    return self.has_changes
                end,
                provider = "(",
            },
            {
                hl = { fg = "git_add" },
                provider = function(self)
                    local count = self.status_dict.added or 0
                    return count > 0 and ("+" .. count)
                end,
            },
            {
                hl = { fg = "git_del" },
                provider = function(self)
                    local count = self.status_dict.removed or 0
                    return count > 0 and ("-" .. count)
                end,
            },
            {
                hl = { fg = "git_change" },
                provider = function(self)
                    local count = self.status_dict.changed or 0
                    return count > 0 and ("~" .. count)
                end,
            },
            {
                condition = function(self)
                    return self.has_changes
                end,
                provider = ")",
            },
        }

        local Align = { provider = "%=" }
        local Space = { provider = " " }

        -- stylua: ignore
        local LeftBlock = { ViMode, Space, Git, Space, Diagnostics, Space }
        local CenterBlock = { FilenameBlock, Space }
        local RightBlock = { Ruler, Space, FileEncoding, Space, FileType }

        -- stylua: ignore
        local StatusLine = {
            LeftBlock,
            Align,
            CenterBlock,
            Align,
            RightBlock
        }

        local function setup_colors()
            return {
                bright_bg = utils.get_highlight("Folded").bg,
                bright_fg = utils.get_highlight("Folded").fg,
                red = utils.get_highlight("DiagnosticError").fg,
                dark_red = utils.get_highlight("DiffDelete").bg,
                green = utils.get_highlight("String").fg,
                blue = utils.get_highlight("Function").fg,
                gray = utils.get_highlight("NonText").fg,
                orange = utils.get_highlight("Constant").fg,
                purple = utils.get_highlight("Statement").fg,
                cyan = utils.get_highlight("Special").fg,
                diag_warn = utils.get_highlight("DiagnosticWarn").fg,
                diag_error = utils.get_highlight("DiagnosticError").fg,
                diag_hint = utils.get_highlight("DiagnosticHint").fg,
                diag_info = utils.get_highlight("DiagnosticInfo").fg,
                git_del = utils.get_highlight("diffRemoved").fg,
                git_add = utils.get_highlight("diffAdded").fg,
                git_change = utils.get_highlight("diffChanged").fg,
            }
        end

        local heirline = require("heirline")
        heirline.load_colors(setup_colors)
        heirline.setup({
            statusline = { StatusLine },
        })

        vim.api.nvim_create_augroup("Heirline", { clear = true })
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                utils.on_colorscheme(setup_colors)
            end,
            group = "Heirline",
        })
    end,
}
