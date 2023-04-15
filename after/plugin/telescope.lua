local status, telescope = pcall(require, "telescope")
if not status then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {

  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "truncate" },
    file_ignore_patterns = { '.git/', 'dist/', 'public/js' },
    mappings = {
      n = {
        ["q"] = actions.close,
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
  extensions = {
    file_browser = {
      theme             = "dropdown",
      hijack_netrw      = true,
      path              = "%:p:h",
      select_buffer     = true,
      cwd               = telescope_buffer_dir(),
      respect_gitignore = false,
      hidden            = true,
      grouped           = true,
      previewer         = false,
      initial_mode      = "normal",
      layout_config     = { height = 40 },
      mappings          = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["h"] = fb_actions.goto_parent_dir
        },
      }
    }
  },

  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    buffers = {
      mappings = {
        ["n"] = {
          ["<Tab>"] = actions.delete_buffer
        },
      }
    },
    find_files = {
      hidden = true,
      --[[ theme = "dropdown", ]]
    },
    live_grep = {
      theme = "dropdown"
    },
  },

}

telescope.load_extension 'file_browser'

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<c-p>', builtin.find_files, opts)
vim.keymap.set('n', '<leader>ft', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
--[[ vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts) ]]
vim.keymap.set("n", "<leader>e", telescope.extensions.file_browser.file_browser, opts)
