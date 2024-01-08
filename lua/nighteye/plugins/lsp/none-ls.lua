return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics

        null_ls.setup({
            sources = {
                -- Formatters
                formatting.autopep8,
                formatting.prettierd,
                formatting.stylua,

                -- Diagnostics
                diagnostics.flake8,
                diagnostics.eslint_d.with({
                    condition = function(utils)
                        return utils.root_has_file({
                            ".eslintrc.js",
                            ".eslintrc.cjs",
                            "eslintrc.yaml",
                            "eslintrc.yml",
                            "eslintrc.json",
                            ".eslintrc.json",
                        })
                    end,
                    diagnostics_format = "[eslint] #{m}\n(#{c})",
                }),
            },
        })
    end,
}
