return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },
  keys = {
    {
      "<leader>nt",
      ":Neotree toggle<cr>",
      desc = "NeoTree",
      silent = true,
      noremap = true

    }
  },
  opts = {
    close_if_last_window = true,
    window = {
      mappings = {},
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false
      }
    }
  }
}
