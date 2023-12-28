return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    keys = {
        { "<leader>ti", ":IBLToggle<cr>", desc = "IndentBlankline" },
    },
    ft = { "python" },
    config = function()
        local ibl = require("ibl")
        ibl.setup({
            enabled = true,
            indent = { char = "▏" },
            scope = {
                show_start = false,
                show_end = false,
            },
        })
    end,
}
