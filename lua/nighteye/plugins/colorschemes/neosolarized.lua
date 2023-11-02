return {
  "svrana/neosolarized.nvim",
  dependencies = { "tjdevries/colorbuddy.vim" },
  lazy = true,
  priority = 1000,
  config = function()
    local neosolarized = require("neosolarized")

    neosolarized.setup({
      comment_italics = true,
    })

    local Color, colors, Group, groups, styles = require("colorbuddy").setup()

    Color.new('white', '#ffffff')
    Color.new('black', '#000000')
    Group.new('Normal', colors.base1, colors.none, styles.none)
    Group.new('CursorLine', colors.none, colors.base03, styles.none, colors.base1)
    Group.new('CursorLineNr', colors.yellow, colors.black, styles.none, colors.base1)
    Group.new('Visual', colors.none, colors.base03, styles.reverse)
    Group.new('NormalFloat', colors.base1, colors.none, styles.none)

    local cError = groups.Error.fg
    local cInfo = groups.Information.fg
    local cWarn = groups.Warning.fg
    local cHint = groups.Hint.fg

    Group.new("DiagnosticVirtualTextError", cError, colors.none, styles.none)
    Group.new("DiagnosticVirtualTextInfo", cInfo, colors.none, styles.none)
    Group.new("DiagnosticVirtualTextWarn", cWarn, colors.none, styles.none)
    Group.new("DiagnosticVirtualTextHint", cHint, colors.none, styles.none)
    Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
    Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
    Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
    Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)

    Group.new("HoverBorder", colors.yellow, colors.none, styles.none)
  end,
}
