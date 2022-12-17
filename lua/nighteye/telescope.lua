local status, telescope = pcall(require, "telescope")
if not status then return end

telescope.load_extension 'file_browser'


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

    mappings = {
      n = {
        ["q"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,
        ["?"] = actions.which_key,
        ["<Tab>"] = actions.delete_buffer,
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
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    find_files = {
      hidden = true,
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown"
    },
    file_browser = {
      path = "%:p:h", -- start from within current buffer path
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      previewer = false,
      initial_mode = "normal",
      layout_config = { height = 40 }
    },
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    file_browser = {
      theme        = "dropdown",
      hijack_netrw = true,
      mappings     = {
        ['i'] = {
          -- your custom insert mode mappings
        },
        ['n'] = {
          -- your custom normal mode mappings
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
        },


      }
    }
  },
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<c-p>', builtin.find_files, opts)
vim.keymap.set('n', '<leader>ft', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)

--[[ vim.keymap.set("n", "<leader>e", function() ]]
--[[   telescope.extensions.file_browser.file_browser({ ]]
--[[     path = "%:p:h", ]]
--[[     cwd = telescope_buffer_dir(), ]]
--[[     respect_gitignore = false, ]]
--[[     hidden = true, ]]
--[[     grouped = true, ]]
--[[     previewer = false, ]]
--[[     initial_mode = "normal", ]]
--[[     layout_config = { height = 40 } ]]
--[[   }) ]]
--[[ end, opts) ]]
