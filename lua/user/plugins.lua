local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { 'wbthomason/packer.nvim', commit = '' } -- Have packer manage itself
  use { 'nvim-lua/popup.nvim', commit = '' } -- An implementation of the Popup API from vim in Neovim
  use { 'windwp/nvim-autopairs', commit = '' }
  use { 'numToStr/Comment.nvim', commit = '' }
  use { 'JoosepAlviste/nvim-ts-context-commentstring', commit = ''}
  use { 'kyazdani42/nvim-tree.lua', commit = '' }
  use { 'akinsho/bufferline.nvim', commit = '' }
  use { 'nvim-lualine/lualine.nvim', commit = '' }
  use { 'akinsho/toggleterm.nvim', commit = '' }
  use { 'andweeb/presence.nvim', commit = '' }

  -- Dependencies
  use { 'nvim-lua/plenary.nvim', commit = '' } -- Useful lua functions used ny lots of plugins
  use { 'kyazdani42/nvim-web-devicons', commit = '' }

  -- Colorschemes
  use { 'lunarvim/colorschemes', commit = '' }
  use { 'lunarvim/darkplus.nvim', commit = '' }
  use { 'sainnhe/gruvbox-material', commit = '' }
  use { 'Mofiqul/vscode.nvim', commit = '' }
  use { 'marko-cerovac/material.nvim', commit = '' }
  use { 'folke/tokyonight.nvim', commit = '' }

  -- cmp plugins
  use { 'hrsh7th/nvim-cmp', commit = '' } -- The completion plugin
  use { 'hrsh7th/cmp-buffer', commit = '' } -- buffer completions
  use { 'hrsh7th/cmp-path', commit = '' } -- path completions
  use { 'saadparwaiz1/cmp_luasnip', commit = '' } -- snippet completions
  use { 'hrsh7th/cmp-nvim-lsp', commit = '' }
  use { 'hrsh7th/cmp-nvim-lua', commit = '' }

  -- snippets
  use { 'L3MON4D3/LuaSnip', commit = '' } --snippet engine
  use { 'rafamadriz/friendly-snippets', commit = '' } -- a bunch of snippets to use

  -- LSP
  use { 'neovim/nvim-lspconfig', commit = '' } --enable LSP
  use { 'williamboman/nvim-lsp-installer', commit = '' } --simple to use lenguage server installer
  use { 'jose-elias-alvarez/null-ls.nvim', commit = '' } --Formatting
  use { 'ray-x/lsp_signature.nvim', commit = '' }
  use { 'tami5/lspsaga.nvim', commit = '' }


  --Telescope
  use { 'nvim-telescope/telescope.nvim', commit = '' }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use { 'windwp/nvim-ts-autotag', commit = '' }

  -- Git
  use { 'lewis6991/gitsigns.nvim', commit = '' }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
