local status, nvim_tree = pcall(require, "nvim-tree")
if not status then return end

local config_status, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status then return end

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

local tree_cb = nvim_tree_config.nvim_tree_callback

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  sort_by = "name",
  update_cwd = false,


  view = {
    adaptive_size = true,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        { key = { "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h",             cb = tree_cb "close_node" },
        { key = "v",             cb = tree_cb "vsplit" },
        { key = "sl",            cb = "<C-w>l" }
      },
    },
    float = {
      enable = false,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2)
            - vim.opt.cmdheight:get()
        return {
          border = 'rounded',
          relative = 'editor',
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
      end,
      --[[ open_win_config = { ]]
      --[[   relative = "editor", ]]
      --[[   border = "rounded", ]]
      --[[   width = 30, ]]
      --[[   height = 30, ]]
      --[[   row = 1, ]]
      --[[   col = 1, ]]
      --[[ }, ]]
    },
    width = function()
      return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    end,
  },


  renderer = {
    add_trailing = false,
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      }
    },
  },

  hijack_directories = {
    enable = true,
    auto_open = true,
  },

  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },

  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },

  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },

  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },

  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = true,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },

  trash = {
    cmd = "trash",
    require_confirm = true,
  },

  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },

} -- END_DEFAULT_OPTS

--[[ local opts = { noremap = true, silent = true } ]]
--[[ vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", opts) ]]
