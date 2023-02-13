local status_ok, vscode = pcall(require, 'vscode')
if not status_ok then return end

local color_status, colors = pcall(require, 'vscode.colors')
if not color_status then return end

local c = colors.get_colors()

vscode.setup({
  -- Enable transparent background
  transparent = true,

  -- Enable italic comment
  italic_comments = true,

  -- Disable nvim-tree background color
  disable_nvimtree_bg = true,

  -- Override colors (see ./lua/vscode/colors.lua)
  color_overrides = {
  },

  -- Override highlight groups (see ./lua/vscode/theme.lua)
  group_overrides = {
  }
})
