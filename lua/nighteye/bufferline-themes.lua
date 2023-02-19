local themes = {
  mocha = {
    separator = {
      fg = '#2c2d3d', -- Unselected buffer separator color (upper triangle side)
      bg = '#181825' -- Unsleected buffer separator color (lower triangle side)
    },
    separator_selected = {
      fg = '#2c2d3d', --Selected buffer separator color
    },
    background = {
      fg = '#9f9fa3', -- Unselected buffer text color
      bg = "#181825", -- Unselected buffer background (inner rectangle)
    },
    buffer_selected = {
      fg = '#dfdfe0', -- Selected buffer text color
      bold = true,
    },
    fill = {
      bg = '#2c2d3d' -- Extra space for other tabs
    }
  },
  neosolarized = {
    separator = {
      fg = '#073642',
      bg = '#002b36'
    },
    separator_selected = {
      fg = '#073642'
    },
    background = {
      fg = '#657b83',
      bg = '#002b36'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true
    },
    fill = {
      bg = '#073642'
    }
  },
  gruvbox = {
    separator = {
      fg = '#242424',
      bg = '#3d3d3d'
    },
    separator_selected = {
      fg = '#242424'
    },
    background = {
      fg = '#fdf6e3',
      bg = '#3d3d3d'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true
    },
    fill = {
      bg = '#242424'
    }
  },
  onedark_pro = {
    separator = {
      fg = '#242424',
      bg = '#282C34'
    },
    separator_selected = {
      fg = '#242424'
    },
    background = {
      fg = '#9BA0AB',
      bg = '#282C34'
    },
    buffer_selected = {
      fg = '#9BA0AB',
      bold = true
    },
    fill = {
      bg = '#242424'
    }
  },
  kanagawa = {
    separator = {
      fg = '#2a2a37', -- Unselected buffer separator color (upper triangle side)
      bg = '#1f1f28' -- Unsleected buffer separator color (lower triangle side)
    },
    separator_selected = {
      fg = '#2a2a37', --Selected buffer separator color
    },
    background = {
      fg = '#717C7C', -- Unselected buffer text color
      bg = '#1f1f28' -- Unselected buffer background (inner rectangle)
    },
    buffer_selected = {
      fg = '#dcd7ba', -- Selected buffer text color
      bold = true
    },
    fill = {
      bg = '#2A2A37' -- Extra space for other tabs
    }
  },
  nightfox = {
    separator = {
      fg = '#29394f',
      bg = '#192330'
    },
    separator_selected = {
      fg = '#29394f',
    },
    background = {
      fg = '#717C7C',
      bg = '#192330'
    },
    buffer_selected = {
      fg = '#dfdfe0',
      bold = true,
      italic = true
    },
    fill = {
      bg = '#29394f'
    }
  },
  empty = {}
}

return themes
