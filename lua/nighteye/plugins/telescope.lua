return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
        end

        local fb_actions = require("telescope").extensions.file_browser.actions

        telescope.setup({
            -- layout_strategies.center()

            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                path_display = { "truncate" },
                file_ignore_patterns = { ".git/", "^dist/", ".nuxt/", "^public/" },
                layout_strategy = "horizontal",
                layout_config = {
                    prompt_position = "top",
                },
                mappings = {
                    n = {
                        ["q"] = actions.close,
                        ["sv"] = actions.select_vertical,
                        ["ss"] = actions.select_horizontal,
                    },
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-c>"] = actions.close,
                        ["<CR>"] = actions.select_default,
                        ["<C-l>"] = actions.complete_tag,
                    },
                },
            },

            pickers = {
                -- Default configuration for builtin pickers goes here:
                buffers = {
                    mappings = {
                        ["n"] = {
                            ["<Tab>"] = actions.delete_buffer,
                        },
                    },
                    initial_mode = "normal",
                },
                find_files = { hidden = true },
                lsp_references = {
                    theme = "ivy",
                    initial_mode = "normal",
                    layout_config = {
                        height = 0.5,
                    },
                },
            },

            extensions = {
                file_browser = {
                    cwd = telescope_buffer_dir(),
                    grouped = true,
                    hidden = true,
                    hijack_netrw = true,
                    initial_mode = "normal",
                    path = "%:p:h",
                    previewer = false,
                    respect_gitignore = false,
                    select_buffer = true,
                    theme = "dropdown",
                    layout_config = { height = 40, prompt_position = "bottom" },
                    mappings = {
                        ["i"] = {
                            -- your custom insert mode mappings
                        },
                        ["n"] = {
                            -- your custom normal mode mappings
                            ["h"] = fb_actions.goto_parent_dir,
                        },
                    },
                },
                ["ui-select"] = { initial_mode = "normal" },
            },
        })

        telescope.load_extension("file_browser")
        telescope.load_extension("ui-select")

        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<c-p>", builtin.find_files, opts)
        vim.keymap.set("n", "<leader>ft", builtin.live_grep, opts)
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
        vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
        vim.keymap.set("n", "<leader>e", telescope.extensions.file_browser.file_browser, opts)
        vim.keymap.set("n", "<leader>gr", builtin.lsp_references, opts)
    end,
}
