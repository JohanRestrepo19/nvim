-- Fixes Autocomment in newlines
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        vim.cmd("set formatoptions-=cro")
    end,
})

-- Set wrap for markdown files
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    pattern = { "*.md", "*.mdx" },
    callback = function()
        vim.cmd("set wrap")
    end,
})
