-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status, packer = pcall(require, "packer")
if not status then return end

-- Install your plugins here
return packer.startup({
  function(use)
    -- Utils
    use { 'wbthomason/packer.nvim' } -- Have packer manage itself
    use { 'nvim-lua/popup.nvim' }    -- An implementation of the Popup API from vim in Neovim
    use { 'windwp/nvim-autopairs' }
    use { 'numToStr/Comment.nvim' }
    use { 'JoosepAlviste/nvim-ts-context-commentstring' }
    use { 'akinsho/bufferline.nvim' }
    use { 'nvim-lualine/lualine.nvim' }
    use { 'norcalli/nvim-colorizer.lua' }
    use { 'onsails/lspkind-nvim' }
    use { 'gpanders/editorconfig.nvim' }
    use { 'folke/todo-comments.nvim' }
    use { 'rest-nvim/rest.nvim' }

    -- Dependencies
    use { 'nvim-lua/plenary.nvim' } -- Useful lua functions used ny lots of plugins
    use { 'nvim-tree/nvim-web-devicons' }

    -- Colorschemes
    use {
      'svrana/neosolarized.nvim',
      requires = { 'tjdevries/colorbuddy.nvim' }
    }
    use { 'rebelot/kanagawa.nvim' }
    use { 'folke/tokyonight.nvim' }
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use { 'ellisonleao/gruvbox.nvim' }
    use { 'folke/tokyonight.nvim' }

    -- cmp plugins
    use { 'hrsh7th/nvim-cmp' }         -- The completion plugin
    use { 'hrsh7th/cmp-buffer' }       -- buffer completions
    use { 'hrsh7th/cmp-path' }         -- path completions
    use { 'hrsh7th/cmp-cmdline' }      --cmdline completions
    use { 'saadparwaiz1/cmp_luasnip' } -- snippet completions
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-nvim-lua' }
    use { 'hrsh7th/cmp-emoji' }

    -- snippets
    use { 'L3MON4D3/LuaSnip' }             --snippet engine
    use { 'rafamadriz/friendly-snippets' } -- a bunch of snippets to use

    -- LSP
    use { 'neovim/nvim-lspconfig' }           --enable LSP
    use { 'williamboman/mason.nvim' }         --simple to use lenguage server installer
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 'jose-elias-alvarez/null-ls.nvim' } --Formatting
    use { 'nvimdev/lspsaga.nvim' }
    use { 'folke/lsp-colors.nvim' }

    --Telescope
    use { 'nvim-telescope/telescope.nvim' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
    }

    use { 'p00f/nvim-ts-rainbow' }

    use { 'windwp/nvim-ts-autotag' }

    -- Git
    use { 'lewis6991/gitsigns.nvim' }


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins

    ---@diagnostic disable-next-line: undefined-global
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end
    }
  }
})
