-- vim.cmd "colorscheme gruvbox-material"

local colorscheme = "onedarker"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- Transparent background
-- vim.cmd([[
-- highlight Normal guibg=none
-- highlight NonText guibg=none
-- ]])
