local status, ts = pcall(require, 'nvim-treesitter.configs')
if not status then return end

ts.setup {

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },


  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },

  indent = {
    enable = true,
    disable = { 'yaml' }
  },

  ensure_installed = {
    'lua',
    'c',
    'css',
    'gitcommit',
    'help',
    'html',
    'javascript',
    'json',
    'markdown',
    'markdown_inline',
    'php',
    'prisma',
    'python',
    'typescript',
    'tsx',
    'vim',
    'vimdoc',
    'yaml',
  },

  autotag = {
    enable = true
  },

  ignore_install = { '' }, -- List of parsers to ignore installing
}
