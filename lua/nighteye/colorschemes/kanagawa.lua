local status_ok, kanagawa = pcall(require, 'kanagawa')
if not status_ok then return end

-- Default options:
kanagawa.setup({
  undercurl = true, -- enable undercurls
  commentStyle = { italic = false },
  functionStyle = {},
  keywordStyle = { bold = true },
  statementStyle = { bold = false },
  typeStyle = {},
  variablebuiltinStyle = { italic = true },
  specialReturn = true,    -- special highlight for the return keyword
  specialException = true, -- special highlight for exception handling keywords
  transparent = true,      -- do not set background color
  dimInactive = false,     -- dim inactive window `:h hl-NormalNC`
  globalStatus = false,    -- adjust window separators highlight for laststatus=3
  terminalColors = true,   -- define vim.g.terminal_color_{0,17}
  colors = {},
  overrides = {},
  theme = "default" -- Load "default" theme or the experimental "light" theme
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
