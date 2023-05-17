-- :help options
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.pumheight = 5
vim.opt.relativenumber = false
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.showmode = true
vim.opt.showtabline = 1
vim.opt.sidescrolloff = 10
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 1000
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.wrap = false
vim.opt.writebackup = false
vim.opt.backspace = "indent,eol,start"

--[[ vim.opt.list = true ]]
--[[ vim.opt.listchars:append "eol:⏎" ]]
vim.opt.shortmess:append "c"
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
